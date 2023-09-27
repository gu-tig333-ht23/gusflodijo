import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mystate.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({key, value}) : super(key: key);

  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, state, _) => Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: state.filteredTodos.length,
                itemBuilder: (context, index) {
                  final filteredlist = state.filteredTodos[index];
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6,
                                color: Colors.black,
                                offset: Offset(1, 3))
                          ]),
                      child: ListTile(
                        title: Text(
                          filteredlist.title,
                          style: TextStyle(
                            decoration: filteredlist.done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: filteredlist.done,
                          onChanged: (newValue) {
                            filteredlist.done = newValue!;
                            context
                                .read<MyState>()
                                .updateTodoItem(filteredlist);
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<MyState>()
                                .deleteTodoItem(filteredlist.id);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*                
              
class ItemWIdget extends StatelessWidget {
  final TodoItem todoitem;
  @override
  
  ItemWIdget(this.todoitem);

  Widget build(BuildContext context) {

    return ListTile(
                  title: Text(
                    
                    filteredlist.title,
                    
                    style: TextStyle(
                      decoration: filteredlist.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: filteredlist.done,
                    onChanged: (newValue) {
                    filteredlist.done = newValue!;
                    context.read<MyState>().notifyListeners();  
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeTodoItem(index);
                      context.read<MyState>().notifyListeners();
                    },
                  ),
                );
    );

  }
}

*/