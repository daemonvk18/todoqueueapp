import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue/queue.dart';
import 'package:todoqueueapp/data/models/task_model.dart';

class QueueService {
  final Queue _queue = Queue();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const int maxretries = 3;
  static const Duration delay = Duration(seconds: 5);

  Future<void> addTask(Task task) async {
    // marked task as 'queued' locally for UI purposes
    task.status = 'queued';

    //  Added to internal queue for delayed Firestore upload
    await _queue.add(() async {
      //  Wait for the delay
      await Future.delayed(delay);

      int attempt = 0;
      while (attempt < maxretries) {
        try {
          // Upload to Firestore with status 'uploaded'
          await _firestore.collection('tasks').doc(task.id).set({
            ...task.toMap(),
            'status': 'uploaded',
            'createdAt': FieldValue.serverTimestamp(),
          });
          return;
        } catch (e) {
          attempt++;
          if (attempt == maxretries) {
            rethrow;
          }
          await Future.delayed(
              Duration(seconds: attempt * 2)); // Exponential backoff
        }
      }
    });
  }
}
