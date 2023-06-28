import 'dart:io';
import 'package:flexa/UI/Pages/profile_screen.dart';
import 'package:flexa/UI/Pages/search_bar.dart' as sb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../questionnaire.dart';
import '../Splash/splash00.dart';
import 'favourite_food.dart';
import 'final_diet.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> logout(BuildContext context) async {
      // Display alert dialog
      bool confirmLogout = await showDialog(
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            // Show iOS-style alert dialog
            return CupertinoAlertDialog(
              title: Text("Confirm Logout"),
              content: Text("Are you sure you want to log out?"),
              actions: [
                CupertinoDialogAction(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                CupertinoDialogAction(
                  child: Text("Yes"),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          } else {
            // Platform not recognized, return null
            return AlertDialog(
              title: Text("Confirm Logout"),
              content: Text("Are you sure you want to log out?"),
              actions: [
                TextButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          }
        },
      );
      // If user confirmed logout, clear SharedPreferences and navigate to login screen
      if (confirmLogout == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SplashPage()),
          (route) => false,
        );
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(35)),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Color.fromRGBO(0, 173, 181, 1),
                      size: 30,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProfileScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(1.0, 0.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.question_mark_sharp,
                      color: Color.fromRGBO(0, 173, 181, 1),
                      size: 30,
                    ),
                    title: const Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  QuestionnaireApp(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(1.0, 0.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.fastfood_sharp,
                        color: Color.fromRGBO(0, 173, 181, 1),
                        size: 30,
                      ),
                      title: const Text('Today\'s meals ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FinalDiet(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = Offset(1.0, 0.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      }),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.search_outlined,
                      color: Color.fromRGBO(0, 173, 181, 1),
                      size: 30,
                    ),
                    title: Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  sb.SearchBar(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(1.0, 0.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_outline,
                        color: Color.fromRGBO(0, 173, 181, 1), size: 30),
                    title: const Text(
                      'Favourite Food',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FavFood(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(1.0, 0.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Color.fromRGBO(0, 173, 181, 1),
                      size: 30,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () {
                      logout(context);
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.exit_to_app_sharp,
                      color: Color.fromRGBO(0, 173, 181, 1),
                      size: 30,
                    ),
                    title: const Text(
                      'Exit',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      bool confirmExit = await showDialog(
                        context: context,
                        builder: (context) {
                          if (Platform.isIOS) {
                            // Show iOS-style alert dialog
                            return CupertinoAlertDialog(
                              title: Text("Confirm Exit"),
                              content: Text("Are you sure you want to exit?"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("Yes"),
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          } else {
                            // Platform not recognized, show default alert dialog
                            return AlertDialog(
                              title: Text("Confirm Exit"),
                              content: Text("Are you sure you want to exit?"),
                              actions: [
                                TextButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          }
                        },
                      );
                      if (confirmExit == true) {
                        if (Platform.isAndroid || Platform.isIOS) {
                          exit(0);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1)
          ],
        ),
      ),
    );
  }
}
