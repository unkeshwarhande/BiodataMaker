

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/auth/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class SignuUp extends StatefulWidget{
  @override
  State<SignuUp> createState() {
    // TODO: implement createState
    return _SignuUpState();
  }

}

class _SignuUpState extends   State<SignuUp> {
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();
  bool registerSuccesful = false;
  Future<void> registerUser() async {
    print('pressed');
    try {
      var url = Uri.parse('http://192.168.178.31:5000/api/auth/register');
      print('pressed11');
      var data = jsonEncode({
        "username": "${username.text}",
        "email": "${email.text}",
        "phone": "${phone.text}",
        "password": "${password.text}"
      });
      print('pressed222${data.runtimeType}');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: data,
      );
      print('pressed33');

      if (response.statusCode == 201 || response.statusCode == 201 ) {
        print('Registration successful: ${jsonDecode(response.body)}');
        setState(() {
          registerSuccesful=true;
        });

      } else {
        print('Registration failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }
  checkForRegisterUser(){
    print('called');
    if(username.text != null && username.text !='' && email.text != null && email.text !='' && phone.text != null && phone.text !='' && password.text != null && password.text !='' ){
      print('called22${username.text}');
      print('called22${email.text}');
      print('called22${phone.text}');
      print('called22${password.text}');
      registerUser();
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: Column(
       children: [

         Container(
           height: 170,
           decoration: BoxDecoration(
             color: Colors.blue,
             borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(150.00,80.00),
            bottomRight: Radius.elliptical(150.0,80.0),
             )
           ),
          padding: EdgeInsets.only(left: 10,top: 30),
           child: Row(
           mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               IconButton(onPressed: (){
                 Navigator.pop(context);
               },
                   icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
             ],
           ),
         ),
         SizedBox(height: 60,),
         Center(
           child: Text(
             'Create Account',style: TextStyle(fontFamily: 'Oxygen-Bold',fontSize: 25,color: Colors.blue),
           ),
         ),
         SizedBox(height: 20,),
         Expanded(
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 30),
             child: SingleChildScrollView(
               child: Column(
                     children: [
                       SizedBox(
                         height: 55,
                         child: TextFormField(
                           controller:username ,
                           decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             prefixIcon: Icon(Icons.person_rounded,color: Colors.blue,),
                             hintText: 'Enter Username',
                           ),
                           keyboardType:TextInputType.text,
                         ),
                       ),
                       SizedBox(height: 15,),
                       SizedBox(
                         height: 55,
                         child: TextFormField(
                           controller:email ,
                           decoration: InputDecoration(
                               contentPadding:
                               const EdgeInsets.only(
                                   left: 8.0,
                                   bottom: 8.0,
                                   top: 8.0,
                               right: 18.0),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             prefixIcon: Icon(Icons.email,color: Colors.blue,),
                             hintText: 'Enter Your Email',
                           ),
                           keyboardType:TextInputType.emailAddress,
                         ),
                       ),
                       SizedBox(height: 15,),
                       SizedBox(
                         height: 55,
                         child: TextFormField(
                           controller:phone ,
                           decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                             hintText: 'Enter Your Phone Number',
                           ),
                           keyboardType:TextInputType.number,
                         ),
                       ),
                       SizedBox(height: 15,),
                       SizedBox(
                         height: 55,
                         child: TextFormField(
                           controller:password ,
                           decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                             hintText: 'Password',
                           ),
                           keyboardType:TextInputType.visiblePassword,
                         ),
                       ),
                       SizedBox(height: 15,),
                       SizedBox(
                         height: 55,
                         child: TextFormField(
                           controller:confirmpassword ,
                           decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(29),
                             ),
                             prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                             hintText: 'Confirm Password',
                           ),
                           keyboardType:TextInputType.visiblePassword,
                         ),
                       ),
                       SizedBox(height: 20,),
                       OutlinedButton(
                           onPressed: (){
                             checkForRegisterUser();
                           },
                           child: Text(
                             'SIGN UP',style: TextStyle(fontSize: 15,color: Colors.blue,fontFamily: 'Oxygen-Bold'),
                           )),
                       TextButton(
                           onPressed: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
                           },
                           child: Text('Sign up from here',style: TextStyle(fontSize: 15,color: Colors.blue,fontFamily: 'Oxygen-Bold') ,))
                     ],
                   ),
             ),
           ),
         )
       ],
     ),
   );
  }

}