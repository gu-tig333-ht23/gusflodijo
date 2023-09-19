

class TodoItem {
  
  String? id; 
  String title;
  bool done;
 
  TodoItem(this.title, this.done, [this.id]);

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    print('i factory todo item todoItem.dart');
    return TodoItem(json['title'], json['done'], json['id']);
  }

  Map<String, dynamic> toJson() {
    print('toJson funktionen');
    
    return{
      "title": title,
      "done": done,
    };
    
  }

}