import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gofer_app/utilities/constants.dart';
class SignIn extends StatefulWidget{
  _SignIn createState()=> _SignIn();
}
class _SignIn extends State<SignIn>{
  @override

  TextEditingController passwordC = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25,),
          child: ListView(
            children: [
              Center(child: Text("Sign in",
                style: TextStyle(color: Colors.black,fontSize: 10,
                ),),),
              SizedBox(height: 30,),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: 15,),
              Text("Welcome to Gofer",style: TextStyle(
                color: kContentColorLightTheme,fontSize: 25,fontWeight: FontWeight.w500
              ),),
              Text("Enter your Phone number for sign in. Enjoy your food :)",style: TextStyle(
                  color: kColorSmoke,fontSize: 10,fontWeight: FontWeight.w300
              ),),

              SizedBox(height: 15,),

              Text("PHONE NUMBER",
                style: TextStyle(color: kColorSmoke,fontSize: 12,
                fontWeight: FontWeight.w300),),
              TextField(
                onChanged: (String text) {

                },
                style: TextStyle(color: Colors.black,),
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: kColorSmoke),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10,),
              Text("PASSWORD",
                style: TextStyle(color: kColorSmoke,fontSize: 12,
                    fontWeight: FontWeight.w300),),
              TextField(
                onChanged: (String text) {

                },
                style: TextStyle(color: Colors.black,),
                controller:passwordC,
                maxLength: 8,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "input Password",
                  hintStyle: TextStyle(color: kColorSmoke),
                  border: InputBorder.none,
                ),
              ),

              SizedBox(height: 15,),
            Center(child: Column(children: [
              FlatButton(onPressed: (){
              }, child: Text("Forgot Password?",style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10
              ),)),
            ],),),

              SizedBox(height: 10,),

              FlatButton( onPressed: () {
              },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(color: Color(0xFFEE6F34),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text("SIGN IN",
                    style: TextStyle(color: Colors.white,
                        fontSize: 10,fontWeight: FontWeight.w300),),),

                ),
              ),

              Row(
                children: [
                  FlatButton(onPressed: (){
                  }, child: Row(
                    children: [
                      Text("Dont have an account?",style: TextStyle(
                          color: kColorSmoke,
                          fontSize: 10
                      ),),
                      SizedBox(width: 5,),
                      Text("Create Account",style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 10
                      ),),
                    ],
                  )
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}