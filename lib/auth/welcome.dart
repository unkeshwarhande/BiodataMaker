import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_app/auth/sign_in.dart';
import 'package:my_first_app/auth/signup.dart';
import 'package:my_first_app/sizeconfig.dart';

class Welcome extends StatefulWidget{
  @override
  State<Welcome> createState() {
    // TODO: implement createState
    return _WelcomeState();
  }

}
class _WelcomeState extends  State<Welcome> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(92, 144, 246, 1),
    body: Stack(
      children: [
        Container(
          height:MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom,
          padding: EdgeInsets.symmetric(horizontal: 10*SizeConfig.blockSizeHorizontal,vertical: 60*SizeConfig.blockSizeVertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('Welcome to Marriage Biodata',style: Theme.of(context).textTheme.headline1,)),
              SizedBox(height: 15*SizeConfig.blockSizeVertical,),
              Center(child: Text('We are making free marriage biodata',style: Theme.of(context).textTheme.headline3,)),
              Center(child: Text('online in esay way',style: Theme.of(context).textTheme.headline3,)),
              // Center(child: Text('We are making free marriage biodata online in easy way',style: TextStyle(fontSize: 15,color: Colors.white),))
            ],
          ),
        ),
        Container(
          height:MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewInsets.bottom,
          padding: EdgeInsets.all(50),
          child: Align(
              alignment: Alignment.center,
              child: ClipOval(
                child:  Image.asset(
              'assets/coiple2.jpg',
              width: 200, // Adjust size as needed
              height: 200, // Adjust size as needed
              fit: BoxFit.cover, // Adjust how the image is fit within the circle
            ),
              ),
          ),
        ),
        Container(
          height:MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewInsets.bottom,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150*SizeConfig.blockSizeVertical,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignuUp()));
                    },
                    child: Container(
                      height: 50*SizeConfig.blockSizeVertical,
                      width: 220*SizeConfig.blockSizeHorizontal,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:Center(
                          child: Text('SIGN UP',style: TextStyle(fontSize: 15,color: Colors.blue,fontFamily: 'Oxygen-Bold'))),
                    ),
                  ),
                  SizedBox(height:10*SizeConfig.blockSizeVertical),
                  Center(child: Text('Already a member?',style: TextStyle(fontSize: 15,color: Colors.white70,fontFamily: 'Oxygen-Bold'))),
                  SizedBox(height:15*SizeConfig.blockSizeVertical),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
                    },
                      child: Center(child: Text('Sign In',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'Oxygen-Bold')))),

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