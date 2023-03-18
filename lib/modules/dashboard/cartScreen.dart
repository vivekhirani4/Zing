import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zing/modules/dashboard/order_screen.dart';
import '../../model/model.dart';

class CartScreen extends StatefulWidget {
  final whareItComes;

  const CartScreen({
    Key? key,
    this.whareItComes,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalPrice = 0;
  List<Cart> cartList = [];
  List<Cart> orderList = [];

  late SharedPreferences srf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCartList();
    _getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.whareItComes
          ? AppBar(title: const Text("Cart"), backgroundColor: Colors.red)
          : AppBar(
              toolbarHeight: 0, backgroundColor: Colors.grey[50], elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCartList(),
          !widget.whareItComes ? buildTotalPrice() : buildTotalPrice2()
        ],
      ),
    );
  }

  buildCartList() {
    if (cartList.length == 0) {
      return Center(
        child: Text(
          "Cart is empty",
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          final item = cartList[index];
          if (cartList.isEmpty) {
            return const Center(
              child: Text(
                'No item is in Cart',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            );
          } else {
            return Card(
              shadowColor: Colors.red,
              elevation: 3,
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              // color: Colors.red.withOpacity(0.5),
              child: Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (context) {
                          _removeItem(index);
                        },
                      )
                    ],
                  ),
                  child: buildCartItem(index, context)),
            );
          }
        },
      ),
    );
  }

  Container buildCartItem(int index, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProductImage(index, context),
          buildProductDetails(context, index)
        ],
      ),
    );
  }

  Image buildProductImage(int index, BuildContext context) {
    return Image.asset(cartList[index].image,
        width: MediaQuery.of(context).size.width * 0.35);
  }

  Widget buildProductDetails(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartList[index].name,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "\₹${cartList[index].price}",
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Text(
              'FREE Shipping',
              style: TextStyle(fontSize: 11),
            ),
            const Text(
              'In Stock',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
            const SizedBox(
              height: 3,
            ),
            buildProductQuantityPrice(index),
            const SizedBox(
              height: 3,
            ),
            // buildQuantityPlusMinus(index),
            cartList[index].qty < 10
                ? buildQuantityPlusMinus(index)
                : buildQuantityTextField(index)
          ],
        ),
      ),
    );
  }

  buildQuantityTextField(int index) {
    TextEditingController qty = TextEditingController();
    qty.text = cartList[index].qty.toString();
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 65,
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
            ),
            keyboardType: TextInputType.number,
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            textAlign: TextAlign.center,
            controller: qty,
          ),
        ),
        InkWell(
            child: Container(
                height: 30,
                margin: EdgeInsets.only(left: 12),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ))),
            onTap: () {
              int value = int.parse(qty.text);
              setState(() {
                cartList[index].qtyPrice = cartList[index].price * value;
                cartList[index].qty = value;
              });
              getTotalPrice();
            }),
        const SizedBox(
          width: 10,
        ),
        buildRemoveButton(index)
      ],
    );
  }

  Row buildProductQuantityPrice(int index) {
    return Row(
      children: [
        Text(
          'Price * ${cartList[index].qty} : ',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "₹${cartList[index].qtyPrice}",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }

  Row buildQuantityPlusMinus(int index) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (cartList[index].qty <= 1) {
              _removeItem(index);
            } else {
              _decrement(index);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )),
            child: Icon(
              cartList[index].qty > 1 ? Icons.remove : Icons.delete,
              color: Colors.white,
              size: 17,
            ),
          ),
        ),
        Container(
          height: 27,
          color: Colors.red.withOpacity(0.3),
          width: 30,
          child: Center(
            child: Text(
              cartList[index].qty.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _increment(index);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 17,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        buildRemoveButton(index)
      ],
    );
  }

  MaterialButton buildRemoveButton(int index) {
    return MaterialButton(
      color: Colors.red,
      elevation: 0,
      height: 30,
      onPressed: () {
        _removeItem(index);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: const Text(
        'Remove',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  buildTotalPrice() {
    if (cartList.length == 0) {
      return Text(
        "Continue shopping",
        style: TextStyle(
          color: Colors.red.withOpacity(0.7),
        ),
      );
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "\₹${totalPrice.toDouble().toString()}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Charge ',
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.5)),
                ),
                Text(
                  "0.00",
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
            Spacer(),
            buildPlaceOrderButton()
          ],
        ),
      ),
    );
  }

  buildTotalPrice2() {
    if (cartList.length == 0) {
      return Text(
        "Continue shopping",
        style: TextStyle(
          color: Colors.red.withOpacity(0.7),
        ),
      );
    }
    return Container(
      height: 60,
      padding: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 5),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "\₹${totalPrice.toDouble().toString()}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          MaterialButton(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.red,
            onPressed: () {
              _placeOrder();
            },
            child: const Text(
              'Place Order',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }

  MaterialButton buildPlaceOrderButton() {
    return MaterialButton(
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.red,
      onPressed: () {
        _placeOrder();
      },
      child: const Text(
        'Place Order',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _decrement(int index) {
    int quantity = cartList[index].qty;
    if (quantity > 1) {
      setState(() {
        cartList[index].qtyPrice -= cartList[index].price;
        cartList[index].qty = cartList[index].qty - 1;
        getTotalPrice();
        saveData();
      });
    }
  }

  _increment(int index) {
    if (cartList[index].qty < 10) {
      setState(() {
        cartList[index].qtyPrice += cartList[index].price;
        cartList[index].qty = cartList[index].qty + 1;
        getTotalPrice();
        saveData();
      });
    }
  }

  _removeItem(int index) {
    setState(() {
      totalPrice = totalPrice - cartList[index].qtyPrice;
      cartList.removeAt(index);
      getTotalPrice();
      saveData();
    });
  }

  getTotalPrice() {
    totalPrice = 0;
    for (var p in cartList) {
      setState(() {
        totalPrice += p.qtyPrice;
      });
    }
  }

  saveData() async {
    srf = await SharedPreferences.getInstance();
    List cartItems = cartList.map((e) => e.toJson()).toList();
    print(jsonEncode(cartItems));
    srf.setString('cartList', jsonEncode(cartItems));
  }

  _getCartList() async {
    srf = await SharedPreferences.getInstance();
    String cartString = srf.getString('cartList') ?? ' ';

    List cartStringList = jsonDecode(cartString);
    // print(cartStringList);
    for (var item in cartStringList) {
      print(item);
      setState(() {
        cartList.add(Cart.fromJson(item));
      });
    }
    var prices = cartList.map((e) => e.qtyPrice);
    for (var e in prices) {
      totalPrice = totalPrice + e;
    }
  }

  _getOrderList() async {
    srf = await SharedPreferences.getInstance();
    String orderString = srf.getString('orderList') ?? '';
    List listOrder = jsonDecode(orderString);
    for (var order in listOrder) {
      orderList.add(Cart.fromJson(order));
    }
  }

  _placeOrder() async {
    srf = await SharedPreferences.getInstance();
    cartList.addAll(orderList);
    List listOrder = cartList.map((e) => e.toJson()).toList();
    srf.setString('orderList', jsonEncode(listOrder));
    setState(() {
      cartList.clear();
      saveData();
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderScreen(whareItComes: false),
        ));
  }
}
