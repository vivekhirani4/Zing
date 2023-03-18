import 'package:flutter/material.dart';

import 'details_page.dart';
import 'model.dart';

class SearchPage extends StatefulWidget {
  final productList;
  const SearchPage({Key? key,
  required this.productList}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<AllProducts> allProducts = [];
  List<AllProducts> searchedList = [];
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  allProducts = widget.productList;
  }

  _searchItem(value){
    if(search.text.isEmpty)
      {
        setState(() {
          searchedList = [];
        });
      }
    else
      {
     setState(() {
     searchedList = allProducts.where((element) => element.name.toLowerCase().contains(value) || element.category.toLowerCase().contains(value)).toList();
     });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: searchedList.isEmpty
          ? const Center(child: Text("Please search item"),)
          : search.text.isNotEmpty && searchedList.isEmpty
          ? const Center(child: Text('No record founds'),)
      : ListView.builder(
          itemCount: searchedList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              shadowColor: Colors.redAccent,
              child: ListTile(
                leading: Image.asset(searchedList[index].image, width: 150,height: 100,),
                title: Text(searchedList[index].name),
                subtitle: Text(searchedList[index].price.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        price: searchedList[index].price,
                        name: searchedList[index].name,
                        image: searchedList[index].image,
                        description: searchedList[index].name,
                        subDescription: searchedList[index].description,
                        discount: searchedList[index].discount,
                        rating: searchedList[index].rating,
                      ),
                    ),
                  );
                },
              ),
            );
          },)
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.red,
      actions:[
       const SizedBox(width: 35,),
        Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: search,
            decoration: InputDecoration(
              hintText: "Search in Zing",
              contentPadding: const EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search,color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onChanged: (value) {
              _searchItem(value);
            },
          ),
        ),
      ),
  ]
    );
  }
}
