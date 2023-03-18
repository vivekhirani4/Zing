import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zing/cartScreen.dart';
import 'package:zing/model.dart';

class ProductDetails extends StatefulWidget {
  final description;
  final name;
  final price;
  final image;
  final subDescription;
  final discount;
  final rating;

  const ProductDetails({Key? key,
    required this.price,
    required this.name,
    required this.image,
    this.description,
    this.subDescription,
    this.rating,
    this.discount})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  List<DetailScreenOffers> detailScreenOffers = [
    DetailScreenOffers(
        'Cashback', "Get ₹20 cashback if you buy with other items in cart."),
    DetailScreenOffers('No Cost EMI',
        "Upto ₹211.46 EMI interest saving on Zing Pay ICICI offer."),
    DetailScreenOffers('But more Save more',
        "Get ₹20.00 back for every eligible item purchased with this offer."),
    DetailScreenOffers(
        'Bank Offer', "Upto ₹374.92 discount on select Credit card offers."),
  ];

  late SharedPreferences srf;

  int qty = 1;

  saveData() async {
    srf = await SharedPreferences.getInstance();
    List cartItems = cartList.map((e) => e.toJson()).toList();
    srf.setString('cartList', jsonEncode(cartItems));
  }

  List<Cart> cartList = [];
  bool productIsInCart = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCartList();
  }

  _checkProductIsInCart(){
    List<String> productName = cartList.map((e) => e.name).toList();
    productName.forEach((element) {
      if(element == widget.name){
        setState(() {
          productIsInCart = true;
        });
      }});
  }
  _getCartList() async {
    srf = await SharedPreferences.getInstance();
    String cartString = srf.getString('cartList') ?? '';
    List cartStringList = jsonDecode(cartString);
    for (var item in cartStringList) {
      setState(() {
        cartList.add(Cart.fromJson(item));
      });
    }
    _checkProductIsInCart();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              buildDescription(),
              const SizedBox(height: 10),
              buildProductImage(),
              const Divider(),
              buildProductPrice(),
              const SizedBox(height: 5),
              buildEMIText(),
              const Divider(),
              buildOffers(),
              const Divider(),
              buildDescriptionText(),
              const SizedBox(height: 10),
              buildSubDescription(),
              buildBottomAddToCart(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      actions: [IconButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartScreen(whareItComes: false),));
      }, icon: Icon(Icons.shopping_cart))],
      elevation: 0,
      title: Text(
        widget.name,
        style: const TextStyle(
            fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text buildEMIText() {
    return Text('EMI from ₹${((widget.price * 7) / 100)
                .toInt()}. No Cost EMI availbale.',
              style: const TextStyle(
                  fontSize: 13
              ),);
  }

  SizedBox buildOffers() {
    return SizedBox(
      height: 115,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.percent_sharp, size: 19,),
              SizedBox(width: 5,),
              Text("Offers",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
            ],
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: detailScreenOffers.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 15),
                  height: 70,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(detailScreenOffers[index].offerType,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      const SizedBox(height: 5,),
                      Text(detailScreenOffers[index].offerDescription,
                        style: const TextStyle(
                            fontSize: 11
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        children: const [
                          Text('See More',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.blueGrey
                            ),
                          ),
                          Icon(Icons.chevron_right,
                            size: 14,
                            color: Colors.blueGrey,)
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Text buildDescriptionText() {
    return const Text(
      'Description',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.description ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Image.asset(
          widget.rating,
          width: 100,
        )
      ],
    );
  }

  buildProductImage() {
    return Center(
      child: Image.asset(
        widget.image,
        height: 300,
        width: 300,
      ),
    );
  }

  buildProductPrice() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\₹${widget.price}",
          style: const TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.discount == null
              ? ""
              : "₹${(((widget.price * widget.discount) / 100) + widget.price)
              .toInt()}",
          style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.red,
              fontSize: 13),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(top: 4, right: 7, left: 7, bottom: 4),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Text(
            widget.discount == null ? "" : "${widget.discount}% Off",
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  buildSubDescription() {
    return Text(
      widget.subDescription ?? "",
      style: const TextStyle(),
    );
  }

  buildBottomAddToCart() {
    if(productIsInCart)
      {
        return Row(
          children: [
            Spacer(),
            MaterialButton(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: Colors.red,
              elevation: 0,
              height: 37,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(whareItComes: false),));
              },
              child: const Text(
                "Go to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      }
    else{
      return Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\₹${widget.price * qty.toDouble()}",
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  if (qty > 1) {
                    qty--;
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    )),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
            Container(
              height: 37,
              color: Colors.red.withOpacity(0.3),
              width: 30,
              child: Center(
                child: Text(
                  qty.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if(qty < 10){
                  setState(() {
                    qty++;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
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
            const SizedBox(width: 10),
            MaterialButton(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: Colors.red,
              elevation: 0,
              height: 37,
              onPressed: addToCart,
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

  }

  void addToCart() {
    cartList.add(Cart(
        widget.image,
        widget.name,
        widget.price,
        qty,
        widget.description,
        widget.price * qty,
        widget.subDescription));
    saveData();

  }
}
