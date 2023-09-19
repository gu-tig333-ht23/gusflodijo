import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';
import 'TodoItem.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({key, value}) : super(key: key);


  Widget build(BuildContext context) {
    //Denna funktionen behöver nog flyttas till MyState och kopplas på apin likt add och fetch
    void removeTodoItem(int index) {
    context.read<MyState>().todolist.removeAt(index);
}

    
    return Consumer<MyState>(builder: (context, state, _) => Center(      
      
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: state.todolist.length,
                itemBuilder: (context, index) {
                  final filteredlist = state.todolist[index];                             
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
                      context
                          .read<MyState>()
                          .deleteTodoItem(filteredlist.id);
                      context.read<MyState>().notifyListeners();
                    },
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