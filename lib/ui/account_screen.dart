import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Account',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500),
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomCOlors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 14.0, color: CustomCOlors.whiteFF),
                )),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: CustomCOlors.greyD9,
          ),
          TextButton(
              onPressed: () {
                print('change photo tapped');
              },
              child: const Text(
                'Change Photo',
                style: TextStyle(
                    decorationColor: CustomCOlors.primaryColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: CustomCOlors.red9b),
              )),
          SizedBox(
            height: height * 0.05,
          ),
          accountItem(width, height, 'Full Name', 'Ajao Semiloore'),
          SizedBox(
            height: height * 0.025,
          ),
          accountItem(width, height, 'Phone Number', '08012345678'),
          SizedBox(
            height: height * 0.025,
          ),
          accountItem(width, height, 'Department', 'Faculty of Science'),
          SizedBox(
            height: height * 0.025,
          ),
          accountItem(width, height, 'Email Address', 'test@gmail.com'),
          SizedBox(
            height: height * 0.025,
          ),
          accountItem(width, height, 'Address', 'Lagos, Nigeria'),
          // SizedBox(
          //   height: height * 0.01,
          // ),
          passwordItem(width, height, 'Password', 'Change'),
        ],
      ),
    );
  }

  Column accountItem(
      double width, double height, String fieldName, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(fieldName, style: TextStyle(fontSize: 14.0)),
              SizedBox(
                width: width * 0.25,
              ),
              Expanded(
                child: Text(value,
                    textAlign: TextAlign.end, style: TextStyle(fontSize: 14.0)),
              )
            ],
          ),
        ),
        Divider(
          color: CustomCOlors.greyA3,
        )
      ],
    );
  }

  Column passwordItem(
      double width, double height, String fieldName, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(fieldName, style: TextStyle(fontSize: 14.0)),
              SizedBox(
                width: width * 0.25,
              ),
              Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.bottomRight),
                      onPressed: () {
                        print('change Password tapped');
                      },
                      child: Text(
                        value,
                        style: const TextStyle(
                            decorationColor: CustomCOlors.primaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: CustomCOlors.red9b),
                      )))
            ],
          ),
        ),
        const Divider(
          color: CustomCOlors.greyA3,
        )
      ],
    );
  }
}
