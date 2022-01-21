import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './note_details.dart';
import './my_home_page.dart';
import 'package:provider/provider.dart';
import './DetailsState.dart';

class NotesState with ChangeNotifier{

	   dynamic listView;
    
     dynamic images = [ "im0.jpg", "im1.jpg", "im2.jpg"];

     List<Map<String, dynamic>> listItems = [];

     TextEditingController titleController = TextEditingController();

     dynamic mainContext;

     dynamic uniqueId = 0;

    /*
     static NotesState instance = NotesState();

    static NotesState singleton() {
            
            if(instance != null) {
              return instance;
            } else {
             return NotesState();
            }
     }
     */

   void addToList(mainModel, detailsModel) {

     listView = ListView.builder(
      itemCount: listItems.length+1,
         itemBuilder: (context, index) {

          if(index == listItems.length) {
          listItems.add({ "index" : uniqueId, 
            "imageBackIndex": detailsModel.imageIndex,
            "imageBackColor":  detailsModel.backgroundColor,
            "title": detailsModel.titleControllerOfDetails.text  , 
            "content": detailsModel.contentController.text, 
            "fontSize": detailsModel.fontSize, 
            "textColor": detailsModel.textColor, 
            "wid": getListItem(uniqueId++, 
              detailsModel.imageIndex, 
              detailsModel.backgroundColor,
              detailsModel.titleControllerOfDetails.text, 
              detailsModel.contentController.text, 
              mainModel)}); 
          }
         return listItems[index]["wid"];
       }
       
    );
     
    //await Future.delayed(Duration(milliseconds: 1));
     notifyListeners();
  }

  String subText(String s){
     if(s.length < 10) {
       return s;
     } else {
     	return s.substring(0,10)+"...";
     } 
  } 


  Widget getListItem(index, imageIndex, backgroundColor ,title, content, mainModel){
    
    return  ListTile(
        leading: backgroundColor == -1 ? 
          Container(width: 50, height: 50, decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/small/${images[imageIndex]}'),
          ),),) : 
          Container(width: 50, height: 50, decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor),),//SvgPicture.asset("assets/svgs/flower.svg"),
        title: Text(subText(title), 
        style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold)),
        subtitle: Text(subText(content),
        style: TextStyle(fontSize: 15)),
        trailing: 
         Container
         (	
          margin: EdgeInsets.only(left :50),	
          width: 150,	
          child: Row(
          children: <Widget>[
          IconButton(
          icon: 
          Icon(
          Icons.edit,
          size: 20,
          color: Colors.green
          ),
          onPressed: () {
          Navigator.push(
                  mainModel.mainContext,
                  MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<DetailsState>(
                 create: (context) => DetailsState(),
                 child: NoteDetails(model: mainModel, index: index)),
                 ));
          }
         ),
       Container(
       	 margin: EdgeInsets.only(left: 30,right: 30),
       	 height: 150,
       	 width: 1,
       	 color: Colors.black
          	)
          ,
          IconButton(
          icon: 
          Icon(
          Icons.delete,
          size: 20,
          color: Colors.red
          ),
          onPressed: () {
            removeFromList(index);
          }
         )
          ],
          ) )
      );

  }

  void setListView() {

    if (listItems.length == 0) {
      listView = null;  
    } else {

    listView = ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
          return listItems[index]["wid"];
      }
    );
  }
   notifyListeners();
}

  void removeFromList(id) {
    
   for(var it in listItems) {
      if (it["index"] == id) {
       listItems.remove(it);      
           }
      }
      setListView();
  }

  void updateList(id ,mainModel, detailsModel) {
    
   for(var it in listItems) {
      if (it["index"] == id) {
       it["content"] = detailsModel.contentController.text;
       it["title"] = detailsModel.titleControllerOfDetails.text;
       it["imageBackIndex"] = detailsModel.imageIndex;
       it["imageBackColor"] =  detailsModel.backgroundColor;
       it["fontSize"] =  detailsModel.fontSize;
       it["textColor"] =  detailsModel.textColor;
       it["wid"] = getListItem(id, it["imageBackIndex"], it["imageBackColor"] , it["title"], it["content"], mainModel);      
         }
      }
      setListView();  
  }
} 