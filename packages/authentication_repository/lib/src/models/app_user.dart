import 'package:equatable/equatable.dart';

/// User model
///
/// [AppUser.empty] represents an unauthenticated user.
class AppUser extends Equatable {
  const AppUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = AppUser(id: '');

  @override
  List<Object?> get props => [email, id, name, photo];
}
