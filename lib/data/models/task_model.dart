import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final String status; // 'queued' or 'uploaded'
  final String userId;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory Task.fromMap(String id, Map<String, dynamic> map) {
    return Task(
      id: id,
      title: map['title'],
      description: map['description'],
      status: map['status'],
      userId: map['userId'],
    );
  }
}
