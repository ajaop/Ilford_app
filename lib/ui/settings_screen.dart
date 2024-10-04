import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/account_screen.dart';
import 'package:ilford_app/ui/app_theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500),
              ),
            )),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 25.0, horizontal: 27.0),
            children: [
              Text('General',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
              generalWidgets(context),
              SizedBox(
                height: 25.0,
              ),
              Text('Preferences',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
              preferencesWidgets(context),
              SizedBox(
                height: 25.0,
              ),
              Text('Help & Support',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
              helpWidgets(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomCOlors.redF1,
                    minimumSize: Size(width * 0.68, height * 0.055),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 14.0, color: CustomCOlors.red7C),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Column helpWidgets() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FAQ',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Privacy Policy',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('About Us',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              )
            ],
          ),
        )
      ],
    );
  }

  Column preferencesWidgets(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AppThemeScreen()));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('App theme',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column generalWidgets(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AccountScreen()));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Account',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                )
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('Language',
        //           style:
        //               TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
        //       Icon(
        //         Icons.arrow_forward_ios,
        //         size: 15.0,
        //       )
        //     ],
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.0)),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              )
            ],
          ),
        )
      ],
    );
  }
}
