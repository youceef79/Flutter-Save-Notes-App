import 'package:flutter/material.dart';
import './note_details.dart';
import 'package:provider/provider.dart';
import './NotesState.dart';
import './DetailsState.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key }) : super(key: key);
   

  void _addNote(state) {
       
    showDialog(
            context: state.mainContext,
            builder: (context) {
            state.titleController.text = "";
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              title: Text("title required"),  
              content: Padding(
              padding: EdgeInsets.all(1), 
              child: Container(
                width: 150,
                child: TextField(
                 maxLengthEnforced: true,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: 'Title',
                     ),    
              controller: state.titleController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black, fontSize: 20),
                ) ) ),
              actions: [
                  FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {
                  Navigator.pop(state.mainContext);  
                  Navigator.push(
                  state.mainContext,
                  MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<DetailsState>(
                 create: (context) => DetailsState(),
                 child: NoteDetails(model: state)),
                 ));
                  },
                    child: Text('Next'),
                  ),
                  FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {
                      Navigator.pop(state.mainContext);
                    },
                    child: Text('Skip'),
                   ),
                  ],
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NotesState>(context); 
     state.mainContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ), 
      body: 
       Container(
          child: state.listView,
          decoration: BoxDecoration(
            gradient: 
            LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.6, 0.7, 0.9],
            colors: [Color(0xFF9E9D24), Color(0xFF33691E), Color(0xFF006064), Color(0xFF1A237E)]
              ),
           ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _addNote(state); }, 
        tooltip: 'add a note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}              