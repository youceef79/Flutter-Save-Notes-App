import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './note_details.dart';
import './my_home_page.dart';
import './options_screen.dart';

class DetailsState with ChangeNotifier{


     dynamic images = [ "im0.jpg", "im1.jpg", "im2.jpg"];

     dynamic imageIndex = null;

     bool once = true;

     dynamic itemIndex;

     dynamic cursorColor = Colors.black;

     dynamic fontSize = 15;

     TextEditingController titleControllerOfDetails = TextEditingController();

     TextEditingController contentController = TextEditingController();

     dynamic secondContext = null;

     dynamic backgroundColor = Colors.white;

     dynamic textColor = Colors.black;

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
  
    String getImage(index){
        return images[index];
    } 

  void changeBackground(imageindex, color){

      if( imageindex != -1 ) {
        imageIndex = imageindex;
        backgroundColor = -1;
      } else {
        backgroundColor = color;
        imageIndex = -1;
      }
      notifyListeners();
  } 

   void updateCursorColor(color){
      cursorColor = color;
      notifyListeners();
    }

    void updateFontSize(font){
      fontSize = font;
      notifyListeners();
    }  

    void updateTextColor(color){
      textColor = color;
      notifyListeners();
    }  

  
} 