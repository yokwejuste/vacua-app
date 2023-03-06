import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../components/classBoxesWidget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final String user = "John Doe";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hey, $user,",
                      style: GoogleFonts.openSans(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF585858),
                      ),
                    ),
                    Text(
                      "How can I help you?",
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/profile");
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.06,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/default.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/class_des.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                opacity: 1.0,
                colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.182,
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: const Color(0xFF585858),
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFE5DC2),
                            Color(0xFFFF14A7),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          weight: 30,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Hall Information",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                          decorationColor: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "School: NAHPI",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "School: NAHPI",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "Building: NAHPI",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "Hall: Hall 3",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Time: 9:30am - 11:30am",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "Class: COME Level 300",
                        style: GoogleFonts.openSans(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Occupied",
                  style: GoogleFonts.openSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF707070),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const ClassBoxWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0265,
                ),
                Text(
                  "Free",
                  style: GoogleFonts.openSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF707070),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const ClassBoxWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
