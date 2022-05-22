import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofer_app/utilities/constants.dart';

class GetStart extends StatefulWidget{
  _GetStart createState() => _GetStart();
}

class _GetStart extends State<GetStart>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: ListView(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 250,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/Mask.png",scale: 5,),

                      SizedBox(height: 20,),
                      Text("All your Favorites",
                        style: TextStyle(color: kContentColorLightTheme,
                            fontSize: 25,fontWeight: FontWeight.w500),),
                      Text("Order from the best local resturants with easy, on demand delivery services",
                        style: TextStyle(color: kColorSmoke ,
                            fontSize: 10,fontWeight: FontWeight.w500),),

                      SizedBox(height: 15,),


                      FlatButton( onPressed: () {
                      },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(color: Color(0xFFEE6F34),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("GET STARTED",
                            style: TextStyle(color: Colors.white,
                            fontSize: 10,fontWeight: FontWeight.w300),),),

                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 250,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/Mask.png",scale: 5,),

                      SizedBox(height: 20,),
                      Text("Free Delivery offers",
                        style: TextStyle(color: kContentColorLightTheme,
                            fontSize: 25,fontWeight: FontWeight.w500),),
                      Text("Free delivery for new customers within Yenagoa, Bayelsa State",
                        style: TextStyle(color: kColorSmoke ,
                            fontSize: 10,fontWeight: FontWeight.w500),),

                      SizedBox(height: 15,),


                      FlatButton( onPressed: () {
                      },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(color: Color(0xFFEE6F34),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("GET STARTED",
                            style: TextStyle(color: Colors.white,
                                fontSize: 10,fontWeight: FontWeight.w300),),),

                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 250,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/Mask.png",scale: 5,),

                      SizedBox(height: 20,),
                      Text("Choose your food",
                        style: TextStyle(color: kContentColorLightTheme,
                            fontSize: 25,fontWeight: FontWeight.w500),),
                      Text("Easily find your type of food craving and you’ll get delivery in wide range.",
                        style: TextStyle(color: kColorSmoke ,
                            fontSize: 10,fontWeight: FontWeight.w500),),

                      SizedBox(height: 15,),


                      FlatButton( onPressed: () {
                      },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(color: Color(0xFFEE6F34),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("GET STARTED",
                            style: TextStyle(color: Colors.white,
                                fontSize: 10,fontWeight: FontWeight.w300),),),

                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}