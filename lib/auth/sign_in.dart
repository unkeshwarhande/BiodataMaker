

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/auth/signup.dart';

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
                        onPressed: (){

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