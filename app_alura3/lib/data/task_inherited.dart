import 'package:app_alura3/widgets/task_widget.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget{
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);
  
  final List<TaskWidget> taskList = [
    TaskWidget('Aprender Flutter', 'assets/imeges/dash.png', 3),
    TaskWidget('Andar de Bike', 'assets/images/bike.webp', 2),
    TaskWidget('Meditar', 'assets/images/meditar.jpeg', 5),
    TaskWidget('Ler', 'assets/images/livro.jpg', 4),
    TaskWidget('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(TaskWidget(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context){
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget){
    return oldWidget.taskList.length != taskList.length;
  }
}