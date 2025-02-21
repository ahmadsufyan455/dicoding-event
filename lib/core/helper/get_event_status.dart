String getEventStatus(String dateTime) {
  final endDate = DateTime.parse(dateTime);
  final now = DateTime.now();

  if (now.isBefore(endDate)) {
    return 'Event Segera Hadir';
  } else if (now.isAfter(endDate)) {
    return 'Event Telah Selesai';
  } else {
    return 'Event Sedang Berlangsung';
  }
}
