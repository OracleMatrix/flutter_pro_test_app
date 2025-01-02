import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todos_controller.dart';

class TodosView extends GetView<TodosController> {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: controller.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (controller.allData.value.todos == null ||
              controller.allData.value.todos!.isEmpty) {
            return const Center(
              child: Text(
                'No todos found.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.allData.value.todos!.length,
            itemBuilder: (context, index) {
              final todo = controller.allData.value.todos![index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: todo.completed ?? false,
                    onChanged: (value) {
                      // Update the completed status (you can add logic here)
                      controller.allData.value.todos![index].completed = value;
                      controller.allData.refresh(); // Refresh the UI
                    },
                    activeColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  title: Text(
                    todo.todo ?? 'No task',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: todo.completed == true
                          ? Colors.grey.shade500
                          : Colors.grey.shade800,
                      decoration: todo.completed == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Icon(
                    todo.completed == true ? Icons.check_circle : Icons.circle,
                    color: todo.completed == true
                        ? Colors.green.shade600
                        : Colors.grey.shade400,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to create a new todo
          Get.snackbar(
            'Info',
            'Add new todo feature coming soon!',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        backgroundColor: Colors.blue.shade800,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
