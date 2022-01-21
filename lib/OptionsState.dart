import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class OptionsState with ChangeNotifier{


     dynamic images = [ "im0.jpg", "im1.jpg", "im2.jpg"];

     int imageIndex = 0;

     dynamic colorPicked = Colors.blue;

     dynamic radioValue = 0;

     dynamic cursorColor = Colors.black;

     dynamic fontSize = 15;

     dynamic textColor = Colors.black;



     void updateBackgroundTexture(item, detailsModel){

        for(var i=0; i < images.length; i++ ) {
          if (images[i] == item) {
              imageIndex = i;
          }      
        }
        detailsModel.changeBackground(imageIndex, -1);
        notifyListeners();
      }

      void updateBackgroundColor(backColor, detailsModel){
        colorPicked = backColor;
        detailsModel.changeBackground(-1, backColor); 
        notifyListeners();
      }

      void updateRadioButton(value){
        radioValue = value;
        notifyListeners();
      }

      void updateCursorColor(value , detailsModel){
        cursorColor = value;
        detailsModel.updateCursorColor(cursorColor);
        notifyListeners();
      }

      void updateFontSize(value , detailsModel){
        fontSize = value;
        detailsModel.updateFontSize(fontSize);
        notifyListeners();
      }

       void updateTextColor(value , detailsModel){
        textColor = value;
        detailsModel.updateTextColor(textColor);
        notifyListeners();
      }


} 