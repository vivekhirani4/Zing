import 'package:flutter/material.dart';
import 'package:zing/modules/screens/details_page.dart';
import 'package:zing/model/model.dart';

class ListProduct extends StatefulWidget {
  final subCategoryList;

  ListProduct({Key? key, required this.subCategoryList}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<AllProducts> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = widget.subCategoryList;
  }

  var height = 160;
  var width = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildSubCategoryGridView(),
    );
  }

  Container buildSubCategoryGridView() {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate:
             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 childAspectRatio: (width / height)
             ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          if (productList.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    price: productList[index].price,
                    name: productList[index].name,
                    image: productList[index].image,
                    description: productList[index].name,
                    subDescription: productList[index].description,
                    discount: productList[index].discount,
                    rating: productList[index].rating,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              margin: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSaleImage(),
                      const Spacer(),
                      buildProductImage(index),
                      const Spacer(flex: 2,)
                    ],
                  ),
                  buildAllDetails(index)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildAllDetails(int index) {
    return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[index].name,
                        style: const TextStyle(
                            fontSize: 13,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                      Row(
                        children: [

                          Text(
                            "\₹${productList[index].price.toString()}",
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 3,),
                          Text("\₹${
                            (((productList[index].price * productList[index].discount) / 100) + productList[index].price).toInt() }",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          const Text('In Stock',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12
                            ),),
                          const SizedBox(width: 10,),
                          Image.asset(productList[index].rating,
                          width: 60,)
                        ],
                      ),
                      Text(
                        productList[index].description,
                        style: TextStyle(fontSize: 11, color: Colors.blueGrey.withOpacity(0.9)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
  }

  Padding buildProductImage(int index) {
    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        productList[index].image,
                        height: 110,
                        width: 110,
                      ),
                    );
  }

  Image buildSaleImage() {
    return Image.asset("assets/saleImages/sale.png",
                      height: 40,);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(productList[0].category),
      backgroundColor: Colors.red,
    );
  }
}
