import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zing/model.dart';

class OrderScreen extends StatefulWidget {
  final whareItComes;

  const OrderScreen({Key? key, this.whareItComes}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Cart> orderList = [];
  late SharedPreferences srf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOrderList();
  }

  _getOrderList() async {
    srf = await SharedPreferences.getInstance();
    String orderString = srf.getString('orderList') ?? '';
    List listOrder = jsonDecode(orderString);

    for (var orders in listOrder) {
      setState(() {
        orderList.add(Cart.fromJson(orders));
      });
    }
  }

  saveData() async {
    srf = await SharedPreferences.getInstance();
    List listOrder = orderList.map((e) => e.toJson()).toList();
    srf.setString('orderList', jsonEncode(listOrder));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.whareItComes
          ? AppBar(title: const Text("Profile"), backgroundColor: Colors.red)
          : AppBar(
              toolbarHeight: 0, backgroundColor: Colors.grey[50], elevation: 0),
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.red,
            child: ListTile(
                leading: Image.asset(
                  orderList[index].image,
                  width: 120,
                  height: 120,
                ),
                title: Text(orderList[index].name),
                subtitle: Text(orderList[index].price.toString()),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        orderList.removeAt(index);
                        saveData();
                      });
                    },
                    icon: const Icon(Icons.delete))),
          );
        },
      ),
    );
  }
}
