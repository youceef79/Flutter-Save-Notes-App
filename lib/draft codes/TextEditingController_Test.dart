import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   void dialog(model, mainModel) {
    showDialog(
            context: model.secondContext,
            builder: (context) {

            return AlertDialog(
              //width: 0.8*MediaQuery.of(model.secondContext).size.width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              title: Text("Options"),  
              content: 
              Container(
                height: 200, 
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Background Texture: ", style: TextStyle(color: Colors.blueAccent, fontSize: 15,fontWeight: FontWeight.bold)),
                 SizedBox(height: 10),
                 Wrap(
                  spacing : 10,
                  children: [
             ...model.images.map((item) {
                return  Container(
                       width: 50,
                       decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage('images/small/${item}'), fit: BoxFit.cover,),
                      ),
                       child: FlatButton( 
                             color: Colors.transparent,
                             onPressed: () {
                              model.changeBackground(item);
                              //model.contentController.text = "";
                              Navigator.pop(model.secondContext);
                             }, 
                             child: Text("") 
                   )
                 ); 
                }).toList(), 
                  ]
                  ) 
                ] 
                )),
              actions: [
                  
                  ],
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}