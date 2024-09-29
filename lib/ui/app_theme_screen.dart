import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class AppThemeScreen extends StatefulWidget {
  const AppThemeScreen({super.key});

  @override
  State<AppThemeScreen> createState() => _AppThemeScreenState();
}

class _AppThemeScreenState extends State<AppThemeScreen> {
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'App Theme',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    print('here');
                    isLight = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Light theme',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.0)),
                      Visibility(
                        visible: isLight == true,
                        child: Icon(
                          Icons.check,
                          size: 20.0,
                          color: CustomCOlors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              InkWell(
                onTap: () {
                  setState(() {
                    isLight = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dark theme',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.0)),
                      Visibility(
                        visible: isLight == false,
                        child: Icon(
                          Icons.check,
                          size: 20.0,
                          color: CustomCOlors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
