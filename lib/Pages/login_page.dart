import 'package:flutter/material.dart';
import 'package:imart_project/Pages/create_account.dart';
import 'package:imart_project/Pages/dashboard.dart';
import 'package:imart_project/Widgets/colors.dart';
import 'package:imart_project/Widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController PasswordCtrl = TextEditingController();

  bool isLoading = false;
  ValueNotifier<bool> isFormSubmit = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formkey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.symmetric(
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
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                )),
                            const Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.017,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 5,
                                  ),
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
                                                  const CreateAccount()));
                                    },
                                    child: (isLoading)
                                        ? const SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              color: Colors.blue,
                                              strokeWidth: 1.5,
                                            ),
                                          )
                                        : const Text(
                                            "Create Account",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autofocus: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: emailCtrl,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          obscureText: false,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          controller: PasswordCtrl,
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
                      ),
                      const Row(
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
                      const SizedBox(
                        height: 1,
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
                          buttonText: 'Login',
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
