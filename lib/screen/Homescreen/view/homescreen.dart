import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidwaste/screen/Complaintscreen/view/complaintscreen.dart';
import 'package:solidwaste/screen/LoginScreen/controller/lgincontroller.dart';
import 'package:solidwaste/screen/LoginScreen/view/loginscreen.dart';
import 'package:solidwaste/screen/ReviewScreen/view/reviewscreen.dart';
import '../../LastComplaint/view/lastcomplaint.dart';
import '../controller/homecontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homecontroller = Get.put(HomeController());
  final logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    String url = "images/any.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "Home",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text("Are You Sure!"),
                        content: const Text("Do You want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              logincontroller.signOut();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text("yes"),
                          ),
                        ],
                      ));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200.0,
              color: Colors.green,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      child: Text(
                        "T",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Solid waste home ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Card(
                child: Container(
                  height: 50.0,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewScreen()));
              },
              child: Card(
                child: Container(
                  height: 50.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.reviews_outlined,
                    ),
                    title: Text("complaint History"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text("Are You Sure!"),
                          content: const Text("Do You want to logout?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                logincontroller.signOut();

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: const Text("yes"),
                            ),
                          ],
                        ));
              },
              child: Card(
                child: Container(
                  height: 50.0,
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("logout"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: url != null
                    ? Material(
                        elevation: 5,
                        child: Image.asset(
                          "images/home.webp",
                          filterQuality: FilterQuality.low,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const CircularProgressIndicator.adaptive(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (homecontroller.title != null) {
                        Get.to(() => LastCpmplaint());
                      } else {
                        Get.to(
                            () => ComplaintScreen(
                                  title: 'Solid-Waste',
                                ),
                            arguments: ["title", "Solid-Waste"],
                            transition: Transition.leftToRightWithFade,
                            duration: Duration(seconds: 1));
                      }
                    },
                    child: Column(
                      children: [
                        Material(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("images/solid.png"),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Material(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Solid Waste",
                              style: GoogleFonts.actor(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (homecontroller.title != null) {
                        Get.to(() => LastCpmplaint());
                      } else {
                        Get.to(
                            () => ComplaintScreen(
                                  title: 'Drainage',
                                ),
                            arguments: ["title", "Drainage"],
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 1));
                      }
                    },
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("images/drainage.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Drainage",
                            style: GoogleFonts.actor(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (homecontroller.title != null) {
                        Get.to(() => LastCpmplaint());
                      } else {
                        Get.to(
                            () => ComplaintScreen(
                                  title: 'Dist-bin',
                                ),
                            arguments: ["title", "Dist-bin"],
                            transition: Transition.zoom,
                            duration: const Duration(seconds: 1));
                      }
                    },
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("images/dis.png"),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Dist-bin",
                            style: GoogleFonts.actor(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (homecontroller.title != null) {
                        Get.to(() => LastCpmplaint());
                      } else {
                        Get.to(
                            () => ComplaintScreen(
                                  title: 'Other',
                                ),
                            arguments: ["title", "Other"],
                            transition: Transition.size,
                            duration: Duration(seconds: 1));
                      }
                    },
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/other.png"))),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Other",
                            style: GoogleFonts.actor(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ReviewScreen());
        },
        child: const Icon(
          Icons.reviews,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.black,
        tooltip: 'Review Complaint',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
