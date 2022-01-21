import 'package:flutter/material.dart';
import './bottom_nav.dart';
import './text_area.dart';
import 'package:provider/provider.dart';
import './NotesState.dart';
import 'package:smart_select/smart_select.dart';
import 'package:sticky_headers/sticky_headers.dart';
import './DetailsState.dart';
import './options_screen.dart';
import './OptionsState.dart';



class NoteDetails extends StatelessWidget {
  NoteDetails({Key? key, dynamic? this.model, dynamic? this.index}) : super(key: key);

  dynamic model;

  dynamic index;

  dynamic value = "";

  List<S2Choice<int>> options = [
  S2Choice<int>(value: 0, title: "im2"),
  S2Choice<int>(value: 1, title: "im3") 
  ];

  dynamic getItemFromList(index) { 
     
    for(var it in model.listItems) {
            if (it["index"] == index) {
              return it;     
           }
        }

  }

 

  @override
  Widget build(BuildContext context) {
    var detailsModel = Provider.of<DetailsState>(context);
     detailsModel.secondContext = context;
     detailsModel.itemIndex = index;
    
    if (index != null && detailsModel.once) {
        detailsModel.titleControllerOfDetails.text = getItemFromList(index)["title"];
        detailsModel.imageIndex = getItemFromList(index)["imageBackIndex"];
        detailsModel.backgroundColor = getItemFromList(index)["imageBackColor"];
        detailsModel.fontSize = getItemFromList(index)["fontSize"];
        detailsModel.textColor = getItemFromList(index)["textColor"];
      } 

    if (index == null && detailsModel.once) {
        detailsModel.titleControllerOfDetails.text = model.titleController.text;
        detailsModel.once = false;
     }

    return Scaffold(
     appBar: AppBar(

        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(
                context,);
          },
      ), 
        title: Container(
                width: 100,
                child: TextField(   
                controller: detailsModel.titleControllerOfDetails,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                fillColor: Colors.transparent,
                  filled: true,
                  border: InputBorder.none,)
                ) ),
         actions: [
           FlatButton( 
            color: Colors.transparent,
            child: Row ( 
              children: [ 
           Text("Options", style: TextStyle(fontSize: 15, color: Colors.white)),
           Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white)
            )
          ] 
          ),
        onPressed: () {
           //dialog(detailsModel, model);
           Navigator.push(
                  detailsModel.secondContext,
                  MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<OptionsState>(
                 create: (context) => OptionsState(),
                 child: OptionsScreen(mainModel: model, detailsModel: detailsModel)),
                 ));
         }, 
        ) 
      ]
      ),  
    bottomNavigationBar: BottomNav(mainModel: model, index: index, detailsModel: detailsModel),
    body: Stack(
      children: <Widget>[
      Consumer<DetailsState>(
       builder: (context, provider, child) { 
        return provider.backgroundColor == -1 ? Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/medium/${provider.images[provider.imageIndex]}'), fit: BoxFit.cover,),
          ),
        ) : Container(
          decoration: BoxDecoration(
             color: provider.backgroundColor,
          ),
        );  } ),
       TextArea(mainModel: model, detailsModel: detailsModel, index: index),
      ],
    )
  );
   
 }
}

