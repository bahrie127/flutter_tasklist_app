import 'package:flutter/material.dart';
import 'package:flutter_tasklist_app/data/models/add_task_request_model.dart';

import 'package:flutter_tasklist_app/data/models/task_response_model.dart';

import '../data/datasources/task_remote_datasource.dart';
import 'home_page.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();

  @override
  void initState() {
    titlecontroller.text = widget.task.attributes.title;
    descriptioncontroller.text = widget.task.attributes.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Title',
              border: OutlineInputBorder(),
            ),
            controller: titlecontroller,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
            controller: descriptioncontroller,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final newModel = AddTaskRequestModel(
                data: Data(
                    title: titlecontroller.text,
                    description: descriptioncontroller.text),
              );

              await TaskRemoteDatasource().updateTask(widget.task.id, newModel);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
