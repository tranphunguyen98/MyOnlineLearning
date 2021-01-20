class UserGoogle {
  final String id;
  final String email;

  const UserGoogle({this.id, this.email});

  Map<String, dynamic> toJson() {
    final user = {
      'id': id,
      'email': email,
    };

    return {'user': user};
  }
}
