import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';


class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({key, value}) : super(key: key);
  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {

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
                      setState(() {
                        filteredlist.isDone = newValue!;
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        context.read<MyState>().todolist.removeAt(index);
                      });
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

                
              
