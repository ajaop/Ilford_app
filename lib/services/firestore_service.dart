import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilford_app/models/user_details.dart';

class FirestoreService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserDetails(UserDetails UserDetails) {
    return _usersCollection.add({
      'firstName': UserDetails.firstName,
      'lastName': UserDetails.lastName,
      'email': UserDetails.email,
      'phone': UserDetails.phone,
      'isVerified': UserDetails.isVerified,
      'dateAdded': UserDetails.dateAdded,
    });
  }
}
