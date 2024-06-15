

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/sizeconfig.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

  var personalDetails=[
    {'title':'Name','value':'Hande Rameshwar Madhavrao'},
    {'title':'Date Of Birth','value':'10/07/1993'},
    {'title':'Place Of Birth','value':'Anjani'},
    {'title':'Rashi','value':'Tul'},
    {'title':'Religion','value':'Virshaiv Lingayt(Dikshavant)'},
    {'title':'Gurumath','value':'Tamloor'},
    {'title':'Height','value':'5 feet 6 inch'},
    {'title':'Education','value':'Electrical Engineer'},
    ];
  var FamilyDetails=[
    {'title':'Father Name','value':'Hande Madhavrao Babarao'},
    {'title':'Mother Name','value':'Hande Savita Madhavrao'},
    {'title':'Brother','value':'Hande Parmeshwar Madhavrao','value1':'Hande Unkeshwar Madhavrao'},
    {'title':'Sister','value':'No'},
    {'title':'Maternal Uncle','value':'Vishwanath devidas Patil Mungade','value1':'At Hokrna tq. Mukhed Dist. Nanded'},
  ];
  var selectedFrame='assets/5-thumb.webp';
  var frameList=['assets/6-thumb.webp','assets/3-thumb.webp','assets/4-thumb.webp','assets/frame9.webp','assets/frame/frame3.png'
   ,'assets/frame/frame6.png','assets/frame/frame12.jpg','assets/frame/frame13.jpg'];
  var contactDetails=[];
  String selectedLang="English";
  bool genratebiodataFlag=false;
  bool personlDetailsFlag=true;
  bool familyDetailsFlag=false;
  bool contactDetailsFlag=false;
  bool frameSelectionFlag=false;

   Uint8List?  bytes;
  TextEditingController field1title=TextEditingController();
  TextEditingController field1value=TextEditingController();
  TextEditingController field2title=TextEditingController();
  TextEditingController field2value=TextEditingController();
  TextEditingController field3title=TextEditingController();
  TextEditingController field3value=TextEditingController();
  TextEditingController field4title=TextEditingController();
  TextEditingController field4value=TextEditingController();
  TextEditingController field5title=TextEditingController();
  TextEditingController field5value=TextEditingController();
  TextEditingController field6title=TextEditingController();
  TextEditingController field6value=TextEditingController();
  TextEditingController field7title=TextEditingController();
  TextEditingController field7value=TextEditingController();
  TextEditingController field8title=TextEditingController();
  TextEditingController field8value=TextEditingController();
  TextEditingController field9title=TextEditingController();
  TextEditingController field9value=TextEditingController();

  TextEditingController fdeails1title=TextEditingController();
  TextEditingController fdeails1value=TextEditingController();
  TextEditingController fdeails1details=TextEditingController();
  TextEditingController fdeails2title=TextEditingController();
  TextEditingController fdeails2value=TextEditingController();
  TextEditingController fdeails2details=TextEditingController();
  TextEditingController fdeails3title=TextEditingController();
  TextEditingController fdeails3value=TextEditingController();
  TextEditingController fdeails3details=TextEditingController();
  TextEditingController fdeails4title=TextEditingController();
  TextEditingController fdeails4value=TextEditingController();
  TextEditingController fdeails4details=TextEditingController();
  TextEditingController fdeails5title=TextEditingController();
  TextEditingController fdeails5value=TextEditingController();
  TextEditingController fdeails5details=TextEditingController();
  TextEditingController fdeails6title=TextEditingController();
  TextEditingController fdeails6value=TextEditingController();
  TextEditingController fdeails6details=TextEditingController();

  TextEditingController cdetais1title=TextEditingController();
  TextEditingController cdetais1value=TextEditingController();
  TextEditingController cdetais2title=TextEditingController();
  TextEditingController cdetais2value=TextEditingController();
  GlobalKey _globalKey = GlobalKey();
  File? image1;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus != PermissionStatus.granted) {
      print('Storage permission not granted');
    }
  }

  Future pickImage(
      [ImageSource imageSource = ImageSource.gallery,
        bool requestFullMetadata = true]) async {
    try {
      final image = await ImagePicker().pickImage(
          source: imageSource, requestFullMetadata: requestFullMetadata);
      if (image == null) return;
      image1 = File(image.path);
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick upp image $e');
    } catch (e) {
      print('error in image picker $e');
    }
  }

  Future<Uint8List> _captureAndSave() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
        return pngBytes!;

    } catch (e) {
      print('Error capturing and saving image: $e');
      return Uint8List.fromList([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 245, 247,1),
      resizeToAvoidBottomInset : true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70 * SizeConfig.blockSizeVertical),
          child:(genratebiodataFlag) ? genrateBiodata()  : fillDetails()
        ),
      ),
    );
  }
fillDetails(){
    if(personlDetailsFlag)
      return personalDetailsFunc();
    if(familyDetailsFlag)
      return familyDetailsFunc();
    if(contactDetailsFlag)
      return contactDetailsFunc();
    if(frameSelectionFlag)
      return frameSelectionFunc();


}
 Widget frameSelectionFunc(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20*SizeConfig.blockSizeHorizontal),
            child: Row(
              children: [
                InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,size: 18*SizeConfig.blockSizeHorizontal,),
                       onTap:(){
                       setState(() {
                        personlDetailsFlag=false;
                        familyDetailsFlag=false;
                        contactDetailsFlag=true;
                      });
                    }
                ),
                SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                Text('Frame & Language Selection',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.blue )),
              ],
            ),
          ),
          SizedBox(height: 10*SizeConfig.blockSizeVertical,),
          Center(child: Text(' Select Frame',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.blue ))),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(frameList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFrame = frameList[index];
                      });
                    },
                    child: Container(
                      height: 200, // Fixed height for each item
                      width: (MediaQuery.of(context).size.width - 32) / 3, // Calculate width for 3 items per row with spacing
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image.asset(frameList[index], fit: BoxFit.scaleDown),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              SizedBox(width: 30,),
              Text('Select Language'),
              SizedBox(width: 70,),
              GestureDetector(
              onTap: (){
                selectedLang ="English";
                setState(() {});
              },
              child: Text(
                'English',style:TextStyle(color: selectedLang == 'English' ? Colors.yellow : Colors.black54),),
            ),
            SizedBox(width: 50,),
            GestureDetector(
              onTap: (){
                selectedLang ="Marathi";
                setState(() {});
              },
              child: Text(
                'Marathi',style:TextStyle(color: selectedLang == 'Marathi' ? Colors.yellow : Colors.black54),),
            )
          ],
          ),
          Center(
            child: TextButton(
                onPressed: (){
                  setState(() {
                    genratebiodataFlag = true;
                  });
                },
                child: Text(
                    'Next',style: TextStyle(fontSize: 18))),
          )
        ],
      ),
    );
  }



  Widget contactDetailsFunc(){
    print('family deils$FamilyDetails');
    return Container(
      width: 370*SizeConfig.blockSizeHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20*SizeConfig.blockSizeHorizontal),
            child: Row(
              children: [
                InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,size: 18*SizeConfig.blockSizeHorizontal,),
                      onTap:(){
                      setState(() {
                        personlDetailsFlag=false;
                        familyDetailsFlag=true;
                        contactDetailsFlag=false;
                      });
                    }
                ),
                SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                Text(
                    'Contact Details',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.blue )),
              ],
            ),
          ),
          SizedBox(height: 20*SizeConfig.blockSizeVertical,),
          Container(
            height: 300*SizeConfig.blockSizeVertical,
            width: 370*SizeConfig.blockSizeHorizontal,
            padding: EdgeInsets.symmetric(horizontal: 20*SizeConfig.blockSizeVertical),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  field1(cdetais1title,cdetais1value),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  field1(cdetais2title,cdetais2value),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10*SizeConfig.blockSizeVertical),
          Center(
            child: TextButton(
                onPressed: (){
                  setState(() {
                    contactDetails=[];
                    if(cdetais1title.text!='' && cdetais1title.text!=null && cdetais1value.text!=''&& cdetais1value.text!=null)
                      contactDetails.add({'title':'${cdetais1title.text}', 'value':'${cdetais1value.text}'});
                    if(cdetais2title.text!='' && cdetais2title.text!=null && cdetais2value.text!=''&& cdetais2value.text!=null)
                      contactDetails.add({'title':'${cdetais2title.text}', 'value':'${cdetais2value.text}'});
                    personlDetailsFlag=false;
                    familyDetailsFlag=false;
                    contactDetailsFlag=false;
                    genratebiodataFlag=false;
                    frameSelectionFlag=true;
                  });
                },
                child: Text(
                    'Next',style: TextStyle(fontSize: 18))),
          )
        ],
      ),
    );
  }


  Widget familyDetailsFunc(){
    print('personal deils$personalDetails');
    return SizedBox(
      width: 370*SizeConfig.blockSizeHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20*SizeConfig.blockSizeHorizontal),
            child: Row(
              children: [
                InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,size: 18*SizeConfig.blockSizeHorizontal,
                    ),
                    onTap:(){
                    setState(() {
                  personlDetailsFlag=true;
                  familyDetailsFlag=false;
                  contactDetailsFlag=false;
                }
                );
                    }
                ),
                SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                Text('Family Details',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.blue )),
              ],
            ),
          ),
          SizedBox(height: 20*SizeConfig.blockSizeVertical,),
          Container(
            // color: Colors.red,
            height: 590*SizeConfig.blockSizeVertical,
            width: 370*SizeConfig.blockSizeHorizontal,
            padding: EdgeInsets.symmetric(horizontal: 20*SizeConfig.blockSizeVertical),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails1title,fdeails1value,fdeails1details),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails2title,fdeails2value,fdeails2details),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails3title,fdeails3value,fdeails3details),
                   SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails4title,fdeails4value,fdeails4details),
                   SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails5title,fdeails5value,fdeails5details),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  fdetails(fdeails6title,fdeails6value,fdeails6details),
                   SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10*SizeConfig.blockSizeVertical),
          Center(
            child: TextButton(
                onPressed: (){
                 setState(() {
                   FamilyDetails=[];
                   if(fdeails1title.text!='' && fdeails1title.text!=null && fdeails1value.text!=''&& fdeails1value.text!=null  )
                     FamilyDetails.add({'title':'${fdeails1title.text}', 'value':'${fdeails1value.text}',});
                   if(fdeails2title.text!='' && fdeails2title.text!=null && fdeails2value.text!=''&& fdeails2value.text!=null )
                     FamilyDetails.add({'title':'${fdeails2title.text}', 'value':'${fdeails2value.text}',});
                   if(fdeails3title.text!='' && fdeails3title.text!=null && fdeails3value.text!=''&& fdeails3value.text!=null  && fdeails3details.text!=''&& fdeails3details.text!=null)
                     FamilyDetails.add({'title':'${fdeails3title.text}', 'value':'${fdeails3value.text}','value1':'${fdeails3details.text}'});
                   if(fdeails4title.text!='' && fdeails4title.text!=null && fdeails4value.text!=''&& fdeails4value.text!=null  && fdeails4details.text!=''&& fdeails4details.text!=null)
                     FamilyDetails.add({'title':'${fdeails4title.text}', 'value':'${fdeails4value.text}','value1':'${fdeails4details.text}'});
                   if(fdeails5title.text!='' && fdeails5title.text!=null && fdeails5value.text!=''&& fdeails5value.text!=null  && fdeails5details.text!=''&& fdeails5details.text!=null)
                     FamilyDetails.add({'title':'${fdeails5title.text}', 'value':'${fdeails5value.text}','value1':'${fdeails5details.text}'});
                   if(fdeails6title.text!='' && fdeails6title.text!=null && fdeails6value.text!=''&& fdeails6value.text!=null  && fdeails6details.text!=''&& fdeails6details.text!=null)
                     FamilyDetails.add({'title':'${fdeails6title.text}', 'value':'${fdeails6value.text}','value1':'${fdeails6details.text}'});
                   personlDetailsFlag=false;
                   familyDetailsFlag=false;
                   contactDetailsFlag=true;

                 });

                },
                child: Text('Next',style: TextStyle(fontSize: 18))),
          )
        ],
      ),
    );
  }


 Widget  personalDetailsFunc(){
    return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Center(
           child: Text('Start creating your Biodata',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
         ),
         SizedBox(height: 10*SizeConfig.blockSizeVertical,),
         Center(child: Text('Personal Details',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color:Colors.blue ))),
         SingleChildScrollView(
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 20*SizeConfig.blockSizeVertical),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field1title,field1value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field2title,field2value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field3title,field3value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field4title,field4value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field5title,field5value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field6title,field6value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field7title,field7value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field8title,field8value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 field1(field9title,field9value),
                 SizedBox(height: 15*SizeConfig.blockSizeVertical),
                 Center(
                   child: TextButton(
                       onPressed: (){
                         setState(() {
                           personalDetails=[];
                           print('aaaaaaaaaa${field1title.text} ${field1value.text}');
                           if(field1title.text!='' && field1title.text!=null && field1value.text!=''&& field1value.text!=null)
                             personalDetails.add({'title':'${field1title.text}', 'value':'${field1value.text}'});
                           if(field2title.text!='' && field2title.text!=null && field2value.text!=''&& field2value.text!=null)
                             personalDetails.add({'title':'${field2title.text}', 'value':'${field2value.text}'});
                           if(field3title.text!='' && field3title.text!=null && field3value.text!=''&& field3value.text!=null)
                             personalDetails.add({'title':'${field3title.text}', 'value':'${field3value.text}'});
                           if(field4title.text!='' && field4title.text!=null && field4value.text!=''&& field4value.text!=null)
                             personalDetails.add({'title':'${field4title.text}', 'value':'${field4value.text}'});
                           if(field5title.text!='' && field5title.text!=null && field5value.text!=''&& field5value.text!=null)
                             personalDetails.add({'title':'${field5title.text}', 'value':'${field5value.text}'});
                           if(field6title.text!='' && field6title.text!=null && field6value.text!=''&& field6value.text!=null)
                             personalDetails.add({'title':'${field6title.text}', 'value':'${field6value.text}'});
                           if(field7title.text!='' && field7title.text!=null && field7value.text!=''&& field7value.text!=null)
                             personalDetails.add({'title':'${field7title.text}', 'value':'${field7value.text}'});
                           if(field8title.text!='' && field8title.text!=null && field8value.text!=''&& field8value.text!=null)
                             personalDetails.add({'title':'${field8title.text}', 'value':'${field8value.text}'});
                           if(field9title.text!='' && field9title.text!=null && field9value.text!=''&& field9value.text!=null)
                             personalDetails.add({'title':'${field9title.text}', 'value':'${field9value.text}'});
                           personlDetailsFlag=false;
                           contactDetailsFlag=false;
                           familyDetailsFlag=true;
                         });
                       },
                       child: Text('Next',style: TextStyle(fontSize: 18))),
                 )
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }

  Widget field1(v1,v2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:50 * SizeConfig.blockSizeVertical,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white60
              ]
            ),
            borderRadius: BorderRadius.circular(12 * SizeConfig.blockSizeVertical),
          ),
          child: Container(
            child:Theme(data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color.fromRGBO(156, 168, 248, 1),
                )),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(30)
                ],

                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15 * SizeConfig.blockSizeHorizontal,
                      right: 15 * SizeConfig.blockSizeHorizontal),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: 'Eg. Name',
                  label: Text(
                    'Title',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.9 * SizeConfig.blockSizeHorizontal,
                        color:  Color.fromRGBO(103, 85, 214, 1)),
                    borderRadius:  BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(103, 85, 214, 1),
                        width: 0.9 * SizeConfig.blockSizeHorizontal),
                  ),
                ),
                controller: v1,
              ),
            ),
          ),
        ),
        SizedBox(height: 15*SizeConfig.blockSizeVertical,),
        Container(
          height:50 * SizeConfig.blockSizeVertical,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white60
                ]
            ),
            borderRadius: BorderRadius.circular(12 * SizeConfig.blockSizeVertical),
          ),
          child: Container(

            child:  Theme(data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color.fromRGBO(156, 168, 248, 1),
                )),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(40)
                ],
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15 * SizeConfig.blockSizeHorizontal,
                      right: 15 * SizeConfig.blockSizeHorizontal),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: 'Eg. Abc Pqr Xyz',
                  label: Text(
                    'Value',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.9 * SizeConfig.blockSizeHorizontal,
                        color:  Color.fromRGBO(103, 85, 214, 1)),
                    borderRadius:  BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(103, 85, 214, 1),
                        width: 0.9 * SizeConfig.blockSizeHorizontal),
                  ),
                ),
                controller: v2,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget fdetails(v1,v2,v3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:50 * SizeConfig.blockSizeVertical,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white60
                ]
            ),
            borderRadius: BorderRadius.circular(12 * SizeConfig.blockSizeVertical),
          ),
          child: Container(
            child:  Theme(data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color.fromRGBO(156, 168, 248, 1),
                )),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(30)
                ],
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15 * SizeConfig.blockSizeHorizontal,
                      right: 15 * SizeConfig.blockSizeHorizontal),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(
                    'Title',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.9 * SizeConfig.blockSizeHorizontal,
                        color:  Color.fromRGBO(103, 85, 214, 1)),
                    borderRadius:  BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(103, 85, 214, 1),
                        width: 0.9 * SizeConfig.blockSizeHorizontal),
                  ),
                ),
                controller: v1,
              ),
            ),
          ),
        ),
        SizedBox(height: 15*SizeConfig.blockSizeVertical,),
        Container(
          height:50 * SizeConfig.blockSizeVertical,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white60
                ]
            ),
            borderRadius: BorderRadius.circular(12 * SizeConfig.blockSizeVertical),
          ),
          child: Container(

            child: Theme(data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color.fromRGBO(156, 168, 248, 1),
                )),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(40)
                ],
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15 * SizeConfig.blockSizeHorizontal,
                      right: 15 * SizeConfig.blockSizeHorizontal),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(
                    'Value',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.9 * SizeConfig.blockSizeHorizontal,
                        color:  Color.fromRGBO(103, 85, 214, 1)),
                    borderRadius:  BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(103, 85, 214, 1),
                        width: 0.9 * SizeConfig.blockSizeHorizontal),
                  ),
                ),
                controller: v2,
              ),
            ),
          ),
        ),
        SizedBox(height: 15*SizeConfig.blockSizeVertical,),
        Container(
          height:49 * SizeConfig.blockSizeVertical,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white60
                ]
            ),
            borderRadius: BorderRadius.circular(12 * SizeConfig.blockSizeVertical),
          ),
          child: Container(

            child: Theme(data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color.fromRGBO(156, 168, 248, 1),
                )),
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(40)
                ],
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15 * SizeConfig.blockSizeHorizontal,
                      right: 15 * SizeConfig.blockSizeHorizontal),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(
                    'Details (Optional)',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.9 * SizeConfig.blockSizeHorizontal,
                        color:  Color.fromRGBO(103, 85, 214, 1)),
                    borderRadius:  BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9 * SizeConfig.blockSizeVertical),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(103, 85, 214, 1),
                        width: 0.9 * SizeConfig.blockSizeHorizontal),
                  ),
                ),
                controller: v3,
              ),
            ),
          ),
        ),
      ],
    );
  }

Widget genrateBiodata(){
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  genratebiodataFlag=false;
                  frameSelectionFlag=true;
                });
              },
              child: Padding(
                  padding: EdgeInsets.only(left:20*SizeConfig.blockSizeHorizontal),
                child: Icon(
                  Icons.arrow_back_ios
                ),
              ),
            ),
       SizedBox(width: 50,),
            Text(selectedLang == 'English' ?'Biodata': 'बायोडेटा')
          ],
        ),
        SizedBox(height: 40,),
        RepaintBoundary(
          key: _globalKey,
          child: Stack(
            children: [
              Container(
                height: 680*SizeConfig.blockSizeVertical,
                child:Image.asset(selectedFrame,fit: BoxFit.fill,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60*SizeConfig.blockSizeVertical,),
                  Container(
                    height: 100,
                    child: Center(
                      child: GestureDetector(
                        onTap: ()async{
                          await pickImage(ImageSource.gallery);},
                          child: (image1 != null)
                              ?  ClipOval(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(50),
                                  child: Image.file(image1!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                              :Image.asset('assets/1000160837.png',fit: BoxFit.fill,)),
                    ),
                  ),
                  SizedBox(height: 10*SizeConfig.blockSizeVertical,),
                  Center(child: Text(selectedLang == 'English' ? '|| SHREE GANESHAY NAMHA ||':'श्री गणेशाय नम:',style: TextStyle(fontSize: 11,color: Color.fromRGBO(183, 142, 8,1),fontWeight: FontWeight.bold))),
                  SizedBox(height: 3*SizeConfig.blockSizeVertical,),
                  Center(child: Text(selectedLang == 'English' ? 'BIODATA' : 'बायोडेटा',style: TextStyle(fontSize: 11,color: Color.fromRGBO(183, 142, 8,1),fontWeight: FontWeight.bold))),
                  SizedBox(height: 15*SizeConfig.blockSizeVertical,),
                  Container(
                    padding: EdgeInsets.only(left: 40*SizeConfig.blockSizeHorizontal,top: 0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0.0),
                        itemCount: personalDetails.length,
                        itemBuilder: (context,index){
                          return SizedBox(
                            height: 20*SizeConfig.blockSizeVertical,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:70*SizeConfig.blockSizeHorizontal,
                                  child: Text(personalDetails[index]['title'].toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                  width:250*SizeConfig.blockSizeHorizontal,
                                  child: Text(':   ${personalDetails[index]['value'].toString()}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 10*SizeConfig.blockSizeVertical,),
                  Center(child: Text(selectedLang == 'English' ? 'FAMILY DETAILS':'कौटुंबिक माहिती',style: TextStyle(fontSize: 11,color: Color.fromRGBO(183, 142, 8,1),fontWeight: FontWeight.bold))),
                  SizedBox(height: 10*SizeConfig.blockSizeVertical,),
                  Container(
                    padding: EdgeInsets.only(left: 40*SizeConfig.blockSizeHorizontal),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0.0),
                        itemCount: FamilyDetails.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              SizedBox(
                                height: 20*SizeConfig.blockSizeVertical,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:70*SizeConfig.blockSizeHorizontal,
                                      child: Text(FamilyDetails[index]['title'].toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,overflow: TextOverflow.visible)),
                                    ),
                                    Container(
                                      width:250*SizeConfig.blockSizeHorizontal,
                                      child: Text(':   ${FamilyDetails[index]['value'].toString()}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                    )
                                  ],
                                ),
                              ),
                              if(FamilyDetails[index].containsKey('value1'))
                                SizedBox(
                                  height: 15*SizeConfig.blockSizeVertical,
                                  child: Row(
                                    children: [
                                      Container(
                                        width:80*SizeConfig.blockSizeHorizontal,
                                      ),
                                      Container(
                                        width:250*SizeConfig.blockSizeHorizontal,
                                        child: Text('    ${FamilyDetails[index]['value1'].toString()}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                      )
                                    ],
                                  ),
                                ),
                              SizedBox(height: 5*SizeConfig.blockSizeVertical,),
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 10*SizeConfig.blockSizeVertical,),
                  Center(child: Text(selectedLang == 'English' ? 'CONTACT DETAILS': 'संपर्क',style: TextStyle(fontSize: 11,color: Color.fromRGBO(183, 142, 8,1),fontWeight: FontWeight.bold))),
                  SizedBox(height: 10*SizeConfig.blockSizeVertical,),
                  Container(
                    padding: EdgeInsets.only(left: 40*SizeConfig.blockSizeHorizontal,top: 0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0.0),
                        itemCount: contactDetails.length,
                        itemBuilder: (context,index){
                          return SizedBox(
                            height: 20*SizeConfig.blockSizeVertical,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:80*SizeConfig.blockSizeHorizontal,
                                  child: Text(contactDetails[index]['title'].toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                  width:250*SizeConfig.blockSizeHorizontal,
                                  child: Text(':   ${contactDetails[index]['value'].toString()}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40,),
        Center(
          child: ElevatedButton(
            onPressed: ()async{
              // _captureAndSave();
              Uint8List pngBytes = await _captureAndSave();
              final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100, name: "${personalDetails[0]['value'].toString()}");
              print("hhhhhh$result");
              if(result['isSuccess']){
                Fluttertoast.showToast(
                  msg: "Image download successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }else{
                Fluttertoast.showToast(
                  msg: "error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            child: Text('Download'),
          ),
        )
      ],
    );
}
  saveImage(bytes)async{
    final appDocDir = await getApplicationDocumentsDirectory();
    final file =File('${appDocDir.path}/image.png');
    file.writeAsBytes(bytes);
  }
}