part of '../import.dart';

class HabitModel {
  final String id;
  final String title;
  bool isCompleted;

  HabitModel({required this.id, required this.title, this.isCompleted = false});
}
