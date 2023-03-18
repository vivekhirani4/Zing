import 'package:flutter/material.dart';
import 'package:zing/modules/screens/subCategories.dart';
import '../../utilities/lists.dart';
import '../screens/details_page.dart';
import '../../model/model.dart';

class ZingHomePage extends StatefulWidget {
  const ZingHomePage({Key? key}) : super(key: key);

  @override
  State<ZingHomePage> createState() => _ZingHomePageState();
}

class _ZingHomePageState extends State<ZingHomePage> {

  final _pageController = PageController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageDealOfDay = allProducts.where((element) => element.isDealOfTheDay == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return
       CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              buildSubCategories(),
              buildDivider(),
              buildTopOffers(context),
              buildDivider(),
              buildDealOfDayText(),
            ],
          ),
        ),
        SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            delegate: SliverChildListDelegate(
                homePageDealOfDay.map((e) =>
                    buildDealOfTheDay(
                        e.isDealOfTheDay,
                        e.discount,
                        e.image,
                        e.rating,
                        e.name,
                        e.category,
                        e.description,
                        e.price)).toList()
            )
        )
      ]
       );
  }

  SizedBox buildSubCategories() {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageSubCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              List<AllProducts> selectedCategory = allProducts
                  .where((element) =>
              element.category == homePageSubCategories[index].name)
                  .toList();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ListProduct(
                            subCategoryList: selectedCategory,
                          )));
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      homePageSubCategories[index].image,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Text(
                    homePageSubCategories[index].name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildTopOffers(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.21,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: homePageOffers.map((e) => buildTopOfferList(e)).toList(),
      ),
    );
  }


  Padding buildDealOfDayText() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Text("Deal Of the Day",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildDealOfTheDay(bool isDealOfTheDay, int discount, String image,
      String rating, String name, String category, String description,
      int price,) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetails(
                  image: image,
                  discount: discount,
                  description: name,
                  subDescription: description,
                  price: price,
                  name: name,
                  rating: rating,
                ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/saleImages/50%off.png",
                  height: 60,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    image,
                    height: 100,
                    width: 110,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  "\₹${price.toString()}",
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8)),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "\₹${price + price}",
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: TextStyle(
                  fontSize: 12, color: Colors.black.withOpacity(0.7)),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Image buildTopOfferList(String image) {
    return Image.asset(
      image,
      fit: BoxFit.fitHeight,
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.3),
      endIndent: 10,
      indent: 10,
    );
  }
}
