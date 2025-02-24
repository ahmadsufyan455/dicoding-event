import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_event/core/extensions/build_context_ext.dart';
import 'package:dicoding_event/core/helper/format_date.dart';
import 'package:dicoding_event/core/helper/get_event_status.dart';
import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/presentation/detail/bloc/detail_bloc.dart';
import 'package:dicoding_event/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:dicoding_event/presentation/widgets/error_message.dart';
import 'package:dicoding_event/presentation/widgets/shimmer/detail_event_shimmer.dart';
import 'package:dicoding_event/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(
      FavoriteEvent.loadFavoriteStatus(int.parse(widget.id)),
    );
    context.read<DetailBloc>().add(DetailEvent.started(int.parse(widget.id)));
    super.initState();
  }

  Future<void> _onRefresh() async {
    context.read<DetailBloc>().add(DetailEvent.started(int.parse(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    final isAddedToFavorite = context.select<FavoriteBloc, bool>(
      (bloc) => bloc.state.maybeWhen(
        favoriteStatus: (isFavorite) => isFavorite,
        orElse: () => false,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading:
                      () => SizedBox(
                        height: context.deviceHeight,
                        child: const DetailEventShimmer(),
                      ),
                  success:
                      (event) => _buildSuccessContent(event, isAddedToFavorite),
                  error:
                      (message) => SizedBox(
                        height: context.deviceHeight,
                        child: ErrorMessage(message: message),
                      ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessContent(EventEntity event, bool isFavorite) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(event),
        const SpaceHeight(140),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategory(event, isFavorite),
              _buildEventTitle(event.name),
              const SpaceHeight(10),
              _buildOrganizer(event.ownerName),
              const SpaceHeight(24),
              _buildEventStatus(event.endTime),
              const SpaceHeight(24),
              _buildSectionTitle('Deskripsi'),
              const SpaceHeight(16),
              Html(data: event.description),
              const SpaceHeight(16),
              _buildSectionTitle('Jadwal Pelaksanaan'),
              const SpaceHeight(16),
              _buildEventSchedule(event),
              const SpaceHeight(24),
              _buildSectionTitle('Lokasi'),
              const SpaceHeight(4),
              _buildLocation(event.cityName),
              const SpaceHeight(10),
              _buildRegistrationLink(event.link),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(EventEntity event) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: context.deviceWidth,
          height: context.deviceHeight * 0.2,
          child: CachedNetworkImage(
            imageUrl: event.mediaCover,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: Colors.black.withValues(alpha: 0.1)),
          ),
        ),
        Positioned(
          top: context.deviceHeight * 0.1,
          left: (context.deviceWidth / 2) - 100,
          child: Card(
            elevation: 18,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: event.imageLogo,
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategory(EventEntity event, bool isFavorite) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(event.category),
        ),
        const SpaceWidth(8),
        BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            state.maybeWhen(
              successMessage: (message) {
                context.read<FavoriteBloc>().add(
                  FavoriteEvent.loadFavoriteStatus(int.parse(widget.id)),
                );
              },
              failedMessage: (message) => {},
              orElse: () {},
            );
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (!isFavorite) {
                  context.read<FavoriteBloc>().add(
                    FavoriteEvent.addToFavorite(event),
                  );
                } else {
                  context.read<FavoriteBloc>().add(
                    FavoriteEvent.removeFromFavorite(event.id),
                  );
                }
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventTitle(String name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildOrganizer(String ownerName) {
    return Text(
      'Diselenggarakan oleh: $ownerName',
      style: const TextStyle(fontSize: 12),
    );
  }

  Widget _buildEventStatus(String endTime) {
    return Center(
      child: Text(
        getEventStatus(endTime),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 20));
  }

  Widget _buildEventSchedule(EventEntity event) {
    return Column(
      children: [
        _buildScheduleRow('Mulai', formatDateText(event.beginTime)),
        _buildScheduleRow('Selesai', formatDateText(event.endTime)),
      ],
    );
  }

  Widget _buildScheduleRow(String label, Widget timeWidget) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(label)),
        Expanded(child: Row(children: [const Text(': '), timeWidget])),
      ],
    );
  }

  Widget _buildLocation(String cityName) {
    return Row(
      children: [
        const Icon(Icons.location_on),
        const SpaceWidth(10),
        Text(cityName),
      ],
    );
  }

  Widget _buildRegistrationLink(String link) {
    return Row(
      children: [
        const Text('Daftar: '),
        GestureDetector(
          onTap: () => _launchURL(link),
          child: Text(
            link,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could no launch $url';
    }
  }
}
