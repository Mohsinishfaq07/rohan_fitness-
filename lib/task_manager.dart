import 'package:flutter/material.dart';
import 'package:rohan_fitness/db/db_helper.dart';
import 'package:rohan_fitness/db/nodes.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;
  TextEditingController titleController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subTaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  void loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: notesList,
              builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey<int>(snapshot.data![index].id!),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.green,
                            child: const Icon(Icons.delete_forever),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              dbHelper!.delete(snapshot.data![index].id!);
                              notesList = dbHelper!.getNotesList();
                            });
                          },
                          child: ListTile(
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle: Text(
                                snapshot.data![index].description.toString()),
                            trailing:
                                Text(snapshot.data![index].age.toString()),
                            onTap: () {
                              titleController.text =
                                  snapshot.data![index].title;
                              ageController.text =
                                  snapshot.data![index].age.toString();
                              descriptionController.text =
                                  snapshot.data![index].description;
                              emailController.text =
                                  snapshot.data![index].email;

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Edit Note'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: titleController,
                                            decoration: const InputDecoration(
                                                labelText: 'Title'),
                                          ),
                                          TextField(
                                            controller: ageController,
                                            decoration: const InputDecoration(
                                                labelText: 'Age'),
                                          ),
                                          TextField(
                                            controller: descriptionController,
                                            decoration: const InputDecoration(
                                                labelText: 'Description'),
                                          ),
                                          TextField(
                                            controller: emailController,
                                            decoration: const InputDecoration(
                                                labelText: 'Email'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Update'),
                                        onPressed: () {
                                          dbHelper!.update(NotesModel(
                                            id: snapshot.data![index].id,
                                            title: titleController.text,
                                            age: int.parse(ageController.text),
                                            description:
                                                descriptionController.text,
                                            email: emailController.text,
                                          ));

                                          setState(() {
                                            notesList =
                                                dbHelper!.getNotesList();
                                          });

                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: Colors.red, strokeWidth: 52),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Note'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: ageController,
                        decoration: const InputDecoration(labelText: 'Age'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      dbHelper!.insert(NotesModel(
                        title: titleController.text,
                        age: int.parse(ageController.text),
                        description: descriptionController.text,
                        email: emailController.text,
                      ));

                      setState(() {
                        notesList = dbHelper!.getNotesList();
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
