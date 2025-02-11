part of '../import.dart';

class HabitProvider with ChangeNotifier {
  final List<HabitModel> _habit = [];
  List<HabitModel> get habit => _habit;

  int get totalHabit => _habit.length;
  // get t how many habit is completted
  int get habitCompleted => _habit.where((habit) => habit.isCompleted).length;
  double get habitPerPercentage {
    if (totalHabit == 0) return 0;
    return (habitCompleted / totalHabit) * 100;
  }

  void addHabit(String title) {
    final newHabit = HabitModel(id: DateTime.now().toString(), title: title);
    _habit.add(newHabit);
    notifyListeners();
  }

  void toggleHabbit(String id) {
    final index = _habit.indexWhere((habit) => habit.id == id);
    if (index != -1) {
      _habit[index].isCompleted = !habit[index].isCompleted;
      notifyListeners();
    }
  }

  void resetHabit() {
    for (var habit in _habit) {
      habit.isCompleted = false;
    }
    notifyListeners();
  }

  void deletHbit(String id) {
    habit.removeWhere((habitid) => habitid.id == id);
    notifyListeners();
  }
}
