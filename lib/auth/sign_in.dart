

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/auth/signup.dart';
import 'package:my_first_app/home.dart';
import 'package:my_first_app/sizeconfig.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() {
    // TODO: implement createState
    return _SignInState();
  }

}

class _SignInState extends   State<SignIn> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  var resultData = {};
  bool loginUserFlag =  false;
  Future<bool> loginUser() async {
    resultData={};
    print('pressed');
    try {
      var url = Uri.parse('http://ec2-3-109-59-81.ap-south-1.compute.amazonaws.com:5000/api/auth/login');
      print('pressed11');
      var data = jsonEncode({
        "email": "${email.text}",
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

      if (response.statusCode == 201 || response.statusCode == 200 ) {
        print('Registration successful: ${jsonDecode(response.body)}');
        resultData=jsonDecode(response.body);
        print('Registration successful data: ${resultData}');
        return true;

      } else {
        print('Registration failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        resultData=jsonDecode(response.body);
        print('Registration failed data: ${resultData['message']}');
        return false;
      }
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                Spacer(),
                OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Skip')),
                SizedBox(width: 10,)
              ],
            ),
          ),
          SizedBox(height: 100,),
          Center(
            child: Text(
              'Sign In Now',style: TextStyle(fontFamily: 'Oxygen-Bold',fontSize: 25,color: Colors.blue),
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller:email ,
                        decoration: InputDecoration(
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
                    SizedBox(height: 100,),
                    OutlinedButton(
                        onPressed: ()async{
                          if( email.text != null && email.text !=''  && password.text != null && password.text !='' ) {
                            print('called22${email.text}');
                            print('called22${password.text}');
                            loginUserFlag = await loginUser();
                            if (loginUserFlag) {
                              Fluttertoast.showToast(
                                msg: "${resultData["message"]}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            } else {
                              Fluttertoast.showToast(
                                msg: "${resultData["message"]}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }

                        },
                        child: Text(
                          'SIGN IN',style: TextStyle(fontSize: 15,color: Colors.blue,fontFamily: 'Oxygen-Bold'),
                        )),
                    SizedBox(height: 30,),
                    Text('Dont you have an account',style: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: 'Oxygen-Bold')),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignuUp()));
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