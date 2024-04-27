import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, required this.isCompleted});
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Task> personalTasks = [];
  List<Task> workTasks = [];
  List<Task> otherTasks = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addTask(String taskName) {
    switch (_tabController.index) {
      case 0:
        setState(() {
          personalTasks.add(Task(name: taskName, isCompleted: false));
        });
        break;
      case 1:
        setState(() {
          workTasks.add(Task(name: taskName, isCompleted: false));
        });
        break;
      case 2:
        setState(() {
          otherTasks.add(Task(name: taskName, isCompleted: false));
        });
        break;
    }
  }

  void _toggleTaskCompletion(List<Task> tasks, int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void _deleteTask(List<Task> tasks, int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Personal'),
            Tab(text: 'Work'),
            Tab(text: 'Other'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Nisha Tyagi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            
            ListTile(
              title: const Text('Calendar'),
              onTap: () {
                // Add your calendar action here
              },
            ),
            ListTile(
              title: const Text('Clock'),
              onTap: () {
                // Add your clock action here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          if (_tabController.index == 0)
            Positioned.fill(
              child: Image.asset(
                'lib/assets/bg1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          if (_tabController.index == 1)
            Positioned.fill(
              child: Image.asset(
                'lib/assets/bg2.png',
                fit: BoxFit.cover,
              ),
            ),
          if (_tabController.index == 2)
            Positioned.fill(
              child: Image.asset(
                'lib/assets/bg3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          TabBarView(
            controller: _tabController,
            children: [
              _buildTaskList(personalTasks),
              _buildTaskList(workTasks),
              _buildTaskList(otherTasks),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController _controller = TextEditingController();
              return AlertDialog(
                title: const Text('Add Task'),
                content: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Task name'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _addTask(_controller.text);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            tasks[index].name,
            style: const TextStyle(fontSize: 27),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteTask(tasks, index),
              ),
              Checkbox(
                value: tasks[index].isCompleted,
                onChanged: (_) => _toggleTaskCompletion(tasks, index),
              ),
            ],
          ),
        );
      },
    );
  }
}
