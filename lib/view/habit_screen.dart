part of '../import.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerHabit = Provider.of<HabitProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 22.0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 209, 198),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 209, 198),
          title: Text(
            'Habit Tracket',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<HabitProvider>(context, listen: false)
                      .resetHabit();
                },
                icon: Icon(
                  Icons.refresh,
                  size: 30,
                  color: Colors.brown,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Daily Progress :${providerHabit.habitCompleted}/${providerHabit.totalHabit} habits completed',
                  style: TextStyle(fontSize: 16, color: Colors.brown)),
              SizedBox(height: 6),
              LinearProgressIndicator(
                  color: Colors.brown,
                  value: providerHabit.totalHabit > 0
                      ? providerHabit.habitCompleted / providerHabit.totalHabit
                      : 0),
              SizedBox(height: 6),
              Text(
                  'Completed Percentage: ${providerHabit.habitPerPercentage.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 16, color: Colors.brown)),
              Expanded(
                  child: ListView.builder(
                      itemCount: providerHabit.habit.length,
                      itemBuilder: (context, index) {
                        final habit = providerHabit._habit[index];
                        return GestureDetector(
                          onLongPress: () {
                            providerHabit.deletHbit(habit.id);
                          },
                          child: ListTile(
                            title: Text(habit.title,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            trailing: Checkbox(
                                value: habit.isCompleted,
                                onChanged: (_) {
                                  providerHabit.toggleHabbit(habit.id);
                                }),
                          ),
                        );
                      })),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 240, 209, 198),
          child: Icon(
            Icons.add,
            size: 44,
            color: Colors.brown,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  String newHabit = '';
                  return AlertDialog(
                    title: Text(
                      'Add Habit..',
                      style: TextStyle(color: Colors.brown, fontSize: 33),
                    ),
                    content: TextField(
                      onChanged: (value) => newHabit = value,
                      decoration: InputDecoration(hintText: ('Add new Habit')),
                    ),
                    actions: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.brown),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.brown),
                          onPressed: () {
                            if (newHabit.isNotEmpty) {
                              providerHabit.addHabit(newHabit);
                              Navigator.of(ctx).pop();
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
