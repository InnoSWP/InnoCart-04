
import 'package:flutter/material.dart';

import '../homescreen.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{




  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    return  Align( child: SizedBox(width: w * 0.9, child:Column(


      children: [

      ],
    )
    ))
    ;
  }

}



