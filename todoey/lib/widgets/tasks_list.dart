import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/widgets/tasks_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskData.getTaskName(index),
              taskData.isTaskDone(index),
              (bool? checkboxState) {
                taskData.updateTask(index);
              },
              () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
