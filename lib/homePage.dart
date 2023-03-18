import 'package:flutter/material.dart';
import 'package:zing/subCategories.dart';
import 'details_page.dart';
import 'model.dart';

class ZingHomePage extends StatefulWidget {
  const ZingHomePage({Key? key}) : super(key: key);

  @override
  State<ZingHomePage> createState() => _ZingHomePageState();
}

class _ZingHomePageState extends State<ZingHomePage> {

  final _pageController = PageController();

  List<HomePageSubCategories> homePageSubCategories = [
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory2.jpg', 'Speaker'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory3.jpeg', 'Laptops'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory4.jpeg', 'Toys'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory5.jpeg', 'Ear Buds'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory6.jpeg', 'Electronics'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory7.jpeg', 'Books'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory8.jpeg', 'EarPhones'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory9.jpeg', 'CCTV'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory10.jpeg', 'Games'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory11.jpeg', 'bag'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory12.jpeg', 'SLR'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory13.jpeg', 'Wallet'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory14.jpeg', 'Cooker'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory15.jpeg', 'Shoes'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory16.jpeg', 'Googles'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory17.jpeg', 'Pen'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory18.jpeg', 'HeadPhones'),
    HomePageSubCategories(
        'assets/subCategories/homePageSubCatagory19.jpeg', 'Oven')
  ];

  List<AllProducts> homePageDealOfDay = [];

  List<String> homePageOffers = [
    'assets/homePageOffers/offer1.png',
    'assets/homePageOffers/offer2.jpg',
    'assets/homePageOffers/offer3.png',
    'assets/homePageOffers/offer4.png',
    'assets/homePageOffers/offer5.png',
    'assets/homePageOffers/offer6.png',
  ];
  List<AllProducts> allProducts = [
    AllProducts(
        true,
        18,
        "assets/products/product1.jpeg",
        "assets/ratingStar/rating5.png",
        "AmazonBasics 5W Bluetooth 5.0 Speaker",
        'Speaker',
        "AmazonBasics 5W Bluetooth 5.0 Speaker, Upto 36 Hrs Playtime, True Wireless Technology, Built in Mic, Multiple Connectivity Modes (Black)",
        699),
    AllProducts(
        false,
        32,
        "assets/products/product2.jpg",
        "assets/ratingStar/rating4.png",
        " Mivi Roam 2 Bluetooth Speaker",
        'Speaker',
        "Mivi Roam 2 Bluetooth 5W Portable Speaker,24 Hours Playtime,Powerful Bass, Wireless Stereo Speaker with Studio Quality Sound,Waterproof, Bluetooth 5.0 and in-Built Mic ",
        1099),
    AllProducts(
        false,
        22,
        "assets/products/product3.jpeg",
        "assets/ratingStar/rating3.png",
        "Zebronics ZEB-COUNTY 3W  ",
        'Speaker',
        "Zebronics ZEB-COUNTY 3W Wireless Bluetooth Portable Speaker With Supporting Carry Handle, USB, SD Card, AUX, FM & Call Function. (Green)",
        543),
    AllProducts(
        false,
        32,
        "assets/products/product4.jpeg",
        "assets/ratingStar/rating4.png",
        "pTron Musicbot Lite 5W Mini Bluetooth Speaker",
        'Speaker',
        "Newly Launched pTron Musicbot Lite 5W Mini Bluetooth Speaker with 6Hrs Playtime, Immersive Sound, 40mm Driver, BT5.1 with Strong Connectivity, Portable Design",
        499),
    AllProducts(
        false,
        12,
        "assets/products/product5.jpeg",
        "assets/ratingStar/rating3.png",
        "ZEBRONICS Zeb-Vita Plus Mini",
        'Speaker',
        "ZEBRONICS Zeb-Vita Plus Mini 16 w Soundbar Supporting LED Display, USB, SD Card, AUX, FM, TWS & Call Function. (Red)",
        1499),
    AllProducts(
        false,
        12,
        "assets/products/product6.jpeg",
        "assets/ratingStar/rating4.png",
        "Celrax Touch Lamp ",
        'Speaker',
        "Celrax Touch Lamp Truly Wireless Bluetooth Portable Speaker (Multicolour)",
        399),
    AllProducts(
      true,
      20,
      'assets/dealOfTheDay/dealOfTheDay1.webp',
      "assets/ratingStar/rating5.png",
      'Hp ZBook Firefly',
      'Laptops',
      "Tackle intense workflows from anywhere with the ZBook Fury—now offering a desktop class CPU in a laptop. With pro-graphics, complete color accuracy and enhanced collaboration features you can render in 3D or train machine learning models on-the-go.",
      127499,
    ),
    AllProducts(
        false,
        18,
        "assets/products/product8.jpeg",
        "assets/ratingStar/rating3.png",
        "Acer Nitro 5 Gaming Laptop",
        "Laptops",
        "Acer Nitro 5 Gaming Laptop Intel Core i5-11400H 11th Gen Processor (16GB/512GB SSD/ NVIDIA GeForce GTX",
        59990),
    AllProducts(
        false,
        13,
        "assets/products/product9.jpeg",
        "assets/ratingStar/rating2.png",
        "Dell Vostro 3420 Laptop",
        "Laptops",
        "Dell Vostro 3420 Laptop,12th Gen Intel Core i3-1215U, 8GB & 512GB SSD, 14.0\" (35.56Cms) FHD WVA AG 250 nits, Windows 11 + MSO'21, Carbon Black ",
        43000),
    AllProducts(
        false,
        34,
        "assets/products/product10.jpeg",
        "assets/ratingStar/rating4.png",
        "MSI GF63 Thin, Intel 11th Gen",
        "Laptops",
        "MSI GF63 Thin, Intel 11th Gen. i5-11400H, 40CM FHD 144Hz Gaming Laptop (8GB/512GB NVMe SSD/ Windows 11 Home/NVIDIA RTX 3050 4GB ",
        58000),
    AllProducts(
        false,
        19,
        "assets/products/product11.jpeg",
        "assets/ratingStar/rating3.png",
        "HP 15s",
        "Laptops",
        "HP 15s, 12th Gen Intel Core i5 16GB RAM/512GB SSD 15.6-inch(39.6 cm) Micro-Edge Anti-Glare FHD Laptop/Win 11/Intel Iris Xe Graphics/Dual Speakers/Alexa/Backlit ",
        62120),
    AllProducts(
        false,
        22,
        "assets/products/product12.jpeg",
        "assets/ratingStar/rating5.png",
        "HP G8 Core Intel i3 11th Gen",
        "Laptops",
        "HP G8 Core Intel i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 240 G8 Business Laptop (14 inch, Black Grey, 1.47 kg) 689T7PA",
        33999),
    AllProducts(
        false,
        13,
        "assets/products/product13.jpeg",
        "assets/ratingStar/rating2.png",
        "Baby Rattles 9-Piece",
        'Toys',
        "Little Innocents BPA-Free Non Toxic Toddler Baby Rattles 9-Piece Rattle Set-1",
        399),
    AllProducts(
        false,
        32,
        "assets/products/product14.jpeg",
        "assets/ratingStar/rating3.png",
        "Kids Puzzle Games ",
        'Toys',
        "FunBlast DIY Plastic Building Blocks for Kids Puzzle Games for Kids, Toys for Children Educational & Learning Toy ",
        347),
    AllProducts(
        false,
        23,
        "assets/products/product15.jpeg",
        "assets/ratingStar/rating3.png",
        "Webby Beauty Set",
        'Toys',
        "The beauty kit includes a plethora of exciting dummy products including a hairdryer, lipsticks, earrings, comb, and mirror. Given the number of components it features, this kit also makes for an excellent birthday gift.The beauty kit includes a plethora of exciting dummy products including a hairdryer, lipsticks, earrings, comb, and mirror. Given…",
        248),
    AllProducts(
        false,
        12,
        "assets/products/product16.jpeg",
        "assets/ratingStar/rating2.png",
        "Car Toy 4 Pack with Screwdriver Toy",
        'Toys',
        "Cable World® Military Army Foldable Vehicles Car Toy 4 Pack with Screwdriver Toy, DIY Kids STEM Toys Including ",
        559),
    AllProducts(
        false,
        52,
        "assets/products/product17.jpeg",
        "assets/ratingStar/rating2.png",
        "Set of 5 Superheroes",
        'Toys',
        "Kammateswara Super Hero Action Figure Toy Set in Action Figure Toy for Kids (Set of 5 Superheroes)",
        315),
    AllProducts(
        true,
        43,
        "assets/products/product18.jpeg",
        "assets/ratingStar/rating5.png",
        "Big Size Monster Truck",
        'Toys',
        "Sanghariyat Big Size Monster Truck Friction Powered Cars Toys, 360 Degree Stunt 4wd Cars Push go Truck for ",
        289),
    AllProducts(
        false,
        22,
        "assets/products/product19.jpeg",
        "assets/ratingStar/rating1.png",
        "boAt Airdopes 141",
        "Ear Buds",
        "boAt Airdopes 141 Bluetooth Truly Wireless in Ear Earbuds with mic, 42H Playtime, Beast Mode(Low Latency Upto 80ms) for Gaming, ENx Tech, ASAP Charge, IWP, IPX4 Water ",
        1499),
    AllProducts(
        false,
        18,
        "assets/products/product20.jpeg",
        "assets/ratingStar/rating5.png",
        "Noise Buds VS104 Pro",
        "Ear Buds",
        "Noise Buds VS104 Pro Truly Wireless in Ear Earbuds with Mic, 40-Hours of Playtime, Quad Mic with ENC, Instacharge, 14.2mm Driver, Hyper Sync, and BT v5.3 (Jet Black)",
        1699),
    AllProducts(
        false,
        19,
        "assets/products/product21.jpeg",
        "assets/ratingStar/rating5.png",
        "OnePlus Nord Buds",
        "Ear Buds",
        "OnePlus Nord Buds True Wireless in Ear Earbuds with Mic, 12.4mm Titanium Drivers, Playback:Up to 30hr case, 4-Mic Design + AI Noise Cancellation, IP55 Rating, Fast ",
        2400),
    AllProducts(
        false,
        12,
        "assets/products/product22.jpeg",
        "assets/ratingStar/rating3.png",
        "JBL Tune 230NC TWS",
        "Ear Buds",
        "The JBL Tune 230NC TWS earbuds offer long playtime of 40 hours with Bluetooth and ANC off, ensuring you'll never miss a beat.The JBL Tune 230NC TWS earbuds offer long playtime of 40 hours with Bluetooth and ANC off, ensuring you'll never miss a beat.",
        59999),
    AllProducts(
        false,
        14,
        "assets/products/product23.jpeg",
        "assets/ratingStar/rating2.png",
        "Sony WF-1000XM4",
        "Ear Buds",
        "This V1Processor  improves the sound quality and blocks more noise in a loud environment.This V1Processor  improves the sound quality and blocks more noise in a loud environment.",
        19990),
    AllProducts(
        true,
        42,
        "assets/products/product24.jpeg",
        "assets/ratingStar/rating4.png",
        "M10 TWS Bluetooth 5.1 ",
        "Ear Buds",
        "Life Like M10 TWS Bluetooth 5.1 Earphone Charging boxwireless Earbuds Stereo Sports Waterproof with Microphone True Wireless Bluetooth In Ear Headset (Black)",
        455),
    AllProducts(
        true,
        14,
        "assets/products/product25.jpeg",
        "assets/ratingStar/rating3.png",
        "Boult Audio X1 Buds",
        "Ear Buds",
        "Boult Audio X1 Buds True Wireless in Ear Earbuds with 24H Playtime, Quad Mic ENC, Made in India, Type-C Fast Charging, Environmental Noise Cancellation, 10mm Bass ",
        1699),
    AllProducts(
        false,
        22,
        "assets/products/product26.jpeg",
        "assets/ratingStar/rating2.png",
        "realme Buds Air 3 Neo",
        "Ear Buds",
        "realme Buds Air 3 Neo True Wireless in-Ear Earbuds with Mic, 30 hrs Playtime with Fast Charging and Dolby Atmos Support (Starry Blue)",
        1999),
    AllProducts(
        false,
        27,
        "assets/products/product27.jpeg",
        "assets/ratingStar/rating4.png",
        "Electronic Spices 16 in 1",
        "Electronics",
        "Electronic Spices 16 in 1 25watt Soldering Iron Starter Kit for DIY Craft and Electronic and Industrial Work",
        687),
    AllProducts(
        true,
        22,
        "assets/products/product28.jpeg",
        "assets/ratingStar/rating2.png",
        "Hot Air Gun",
        "Electronics",
        "JUNKYARD Electronics Plastic 1800 Watts Hot Air Gun for Shrink Wrapping Packing, Stripping Paint, Thawing Frozen Water Pipes (Colour May Vary)",
        749),
    AllProducts(
        false,
        13,
        "assets/products/product29.jpeg",
        "assets/ratingStar/rating4.png",
        "Bosch GBL82-270 Air Blower",
        "Electronics",
        "Bosch GBL82-270 Air Blower is a handy tool for blowing and dust extraction. It has the highest airflow. It is s enabled with Variable speed dial wheel for easy flow speed adjustment. 820W motor gives powerful airflow of 4.5m³/min for speedy cleaning.Bosch GBL 82-270 is a ahandy tool for blowing and dust extraction with a Powerful motor (Rated input power: 820 W)",
        4840),
    AllProducts(
        false,
        15,
        "assets/products/product30.jpeg",
        "assets/ratingStar/rating3.png",
        "Quad Store BREADBOARD",
        "Electronics",
        "Quad Store BREADBOARD Circuit Max Projects kit to explore electronics and stem learning with book",
        1980),
    AllProducts(
        false,
        32,
        "assets/products/product31.jpeg",
        "assets/ratingStar/rating5.png",
        "Butterfly EduFields 40",
        "Electronics",
        "Butterfly EduFields 40 in1 Jumbo Electronics & Robotics kit - 100+ Parts Sensor kit stem Projects for 8 Years+ Boys Girls - Easy Plug & Play DIY Robot kit with no Coding - Made in India",
        4599),
    AllProducts(
        false,
        8,
        "assets/products/product32.jpeg",
        "assets/ratingStar/rating5.png",
        "Ramayana",
        "Books",
        "The epic of Ramayana is the story of the great Shri Rama, a god in human form—from his birth and childhood, his marriage to Sita, the daughter of King Janak, to the politics that led to his exile, the war he waged against Raavan who had kidnapped his wife, and finally to his glorious victory and reinstatement as the ruler of Ayodhya. ",
        300),
    AllProducts(
        true,
        9,
        "assets/products/product33.jpeg",
        "assets/ratingStar/rating5.png",
        "Shiv Puran",
        "Books",
        "Shiv Puran is a book based on the various stories of Lord Shiva. Shiv, which means the auspicious one, is a popular Hindu deity and is regarded as one of the primary forms of god in Hinduism.He is one of the three most influential gods in contemporary Hinduism and is considered the supreme god within Shaivism. Shiva in his more benevolent form is depicted as a yogi who lives an ascetic life on mount Kailash. The most iconic attributes of Lord Shiva are the third eye on his forehead, a snake around his neck, the crescent moon adorning, the holy river Ganga flowing from his ",
        400),
    AllProducts(
        false,
        2,
        "assets/products/product34.jpeg",
        "assets/ratingStar/rating5.png",
        "The Bhagavad Gita",
        "Books",
        "The Bhagavad Gita, often referred to as the Gita, is a 700 verse Hindu scripture in English that is part of the Hindu epic Mahabharata. It is made with fine quality material. It is easy to read as the font is very much readable.",
        299),
    AllProducts(
        false,
        14,
        "assets/products/product35.jpeg",
        "assets/ratingStar/rating5.png",
        "Garun Puran",
        "Books",
        "Garun Puran is a matchless scripture of satvik category. it is said that reading or listening to the narration of garud puran not only brings happiness in the present life but also takes one closer to the divinity. therefore, all human beings, particularly Hindus, Buddhists, Jains and sikhs must acquire the deep knowledge enshrined in this scripture. the Garud Puran also aims at establishing a welfare society not only for human beings but also for all creatures and also paves the way for well being of the entire ecology and creation. It says that one must be full of action, compassion and generosity. One Should Live a controlled life while remaining Brahmin-nisht (engrossed in Divinity).",
        170),
    AllProducts(
        false,
        2,
        "assets/products/product36.jpeg",
        "assets/ratingStar/rating5.png",
        "Mahabharat",
        "Books",
        "Few works in classical literature have reached as vast an audience as the Mahabharata. The story of the dynastic struggle between the Pandavas and Kauravas culminating in the great battle in the fields of Kurukshetra is a moral, religious and philosophical tale like no other. In this brilliantly original retelling of Vyasa’s epic, William Buck gives us a Mahabharata of great beauty and insight.",
        404),
    AllProducts(
        false,
        42,
        "assets/products/product37.jpeg",
        "assets/ratingStar/rating3.png",
        "boAt BassHeads 100",
        "EarPhones",
        "The perfect way to add some style and stand out from the crowd with the boAt BassHeads 100 \"Hawk\" inspired earphones. Impedance 16Ω, Sensitivity (dB) 92db ±3db, Frequency Response 20Hz-20KHz",
        299),
    AllProducts(
        false,
        25,
        "assets/products/product38.jpeg",
        "assets/ratingStar/rating1.png",
        "ZEBRONICS Zeb-Bro",
        "EarPhones",
        "The earphone comes with a snug fit providing utmost comfort while wearing them regularly. Connect the 3.5mm jack to the phone and wait for a few seconds for the product to get sync with the phone. Water Resistant : Yes",
        149),
    AllProducts(
        false,
        25,
        "assets/products/product39.jpeg",
        "assets/ratingStar/rating4.png",
        "OnePlus Nord Wired Earphones",
        "EarPhones",
        "Call Control- Answering a call- press once to answer the call; During a call- press once to hang up the call. Frequency response 20 Hz- 20,000 Hz",
        699),
    AllProducts(
        false,
        2,
        "assets/products/product40.jpeg",
        "assets/ratingStar/rating2.png",
        "JBL C50HI",
        "EarPhones",
        "JBL C50HI, Wired in Ear Headphones with Mic, One Button Multi-Function Remote, Lightweight & Comfortable fit (Blue)",
        499),
    AllProducts(
        false,
        25,
        "assets/products/product41.jpeg",
        "assets/ratingStar/rating4.png",
        "PHILIPS Audio TAE1136",
        "EarPhones",
        "RICH BASS CLEAR SOUND: Quality 10mm dome type driver units built with innovative sound-absorbing holes deliver powerful deep bass, making the sound more layered, allowing you to clearly feel Instrument sounds and vocals.",
        229),
    AllProducts(
        false,
        12,
        "assets/products/product42.jpeg",
        "assets/ratingStar/rating2.png",
        "Riviera IPL-02",
        "EarPhones",
        "HIGH QUALIY EARPHONES: The stylish High Quality 100 superior coated wired earphones are a definite fashion statement - wear your attitude with its wide variety of collectionEARPHONES WIRED WITH MIC INSIDE BOX PACKING: Headset with mic Comes Ideal for listening during exercise, walk, commute, travel or everyday use",
        169),
    AllProducts(
        false,
        22,
        "assets/products/product43.jpeg",
        "assets/ratingStar/rating5.png",
        "CP PLUS 2MP Full HD",
        "CCTV",
        "1080p full HD Plug & Play Wi-Fi PT camera, which enables crisp images that reveal the smallest details with absolute clarity. Now, Works with Alexa & Ok Google so you can go hands-free and enjoy the safety of a smart home.36o Degree View offered by this EzyKam, saves cost and trouble of installing multiple cameras in any space to cover the full view of the area. ;Home-on-Phone, View the live video footage of your home/office anytime anywhere in the world on your phone.",
        1756),
    AllProducts(
        false,
        25,
        "assets/products/product44.jpeg",
        "assets/ratingStar/rating3.png",
        "CP PLUS 2MP Full HD",
        "CCTV",
        "360° PAN & TILT VIEW: 1080p full HD Plug & Play Wi-Fi camera 2 MP Full HD Video Camera with 360 degree Coverage helps in the complete surveillance of your house/office to keep a view of any unusual activity..Min. Illumination 0.01 LuxTWO-WAY TALK: Built-in highly microphone & speaker which allows you to easily interact with your family or pets without any echo or background noise.",
        8840),
    AllProducts(
        false,
        27,
        "assets/products/product45.jpeg",
        "assets/ratingStar/rating1.png",
        "TP-Link Tapo 360°",
        "CCTV",
        "TP-Link Tapo 360° 2MP 1080p Full HD Pan/Tilt Home Security Wi-Fi Smart Camera| Alexa Enabled| 2-Way Audio| Night Vision| Motion Detection| Sound and Light Alarm| Indoor CCTV (Tapo C200) White",
        2799),
    AllProducts(
        false,
        29,
        "assets/products/product46.jpeg",
        "assets/ratingStar/rating5.png",
        "MI Xiaomi Wireless Camera 2i 2022",
        "CCTV",
        "The MI 360 Cam does an amazing job, the clarity is good and even in night/dark the results are great, even with a dim light in a dark room it produces a good video quality. Motion detection works well but some time takes little time. The sound output for two way talk is also loud and clear. If they work more on motion tracking (like self moving) aggressively then it would be 5/5 so deducted 1 star for the same.",
        2818),
  ];

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
