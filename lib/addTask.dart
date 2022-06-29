import 'package:final_todo/homePage.dart';
import 'package:flutter/material.dart';
class AddTask extends StatefulWidget {
  const AddTask({Key? key, this.task}) : super(key: key);
  final Task? task;
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  late TextEditingController titleTC;
  late TextEditingController dateTC ;
  late TextEditingController purposeTC;

  void saving(){
    Task a = Task(titleTC.text,dateTC.text , purposeTC.text);
    Navigator.pop(context, a);
  }

  @override
  void initState() {
    titleTC = TextEditingController();
    dateTC = TextEditingController();
    purposeTC = TextEditingController();
    titleTC.text = widget.task?.title ?? '';
    dateTC.text = widget.task?.date?? '';
    purposeTC.text = widget.task?.aboutTask??'';
    super.initState();
  }

  @override
  void dispose() {
    titleTC.dispose();
    dateTC.dispose();
    purposeTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextField(
                controller: titleTC,
                decoration: const InputDecoration(labelText: 'Title of task'),
                onChanged: (String title) {
                  setState(() {
                    titleTC.text = title;
                    titleTC.selection = TextSelection.collapsed(offset: title.length);
                  });
                },
              ),
              TextField(
                controller: dateTC,
                decoration: const InputDecoration(labelText: 'Date'),
                onChanged: (String data) {
                  setState(() {
                    dateTC.text = data;
                    dateTC.selection = TextSelection.collapsed(offset: data.length);
                  });
                },
              ),
              TextField(
                controller: purposeTC,
                decoration: const InputDecoration(labelText: 'Purpose of task'),
                onChanged: (String inform) {
                  setState(() {
                    purposeTC.text = inform;
                    purposeTC.selection = TextSelection.collapsed(offset: inform.length);
                  });
                },
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: saving,
                child: Container(
                  margin:const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height:50,
                  width:80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.save_alt_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
