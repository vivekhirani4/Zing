import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zing/model.dart';

class ProfilePage extends StatefulWidget {
  final whareItComes;

  const ProfilePage({Key? key, this.whareItComes}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<Cart> orderList = [];

late SharedPreferences srf;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOrderList();
  }

  _getOrderList()async{
    srf = await SharedPreferences.getInstance();
    String orderString = srf.getString('orderList') ?? '';
    List listOrder = jsonDecode(orderString);

    for(var orders in listOrder)
    {
      setState(() {
        orderList.add(Cart.fromJson(orders));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: !widget.whareItComes
          ? AppBar(title: const Text("Profile"), backgroundColor: Colors.red)
          : AppBar(
              toolbarHeight: 0, backgroundColor: Colors.grey[50], elevation: 0),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red,
                  Colors.white.withOpacity(0.1)
                ]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hey, ',style: TextStyle(fontSize: 18,),),
                const Text('Vivek',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                const Spacer(),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/saleImages/myphoto.jpg"),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Your Orders,",style:TextStyle(fontSize: 15,),),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 20),
            height: 110,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                return Card(
                  shadowColor: Colors.red,
                  elevation: 10,
                  borderOnForeground: true,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                      child: Image.asset(orderList[index].image)),
                );
              },),
          )
        ],
      )
    );
  }
}
