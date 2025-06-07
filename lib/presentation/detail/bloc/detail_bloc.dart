import 'package:dicoding_event/domain/entities/event_entity.dart';
import 'package:dicoding_event/domain/usecases/get_detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailEvent _getDetailEvent;
  DetailBloc({required GetDetailEvent getDetailEvent})
    : _getDetailEvent = getDetailEvent,
      super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const _Loading());
      final result = await _getDetailEvent.invoke(event.id);
      result.fold(
        (failure) => emit(_Error(failure.message)),
        (event) => emit(_Success(event)),
      );
    });
  }
}
