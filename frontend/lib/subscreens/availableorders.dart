
import 'package:flutter/material.dart';
import 'package:innocart/network/post.dart';
import 'package:innocart/network/service.dart';
import '../homescreen.dart';
import 'order.dart';

class AvailableOrders extends StatefulWidget {
  AvailableOrders({Key? key, required this.title}) : super(key: key);
  String title;


  @override
  State<StatefulWidget> createState() => AvailableOrdersState();
}

class AvailableOrdersState extends State<AvailableOrders>{




  @override
  Widget build(BuildContext context) {
    double h = HomeScreenState.height, w = HomeScreenState.width;
    Size size = MediaQuery.of(context).size;
    var orders = <Widget>[];
    return
      Column(

        children: [
          OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),OrderBox(),
        ]
      );
  }
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }
  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}



