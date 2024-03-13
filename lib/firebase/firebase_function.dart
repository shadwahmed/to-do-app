import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/tabs/taskModel.dart';

class FirebaseFunctions {
 static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  static void addTask(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id=docRef.id;
    docRef.set(model);
  }
}
