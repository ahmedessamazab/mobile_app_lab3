import 'package:flutter/material.dart';
import '../../models/task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Task> _tasks = [
    Task(title: 'Buy groceries'),
    Task(title: 'Study Flutter'),
    Task(title: 'Complete Laboratory'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),

      body: ListView.builder(
        itemCount: _tasks.length,

        itemBuilder: (context, index) {

          final task = _tasks[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            child: ListTile(

              leading: Checkbox(
                value: task.isComplete,
                onChanged: (value) {
                  setState(() {
                    task.isComplete = value!;
                  });
                },
              ),

              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,

                  color: task.isComplete
                      ? Colors.grey
                      : Colors.black,
                ),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,

                children: [

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showTaskDialog(
                        context,
                        existingTask: task,
                        index: index,
                      );
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _tasks.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showTaskDialog(
    BuildContext context, {
    Task? existingTask,
    int? index,
  }) {

    final formKey = GlobalKey<FormState>();

    final controller = TextEditingController(
      text: existingTask?.title ?? '',
    );

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: Text(
            existingTask == null
                ? 'Add Task'
                : 'Edit Task',
          ),

          content: Form(
            key: formKey,

            child: TextFormField(
              controller: controller,

              decoration: const InputDecoration(
                hintText: 'Enter task name',
              ),

              validator: (value) {

                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Task cannot be empty';
                }

                if (value.trim().length < 3) {
                  return 'Minimum 3 characters';
                }

                return null;
              },
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {

                if (formKey.currentState!.validate()) {

                  setState(() {

                    if (existingTask == null) {

                      _tasks.add(
                        Task(
                          title: controller.text.trim(),
                        ),
                      );

                    } else {

                      _tasks[index!].title =
                          controller.text.trim();
                    }
                  });

                  Navigator.pop(context);
                }
              },

              child: Text(
                existingTask == null
                    ? 'Add'
                    : 'Save',
              ),
            ),
          ],
        );
      },
    );
  }
}