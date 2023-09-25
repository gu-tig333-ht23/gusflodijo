class TodoItem {
  String? id;
  String title;
  bool done;

  TodoItem(this.title, this.done, [this.id]);

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(json['title'], json['done'], json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "done": done,
    };
  }
}
