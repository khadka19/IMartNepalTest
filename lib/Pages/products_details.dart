import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imart_project/Pages/dashboard.dart';
import 'package:imart_project/Pages/login_page.dart';
import 'package:imart_project/Widgets/colors.dart';
import 'package:imart_project/Widgets/custom_button.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({Key? key}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  String _selectedItem = 'Piece';

  List<String> _dropDownItem = ['Piece', 'Dozen', "Packet"];
  bool reviewSubmit = true;
  double rating = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();

  String review = '';
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stackPart(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Quantity ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      dropDownButton()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  minusPlus(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  addtoCartPlaceOrder(),
                  reviewsListView(),
                  submitReview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stackPart() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/images/handCraft.jpg",
          height: MediaQuery.of(context).size.height * 0.32,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          left: 10,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.chevron_left,
                color: AppColors.kPrimaryColor,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.27,
          left: 10,
          right: 10,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HandCraft',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: AppColors.kPrimaryColor,
                    ),
                    label: const Text(
                      '(5.0) . 45 Reviews',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Rs. 300   ",
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Text(
                            "Rs. 500",
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        'A handicraft, sometimes more precisely expressed as artisanal handicraft or handmade, is any of a wide variety of types of work where useful and decorative objects are made completely by one’s hand or by using only simple, non-automated related tools like scissors, carving implements, or hooks.',
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFF6B7280)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'SEE MORE',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF6B7280),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // debugPrint('working');
                                //Navigator.pushNamed(context, '/addnewaddress');
                              }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dropDownButton() {
    return DropdownButton(
      hint: Text('Select an item'),
      value: _selectedItem,
      onChanged: (newValue1) {
        setState(() {
          _selectedItem = newValue1!;
        });
      },
      items: _dropDownItem.map((item1) {
        return DropdownMenuItem(
          value: item1,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              item1,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget minusPlus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              if (_counter > 1) {
                setState(() {
                  _counter--;
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                border: Border.all(color: const Color(0xFFD1D5DB)),
              ),
              height: 36.0,
              child: const Icon(
                Entypo.minus,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD1D5DB),
              ),
            ),
            height: 36.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_counter ' '$_selectedItem',
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _counter++;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD1D5DB)),
              ),
              height: 36.0,
              child: const Icon(
                Entypo.plus,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addtoCartPlaceOrder() {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBarSuccess.customsnackbarSuccess(
                  message: "Added To Cart!!!"),
            );
          },
          child: Container(
            width: size.width * 0.45,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "ADD TO CART",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      //color: AppColors.darkGray,
                      height: 0,
                      // height: 0.5,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Success',
                  )),
            );
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashBoard()));
            showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/tick.png",
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            backgroundColor: Color(0xFFF64bc44),
                            title: const Text('SUCCESS'),
                            content: const Text(
                              'Your Order has been successfully registered...',
                              textDirection: TextDirection.ltr,
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text(
                                  'CONTINUE',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ]),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            width: size.width * 0.45,
            decoration: BoxDecoration(
              color: AppColors.kSecondaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "PLACE ORDER",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      //color: AppColors.darkGray,
                      height: 0,
                      // height: 0.5,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget reviewsListView() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'SEE ALL (45)',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ),
            ],
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              //itemCount: ,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/handCraft.jpg"),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hari Khadka',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.kPrimaryColor,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.kPrimaryColor,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.kPrimaryColor,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.kPrimaryColor,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.kPrimaryColor,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '32 mins ago',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'The app is easy to use, works perfectly. I highly recommend it.',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14.0,
                            ),
                          ),
                          Divider(
                            height: 35.0,
                            color: Color(0xFFD1D5DB),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  Widget submitReview() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: reviewSubmit
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate this Item: $rating',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLength: 1000,
                    controller: _reviewController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.kPrimaryColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.mainBlackColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: "Write anything... (Optional)",
                    ),
                    maxLines: 3,
                    validator: (val) =>
                        val!.isEmpty ? 'Enter E-mail Address' : null,
                    onChanged: (val) {
                      setState(() => review = val);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RatingBar.builder(
                    updateOnDrag: true,
                    minRating: 1,
                    itemSize: 30.0,
                    itemPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.kPrimaryColor,
                        ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButtom(
                  context: context,
                  buttonColor: AppColors.kPrimaryColor,
                  buttonText: "SUBMIT REVIEW",
                  onPressed: () {},
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Review',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          reviewSubmit = true;
                        });
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.kPrimaryColor,
                        size: 20,
                      ),
                      label: Text(
                        'Edit',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RatingBar.builder(
                    updateOnDrag: true,
                    minRating: 1,
                    itemSize: 30.0,
                    itemPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.kPrimaryColor,
                        ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Submitted On: ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: AppColors.mainBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
    );
  }
}

class customSnackBarSuccess {
  static SnackBar customsnackbarSuccess({required message}) {
    return SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Container(
          decoration: BoxDecoration(
              color: AppColors.kSecondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      message,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.transparent,
    );
  }
}
