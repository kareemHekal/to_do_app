import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/TaskModel.dart';

class FirebaseFunctions {
  static CollectionReference<Taskmodel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<Taskmodel>(
      fromFirestore: (snapshot, _) {
        return Taskmodel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static Future<void> addTask(Taskmodel taskModel) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<Taskmodel>> getTasks(DateTime dateTime) {
    var collection = getTasksCollection();
    return collection
        .where("date",
        isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(Taskmodel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.tojson());
  }
}
