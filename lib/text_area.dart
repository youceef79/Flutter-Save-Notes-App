import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './NotesState.dart';

class TextArea extends StatelessWidget {
  
  TextArea({Key? key, dynamic? this.mainModel,dynamic? this.detailsModel ,dynamic? this.index}) : super(key: key);

  dynamic mainModel;
  dynamic detailsModel;
  dynamic index;

  dynamic getItemFromList(index) {

    for(var it in mainModel.listItems) {
            if (it["index"] == index) {
              return it;     
           }
        }

  }

  @override
  Widget build(BuildContext context) {
    
    if (index != null && detailsModel.once) {
        detailsModel.contentController.text = getItemFromList(index)["content"]; 
        detailsModel.once = false;
      }    
          
    return TextField(
               textInputAction: TextInputAction.newline,
               keyboardType: TextInputType.multiline,
               minLines: null,
               maxLines: null, 
               expands: true,
               controller: detailsModel.contentController,
               cursorColor: detailsModel.cursorColor,
               style: TextStyle(color: detailsModel.textColor, height: 1.5, fontSize: detailsModel.fontSize),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  border: InputBorder.none,
              //enabledBorder: OutlineInputBorder(
                  //borderSide: BorderSide(width: 3, color: Colors.blue),
                  //borderRadius: BorderRadius.circular(5),
                //),
                  contentPadding: EdgeInsets.only(
                    left: 20,
                    bottom: 11,
                    top: 15,
                    right: 15,
                  ),
                ),
        );
  }
}
