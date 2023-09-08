import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  String? uid;
  String? photoUrl;
  String? username;
  String? bio;
  List<dynamic>? followers;
  List<dynamic>? following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    uid = json['uid'];
    bio = json['bio'];
    photoUrl = json['photoUrl'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['uid'] = uid;
    data['bio'] = bio;
    data['photoUrl'] = photoUrl;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
