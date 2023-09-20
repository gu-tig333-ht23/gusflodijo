import 'dart:convert';
import 'package:http/http.dart' as http;
import '/TodoItem.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';

// Get list function
Future<List<TodoItem>> getTodos() async {
  try {
    http.Response response = await http.get(
        Uri.parse('$ENDPOINT/todos?key=77144a7b-183f-4747-948c-e6b5c9755ffc'));
    String body = response.body;
    List<dynamic> jsonResponse = jsonDecode(body);
    List notesJson = jsonResponse;
    return notesJson.map((json) => TodoItem.fromJson(json)).toList();
  } catch (e) {
    print(e);
  }
  return [];
}
// Addfunction
Future<void> addTodos(TodoItem todoitem) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=77144a7b-183f-4747-948c-e6b5c9755ffc'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(todoitem.toJson()),
  );
}
// Deletefunction
Future<void> deleteTodoItem(id) async {
  await http.delete(Uri.parse(
      '$ENDPOINT/todos/$id?key=77144a7b-183f-4747-948c-e6b5c9755ffc'));
}
// Updatefunction
Future<void> updateTodoItem(TodoItem todoitem) async {
  final id = todoitem.id; 
  await http.put(
    Uri.parse('$ENDPOINT/todos/$id?key=77144a7b-183f-4747-948c-e6b5c9755ffc'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todoitem
        .toJson()), 
  );
}
