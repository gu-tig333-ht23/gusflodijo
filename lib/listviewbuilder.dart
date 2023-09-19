import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyState.dart';

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
                itemCount: state.filteredTodos.length,
                itemBuilder: (context, index) {
                  final filteredlist = state.filteredTodos[index];
                return ListTile(
                  title: Text(
                    filteredlist.item,
                    style: TextStyle(
                      decoration: filteredlist.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: filteredlist.isDone,
                    onChanged: (newValue) {
                    filteredlist.isDone = newValue!;
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
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}

                
              
