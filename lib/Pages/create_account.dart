import 'package:flutter/material.dart';
import 'package:imart_project/Pages/dashboard.dart';
import 'package:imart_project/Pages/login_page.dart';
import 'package:imart_project/Widgets/colors.dart';
import 'package:imart_project/Widgets/custom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();

  bool isLoading = false;
  ValueNotifier<bool> isSignUpSubmit = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Form(
                key: formkey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.71,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black,
                                  )),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: (isLoading)
                                          ? const SizedBox(
                                              height: 16,
                                              width: 16,
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                                strokeWidth: 1.5,
                                              ),
                                            )
                                          : Text(
                                              "Log in",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autofocus: false,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Invalid email address";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        autocorrect: false,
                        autofocus: false,
                        obscureText: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(10.0),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length <= 5) {
                            return "Password must be greater than 5";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // confirm password
                      TextFormField(
                        autocorrect: false,
                        autofocus: false,
                        obscureText: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: confirmpasswordController,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(10.0),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            )),
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Password didn't matched";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //phone number
                      TextFormField(
                        autocorrect: false,
                        autofocus: false,
                        obscureText: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: contactnumberController,
                        decoration: InputDecoration(
                            hintText: 'Contact Number',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(10.0),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone_android_rounded,
                                color: Colors.black,
                              ),
                            )),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'Lobster',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),

                      CustomButtom(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard()));
                            }
                          },
                          buttonColor: AppColors.kPrimaryColor,
                          buttonText: 'Sign Up',
                          context: context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
