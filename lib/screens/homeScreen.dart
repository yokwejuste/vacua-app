import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacua_app/main.dart';
import 'package:vacua_app/screens/profileScreen.dart';
import '../components/classBoxesWidget.dart';
import 'SettingsPage.dart';
// App localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  MainHomePageState createState() => MainHomePageState();
}

class MainHomePageState extends ConsumerState<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    String user = ref.read(userProvider)!.fullName;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
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
                      "Hey, ${user.substring(0, 5)}!",
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF585858),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppLocalizations.of(context)!.how_can_i_help_you,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    position: RelativeRect.fromLTRB(
                      MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.1,
                      MediaQuery.of(context).size.width * 0.1,
                      MediaQuery.of(context).size.height * 0.1,
                    ),
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text(AppLocalizations.of(context)!.profile),
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: Text(AppLocalizations.of(context)!.settings),
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ),
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: Text(AppLocalizations.of(context)!.logout),
                        onTap: () {
                          // Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  );
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
                      const Text(
                        "Hall Information",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                          decorationColor: Color(0xFFFFFFFF),
                        ),
                      ),
                      const Text(
                        "School: NAHPI",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const Text(
                        "School: NAHPI",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const Text(
                        "Building: NAHPI",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const Text(
                        "Hall: Hall 3",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                        "Time: 9:30am - 11:30am",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const Text(
                        "Class: COME Level 300",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
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
                  AppLocalizations.of(context)!.occupied,
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
                  AppLocalizations.of(context)!.free,
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
