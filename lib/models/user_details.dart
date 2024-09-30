class UserDetails {
  String firstName;
  String lastName;
  String email;
  String? phone;
  bool isVerified;
  String dateAdded;

  UserDetails(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.phone,
      required this.isVerified,
      required this.dateAdded});

  UserDetails copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      bool? isVerified,
      String? dateAdded}) {
    return UserDetails(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        isVerified: isVerified ?? this.isVerified,
        dateAdded: dateAdded ?? this.dateAdded);
  }
}
