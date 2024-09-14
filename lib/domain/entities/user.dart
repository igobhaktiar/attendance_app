class User {
  final String id;
  final String name;
  final String email;
  final List<Attendance>? attendances;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.attendances,
  });
}

class Attendance {
  final String id;
  final String date;
  final String duration;
  final String checkIn;
  final String checkOut;
  final String status;

  Attendance({
    required this.id,
    required this.date,
    required this.duration,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}
