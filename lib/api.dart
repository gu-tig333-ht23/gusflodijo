
import 'dart:convert';

import 'package:http/http.dart' as http;
import '/TodoItem.dart';


const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';

//NY GET todofunktion

Future<List<TodoItem>> getTodos() async {
  try {
  http.Response response = await http.get(Uri.parse('$ENDPOINT/todos?key=77144a7b-183f-4747-948c-e6b5c9755ffc'));
  String body = response.body;

  List<dynamic> jsonResponse = jsonDecode(body);

  List notesJson = jsonResponse;
  print(body);

  return notesJson.map((json) => TodoItem.fromJson(json)).toList();
  } catch (e) {
    print(e);
  }
  return [];
  
}


Future<void> addTodos(TodoItem todoitem) async {
 
  http.Response response = await http.post(
    Uri.parse('$ENDPOINT/todos?key=77144a7b-183f-4747-948c-e6b5c9755ffc'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(todoitem.toJson()),
    
  
    );
}


Future<void> deleteTodoItem(id) async {
  print(id);
  try {
    final response = await http.delete(Uri.parse(
      '$ENDPOINT/todos/$id?key=77144a7b-183f-4747-948c-e6b5c9755ffc'));
    
    if (response.statusCode == 204) {
      print('Item with ID $id has been deleted.');
    } else {
      print('Failed to delete item with ID $id. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}


