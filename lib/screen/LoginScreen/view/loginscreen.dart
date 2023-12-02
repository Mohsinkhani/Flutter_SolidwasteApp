// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidwaste/screen/SignUpScreen/view/signupscreen.dart';
import '../controller/lgincontroller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 300,
                  width: 500,
                  color: Colors.greenAccent,
                  child: Center(
                      child: Text(
                    "Login Page",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _loginController.emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _loginController.passcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isloading = true;
                  });
                  try {
                    await _loginController.checkvalidation();
                    setState(() {
                      isloading = false;
                    });
                  } catch (e) {
                    setState(() {
                      isloading = false;
                    });
                  }
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: isloading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                children: [
                  Text(
                    "Have Not Account",
                    style: GoogleFonts.montserrat(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      print("Clicked");
                      Get.to(() => SignUp());
                    },
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.montserrat(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35.0),
            ],
          ),
        );
      }),
    );
  }
}
