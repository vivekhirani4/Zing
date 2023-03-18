class HomePageSubCategories {
  String image, name;

  HomePageSubCategories(this.image, this.name);
}


class HomePageDealOfDay {
  String name, description, image, subDescription, rating;
  int price, discount;

  HomePageDealOfDay(this.name,
      this.rating,
      this.discount,
      this.image,
      this.description,
      this.price,
      this.subDescription,);
}

class Cart {
  String image, name, description, subDescription;
  int price, qty, qtyPrice;

  Cart(this.image, this.name, this.price, this.qty, this.description,
      this.qtyPrice, this.subDescription);

  Cart.fromJson(Map<String, dynamic> jsonData)
      : image = jsonData['image'],
        name = jsonData['name'],
        price = jsonData['price'],
        qty = jsonData['qty'],
        description = jsonData['description'],
        qtyPrice = jsonData['qtyPrice'],
        subDescription = jsonData['subDescription'];

  Map<String, dynamic> toJson() =>
      {
        "image": image,
        "name": name,
        "price": price,
        "qty": qty,
        "description": description,
        "qtyPrice": qtyPrice,
        "subDescription": subDescription
      };
}

class AllProducts {
  String image, name, description, category, rating;
  int price, discount;
  bool isDealOfTheDay;

  AllProducts(
  this.isDealOfTheDay,
      this.discount,
      this.image,
      this.rating,
      this.name,
      this.category,
      this.description,
      this.price,
      );
}

class DetailScreenOffers {
  String offerType, offerDescription;

  DetailScreenOffers(this.offerType, this.offerDescription);
}

class Orders{
  String image, name, description, subDescription;
  int price, qty, qtyPrice;

  Orders(this.image, this.name, this.price, this.qty, this.description,
      this.qtyPrice, this.subDescription);

  Orders.fromJson(Map<String, dynamic> jsonData)
      : image = jsonData['image'],
        name = jsonData['name'],
        price = jsonData['price'],
        qty = jsonData['qty'],
        description = jsonData['description'],
        qtyPrice = jsonData['qtyPrice'],
        subDescription = jsonData['subDescription'];

  Map<String, dynamic> toJson() =>
      {
        "image": image,
        "name": name,
        "price": price,
        "qty": qty,
        "description": description,
        "qtyPrice": qtyPrice,
        "subDescription": subDescription
      };
}