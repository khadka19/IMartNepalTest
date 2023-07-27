import 'package:flutter/material.dart';
import 'package:imart_project/Pages/dashboard.dart';
import 'package:imart_project/Pages/home_page.dart';
import 'package:imart_project/Widgets/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: AppColors.kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                child: Image.asset(
                  "assets/images/IMartLogo.png",
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
              Text("IMart Nepal Welcomes You"),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 40),
                        backgroundColor: Colors.white),
                    child: const Text(
                      "Get Started ...",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
