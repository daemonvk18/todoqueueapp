import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue/queue.dart';
import '../models/task_model.dart';

class QueueService {
  final Queue _queue = Queue();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const int maxRetries = 3;
  static const Duration delay = Duration(seconds: 5);

  Future<void> addTask(Task task) async {
    // Set initial status to 'queued' in Firestore
    await _firestore.collection('tasks').doc(task.id).set(task.toMap());
    await _queue.add(() async {
      await Future.delayed(delay);
      int attempt = 0;
      while (attempt < maxRetries) {
        try {
          // Update status to 'uploaded' after delay
          await _firestore.collection('tasks').doc(task.id).update({
            'status': 'uploaded',
            'updatedAt': FieldValue.serverTimestamp(),
          });
          return;
        } catch (e) {
          attempt++;
          if (attempt == maxRetries) {
            print(
                'Failed to upload task ${task.id} after $maxRetries attempts');
            rethrow;
          }
          await Future.delayed(Duration(seconds: attempt * 2));
        }
      }
    });
  }
}
