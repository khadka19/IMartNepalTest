import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:imart_project/Widgets/colors.dart';
import 'package:imart_project/Widgets/custom_button.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int _counter = 1;
  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
                  child: customAppBar(),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      items(
                        'assets/images/handCraft.jpg',
                        'Hand Craft',
                        '250',
                        '400',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      items(
                        'assets/images/IMartLogo.png',
                        'Logo',
                        '400',
                        '1600',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      items(
                        'assets/images/handCraft2.jpeg',
                        'Hand Craft 2',
                        '300',
                        '900',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                children: [
                  promoCode(),
                  SizedBox(
                    height: 20,
                  ),
                  card(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 25,
        ),
        Text(
          "Cart History",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  Widget items(
    String image,
    String name,
    String itemPrice,
    String total,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text("Item Price"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        itemPrice,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text("Total"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        total,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Quantity"),
                  SizedBox(
                    width: 20,
                  ),
                  plusminusChecker(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget plusminusChecker() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  decrementCounter();
                },
                child: Icon(
                  AntDesign.minus,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              VerticalDivider(
                thickness: 3,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$_counter",
              ),
              SizedBox(
                width: 10,
              ),
              VerticalDivider(
                thickness: 3,
                color: Colors.green,
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  incrementCounter();
                },
                child: Icon(
                  AntDesign.plus,
                  color: AppColors.kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCode() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      height: 50,
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                height: 50,
                width: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Promo Code",
                  ),
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget card() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            items1("1500", "50", "100"),
            SizedBox(
              height: 20,
            ),
            item2("1450"),
            SizedBox(
              height: 10,
            ),
            CustomButtom(
              context: context,
              buttonColor: AppColors.kPrimaryColor,
              buttonText: "PLACE ORDER",
              onPressed: () {
                // Navigator.push(context,
                //     (MaterialPageRoute(builder: (context) => PlaceOrder())));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget items1(
    String subTotal,
    String shippingCharge,
    String promoDiscount,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("SubTotal"), Text("NPR " + subTotal + ".00")],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Charge"),
            Text("NPR " + shippingCharge + ".00")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Promotional Discount"),
            Text("NPR " + promoDiscount + ".00")
          ],
        ),
      ],
    );
  }

  Widget item2(String total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text("NPR " + total + ".00",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
      ],
    );
  }
}
