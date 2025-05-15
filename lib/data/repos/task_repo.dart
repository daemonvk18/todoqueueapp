import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';
import '../services/queue_service.dart';

class TaskRepository {
  final QueueService _queueService = QueueService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(Task task) async {
    await _queueService.addTask(task);
  }

  Stream<List<Task>> getTasks(String userId) {
    return _firestore
        .collection('tasks')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task.fromMap(doc.id, doc.data()))
            .toList());
  }
}
