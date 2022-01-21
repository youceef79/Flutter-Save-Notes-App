import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './NotesState.dart';

class BottomNav extends StatelessWidget {
  
   BottomNav({Key? key, dynamic? this.mainModel, dynamic? this.detailsModel,  dynamic? this.index}) : super(key: key);

   dynamic mainModel;
   dynamic index;
   dynamic detailsModel; 

	@override
	Widget build(BuildContext context) {

		return Stack(
      children: <Widget>[
         Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Column(
             children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: Colors.red
                ),
               Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: Colors.blue
                ),
             ]
            )
           ) ,
         Container( 
            child:  Row(
                 children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(-20),
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    
                    if(index == null) {

                    mainModel.addToList(mainModel, detailsModel);

                    } else {

                    mainModel.updateList(index, mainModel, detailsModel); 

                    }
                    Navigator.pop(context);
                 },
                  child: index == null ? Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ) : Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: FlatButton(
                  onPressed: () {
                   Navigator.pop(context);
                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ) ,),
                  child: Text("Cancel", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.red,
                ),
              ),
              ]
            ),
          ), 
        ],
      );
	}
}
