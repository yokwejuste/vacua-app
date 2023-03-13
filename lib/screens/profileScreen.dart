import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 4.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "NAHPI - COME L200",
                )
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: MediaQuery.of(context).size.width > 600
                  ? const EdgeInsets.only(bottom: 70.0)
                  : const EdgeInsets.only(bottom: 90.0),
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    title: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/editProfile");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.query_stats,
                        color: Colors.grey,
                      ),
                    ),
                    title: const Text(
                      "My stats",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/myStats");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.settings,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/settings");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 1.0,
                    width: 400,
                    child: Container(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.star_purple500_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    title: const Text(
                      "Rate Us",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/rateUs");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.live_help_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    title: const Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/help");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
