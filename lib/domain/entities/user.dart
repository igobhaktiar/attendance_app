class User {
  final String id;
  final String name;
  final String email;
  final bool? isPresent;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.isPresent,
  });
}