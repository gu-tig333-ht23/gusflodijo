import 'dart:convert';
import 'package:http/http.dart' as http;
import '/todoitem.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String KEY = '77144a7b-183f-4747-948c-e6b5c9755ffc';

// Getlist
Future<List<TodoItem>> getTodos() async {
  try {
    http.Response response =
        await http.get(Uri.parse('$ENDPOINT/todos?key=$KEY'));
    String body = response.body;
    List<dynamic> jsonResponse = jsonDecode(body);
    List notesJson = jsonResponse;
    return notesJson.map((json) => TodoItem.fromJson(json)).toList();
  } catch (e) {
    print('An error occured: $e');
  }
  return [];
}

// Add item
Future<void> addTodos(TodoItem todoitem) async {
  try {
    await http.post(
      Uri.parse('$ENDPOINT/todos?key=$KEY'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(todoitem.toJson()),
    );
  } catch (e) {
    print('An error occured: $e');
  }
}

// Delete item
Future<void> deleteTodoItem(id) async {
  try {
    await http.delete(Uri.parse('$ENDPOINT/todos/$id?key=$KEY'));
  } catch (e) {
    print('An error occured: $e');
  }
}

// Update item
Future<void> updateTodoItem(TodoItem todoitem) async {
  try {
    final id = todoitem.id;
    await http.put(
      Uri.parse('$ENDPOINT/todos/$id?key=$KEY'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todoitem.toJson()),
    );
  } catch (e) {
    print('An error occured: $e');
  }
}
