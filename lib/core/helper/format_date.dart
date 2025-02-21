import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget formatDateText(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat(
      'dd MMMM yyyy HH:mm',
      'id_ID',
    ).format(dateTime);

    List<String> parts = formattedDate.split(' ');
    String boldPart = '${parts[0]} ${parts[1]} ${parts[2]}';
    String normalPart = parts.length > 3 ? parts.sublist(3).join(' ') : '';

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$boldPart ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: normalPart),
        ],
      ),
    );
  } catch (e) {
    return const Text('Invalid date', style: TextStyle(color: Colors.red));
  }
}
