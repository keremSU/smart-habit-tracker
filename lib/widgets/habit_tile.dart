import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: habit.isDone,
        onChanged: onChanged,
      ),
      title: Text(
        habit.name,
        style: TextStyle(
          decoration:
              habit.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}