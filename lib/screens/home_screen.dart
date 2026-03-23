import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];

  void addHabit() {
    showDialog(
      context: context,
      builder: (context) {
        String newHabit = "";

        return AlertDialog(
          title: const Text("Add Habit"),
          content: TextField(
            onChanged: (value) {
              newHabit = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (newHabit.isNotEmpty) {
                  setState(() {
                    habits.add(Habit(name: newHabit));
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void toggleHabit(int index, bool? value) {
    setState(() {
      habits[index].isDone = value!;
    });
  }

  void deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Habit Tracker")),
      body: habits.isEmpty
          ? const Center(child: Text("No habits yet"))
          : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habit: habits[index],
                  onChanged: (value) => toggleHabit(index, value),
                  onDelete: () => deleteHabit(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addHabit,
        child: const Icon(Icons.add),
      ),
    );
  }
}