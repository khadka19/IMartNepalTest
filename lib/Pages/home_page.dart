import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:imart_project/Pages/login_page.dart';
import 'package:imart_project/Pages/products_details.dart';
import 'package:imart_project/Widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  List<String> imgList = [
    ("assets/images/handCraft.jpg"),
    ("assets/images/handCraft2.jpeg"),
    ("assets/images/handCraft.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          customAppBar(),
          SizedBox(
            height: 10,
          ),
          caraousalImage(),
          SizedBox(
            height: 10,
          ),
          productDetailsBar(),
          SizedBox(
            height: 10,
          ),
          productsGrid(context),
          SizedBox(
            height: 10,
          ),
          contents()
        ],
      ),
    ));
  }

  Widget customAppBar() {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Gov.Reg No. 108970",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Image.asset(
                      "assets/images/IMartLogo.png",
                      height: 20,
                      width: 60,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
                const Column(
                  children: [
                    Text("+977-1-4331647"),
                    SizedBox(
                      height: 3,
                    ),
                    Text("+977-1-4331647"),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "info@gmail.com",
                      style: TextStyle(color: Colors.white60),
                    )
                  ],
                )
              ],
            ),
            searchBar(context)
          ],
        ),
      ),
    );
  }

  Widget searchBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(29.5),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(Icons.person))
      ],
    );
  }

  Widget caraousalImage() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            print(index);
            return Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text("20 % OFF",
                        style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
              )
            ]);
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ));
  }
}

Widget productDetailsBar() {
  return Container(
    height: 50,
    color: AppColors.kPrimaryColor,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Products",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AllProducts()));
            },
            child: Text(
              "SEE ALL",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          )
        ],
      ),
    ),
  );
}

Widget contents() {
  return Container(
    color: Color.fromARGB(255, 57, 75, 58),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "A Nepali Online Marketplace for Eco-friendly Handmade Crafts",
            style: TextStyle(fontSize: 16),
          ),
          Text("We deliver Nepali handmade products at your doorstep!"),
          Text(
              "Entice your handmade décor experience with authentic Nepali handmade crafts on iMartNepal. We offer Nepali handmade dexterity such as figurines, antiques, statues, wooden crafts, paintings, native Eco-friendly gifts, vintage jewelry and many more. Nepalese art forms are practiced over centuries, produced in a traditional way, from generation to generations. With a touch of modern lighting and perspective, these craftsman exhibits extreme level skills for world-renowned exquisite beauty and art. We have both major division Crafts - Traditional such as metal statues, ethnic costumes, wood carving, religious and ritual objects, silver jewelry, paintings, knitwear, handmade papers and ceramics etc. And, Contemporary products like modern jewelry made of beads, bones and horn, buttons, furnishing materials, modern painting, pashmina, bags, toys like dolls and puppets etc.")
        ],
      ),
    ),
  );
}

Widget productsGrid(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.3,
    child: Card(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          padding: const EdgeInsets.all(1.0),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsDetails()));
                },
                child: Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: GridTile(
                        footer: Container(
                          height: 20,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductsDetails()));
                            },
                            child: const GridTileBar(
                              backgroundColor: AppColors.kPrimaryColor,
                              title: Text(
                                "Hello",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/handCraft.jpg",
                          width: MediaQuery.of(context).size.width * 0.4,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add To Cart",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Entypo.shopping_cart,
                                color: AppColors.kPrimaryColor,
                                size: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            );
          }),
    ),
  );
}
