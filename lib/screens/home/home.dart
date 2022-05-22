import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofer_app/utilities/constants.dart';
import 'package:gofer_app/utilities/text_style.dart';


class AccountSet extends StatefulWidget {
  const AccountSet ({Key? key}) : super(key: key);

  @override
  _AccountSetState createState() => _AccountSetState();
}




bool isSwitchOn = false;
class _AccountSetState extends State<AccountSet > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Account Settings",style: TextStyle(fontSize: 20,color: kContentColorLightTheme),),
                  Text("Update ypur settings like notifications,payments profile, etc"),

                  SizedBox(height: 25,),

                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_rounded,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Profile Information", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Change Your Account Informtaion", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.lock,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Change Password", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Change Your Password", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.credit_card,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Payment Options", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Add your credit and debit cards", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.location_on_rounded,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Locations", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Add or remove your delivery locations", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.facebook_sharp,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Add social account", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Add facebook, twitter etc.. ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),

                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Refer to friends", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),

                  SizedBox(height: 25,),

                  Text("NOTIFICATIONS",
                    style: TextStyle(color: kColorSmoke,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),),
                  SizedBox(height: 10,),

                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.notifications,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Push Notifications", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        actions: [
                          FlutterSwitch(
                            value: isSwitchOn,
                            onToggle: (value) {
                              setState(() {
                                isSwitchOn = value;
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.notifications,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Push Notifications", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        actions: [
                          FlutterSwitch(
                            value: isSwitchOn,
                            onToggle: (value) {
                              setState(() {
                                isSwitchOn = value;
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.notifications,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Push Notifications", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        actions: [
                          FlutterSwitch(
                            value: isSwitchOn,
                            onToggle: (value) {
                              setState(() {
                                isSwitchOn = value;
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),

                  Text("MORE",
                    style: TextStyle(color: kColorSmoke,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),),
                  SizedBox(height: 10,),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Refer to friends", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Refer to friends", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),
                  FlatButton( onPressed: () {
                  },
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Color(0xFF000000),),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Refer to friends", style: TextStyle(fontSize: 10, color: kContentColorLightTheme,),),
                            Text("Get ", style: TextStyle(fontSize: 10, color: kColorSmoke,),),

                          ],
                        ),
                        Icon(Icons.arrow_forward_ios,size: 5,color:kContentColorLightTheme,)
                      ],
                    ),
                  ),







              ],),
            ],
          ),
        ),
      ),
    );
  }
}
