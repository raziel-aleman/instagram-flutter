import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? description;
  String? uid;
  String? username;
  String? postId;
  late final DateTime? datePublished;
  String? postUrl;
  String? profImage;
  late final List<dynamic>? likes;

  Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.profImage,
      required this.likes});

  Post.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    uid = json['uid'];
    username = json['username'];
    postId = json['postId'];
    datePublished = json['datePublished'];
    postUrl = json['postUrl'];
    profImage = json['profImage'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['uid'] = uid;
    data['username'] = username;
    data['postId'] = postId;
    data['datePublished'] = datePublished;
    data['postUrl'] = postUrl;
    data['profImage'] = profImage;
    data['likes'] = likes;
    return data;
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }
}
