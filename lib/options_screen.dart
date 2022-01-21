import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './DetailsState.dart';
import './OptionsState.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:select_form_field/select_form_field.dart';


class OptionsScreen extends StatelessWidget {
  
  OptionsScreen({Key? key, dynamic? this.mainModel ,dynamic? this.detailsModel}) : super(key: key);

  dynamic detailsModel;
  dynamic mainModel;
  dynamic colorpicked;
  dynamic enabledColor = Colors.black;
  dynamic disabledColor = Colors.grey;
  final List<Map<String, dynamic>> _fontSizeItems = [
      { "value": 10, "textLabel": "10" }, 
      { "value": 20, "textLabel": "20" }, 
      { "value": 30, "textLabel": "30" }
  ];  

  void dialogTexture(detailsModel, mainModel, optionsModel, context) {
    showDialog(
            context: context,
            builder: (context) {

            return AlertDialog(
              //width: 0.8*MediaQuery.of(model.secondContext).size.width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),  
              content: 
              Container(
                height: 200, 
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Wrap(
                  spacing : 20,
                  children: [
             ...detailsModel.images.map((item) {
                return  Container(
                       width: 50,
                       decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage('images/small/${item}'), fit: BoxFit.cover,),
                      ),
                       child: FlatButton( 
                             color: Colors.transparent,
                             onPressed: () {
                              optionsModel.updateBackgroundTexture(item, detailsModel);
                              Navigator.pop(context);
                              //model.contentController.text = "";
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


   void dialogColor(detailsModel, mainModel, optionsModel, context) {
    showDialog(
            context: context,
            builder: (context) {

            return AlertDialog(
              //width: 0.8*MediaQuery.of(model.secondContext).size.width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),  
              content: 
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ColorPicker(
                   pickerColor: optionsModel.colorPicked,
                   onColorChanged: (color) { 
                     colorpicked = color;
                   }
                 	),
                  ]
                  ),
              actions: [
               FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {    
                      optionsModel.updateBackgroundColor(colorpicked, detailsModel);                  
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                   )
                  
                  ],
              );
            },
          );
  }

  void dialogTextColor(detailsModel, mainModel, optionsModel, context) {
    showDialog(
            context: context,
            builder: (context) {

            return AlertDialog(
              //width: 0.8*MediaQuery.of(model.secondContext).size.width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),  
              content: 
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ColorPicker(
                   pickerColor: optionsModel.colorPicked,
                   onColorChanged: (color) { 
                     colorpicked = color;
                   }
                 	),
                  ]
                  ),
              actions: [
               FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {    
                      optionsModel.updateTextColor(colorpicked, detailsModel);                  
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                   )
                  
                  ],
              );
            },
          );
  }

   void dialogCursorColor(detailsModel, mainModel, optionsModel, context) {
    showDialog(
            context: context,
            builder: (context) {

            return AlertDialog(
              //width: 0.8*MediaQuery.of(model.secondContext).size.width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),  
              content: 
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ColorPicker(
                   pickerColor: optionsModel.cursorColor,
                   onColorChanged: (color) { 
                     colorpicked = color;
                   }
                 	),
                  ]
                  ),
              actions: [
               FlatButton(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {    
                      optionsModel.updateCursorColor(colorpicked, detailsModel);                  
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                   )
                  
                  ],
              );
            },
          );
  }


	@override
	Widget build(BuildContext context) {

     var optionsModel = Provider.of<OptionsState>(context);

     if( detailsModel.imageIndex != null && detailsModel.imageIndex != -1 ) {	
        optionsModel.imageIndex = detailsModel.imageIndex;
      }

		return Scaffold(
	   appBar: AppBar(
	   	leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop( context );
         },
         ), 
	    title: Text('Options', style: TextStyle(color: Colors.black)),
	    backgroundColor: Colors.white,
	    elevation: 2
	   ),	
	   body: Container(

	    child: ListView(
			  padding: EdgeInsets.only(top: 10, bottom: 10),	
              children: [
               ListTile(
               	      enabled: optionsModel.radioValue == 0 ? true : false,
                      leading: 
                      	 Radio(
                         value: 0,
                         groupValue: optionsModel.radioValue,
                         onChanged: (value) {
                           optionsModel.updateRadioButton(value);
                         } 
                      ),
                     title: Text("Background Texture", style: TextStyle(color: optionsModel.radioValue == 0 ? enabledColor : disabledColor, fontSize: 15,)),
                     trailing: Container( 	
                       width: 40, 
                       height: 40,
                       decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage('images/small/${optionsModel.images[optionsModel.imageIndex]}'), fit: BoxFit.cover,),
                      ) ),
                     onTap: () {
                        dialogTexture(detailsModel, mainModel , optionsModel, context);    
                     }
                	),
               ListTile(
               	    enabled: optionsModel.radioValue == 0 ? false : true,
                      leading:
                      Radio(
                         value: 1,
                         groupValue: optionsModel.radioValue,
                         onChanged: (value) {
                           optionsModel.updateRadioButton(value);
                         } 
                      ),
                     title: Text("Background Color", style: TextStyle(color: optionsModel.radioValue == 0 ? disabledColor : enabledColor, fontSize: 15,)),
                     trailing: 
                     Container(	
                       decoration: BoxDecoration(color: optionsModel.colorPicked),
                       width: 40, 
                       height: 40
                      ),
                     onTap: () {
                        dialogColor(detailsModel, mainModel , optionsModel, context);    
                     }
                 ),
                  ListTile(
                  	 leading: Icon(Icons.edit),
                     title: Text("Cursor Color", style: TextStyle(color: enabledColor, fontSize: 15,)),
                     trailing: 
                     Container(	
                       decoration: BoxDecoration(color: optionsModel.cursorColor),
                       width: 40, 
                       height: 40
                      ),
                     onTap: () {
                        dialogCursorColor(detailsModel, mainModel , optionsModel, context);    
                     }
                 ),
                   ListTile(
                  	 leading: Icon(Icons.edit),
                     title: Text("Text Color", style: TextStyle(color: enabledColor, fontSize: 15,)),
                     trailing: 
                     Container(	
                       decoration: BoxDecoration(color: optionsModel.textColor),
                       width: 40, 
                       height: 40
                      ),
                     onTap: () {
                        dialogTextColor(detailsModel, mainModel , optionsModel, context);    
                     }
                 ), 
                  Padding (
                  padding: EdgeInsets.only(left: 15),
                  child: SelectFormField(
                   type: SelectFormFieldType.dialog,
                   initialValue: "15",
                   labelText: "Policy",
                   items: _fontSizeItems,
                   icon: Icon(Icons.edit),
                   onChanged: (value) {
                      optionsModel.updateFontSize(int.parse(value), detailsModel);
                   }
                  ) )
               ]            
              ) 

		),
			     );
	}
}
