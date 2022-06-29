import 'dart:ffi';
import 'package:final_todo/addTask.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> information = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('To do list'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backImage3.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: information.length,
                itemBuilder: (context, index) => getTaskBox(information[index], index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () async {
          Task task = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTask(),),
          );
          setState(() => information.add(task));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getTaskBox(Task task, int index) => Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white12.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Title:',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 200,
                    child: Text(
                      task.title,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(width: 35),
                  SizedBox(
                    width: 160,
                    child: Text(
                      task.date,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(right: 215),
                child: const Text(
                  'About task:',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  task.aboutTask,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          information.remove(information[index]);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Task task = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddTask(
                              task: information[index],
                            ),
                          ),
                        ) as Task;
                        setState(() {
                          information[index] = task;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class Task {
  late String title;
  late String date;
  late String aboutTask;

  Task(
    this.title,
    this.date,
    this.aboutTask,
  );
}
