import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class DashboardTop extends StatelessWidget {
  const DashboardTop({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: CustomCOlors.primaryColor,
          width: double.infinity,
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 15.0, bottom: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.65,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                decoration: const BoxDecoration(
                    color: CustomCOlors.whiteF7,
                    borderRadius: BorderRadius.all(Radius.circular(26.0))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location_home.svg',
                      width: 20.0,
                      height: 20.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Expanded(
                      child: Text(
                        'No 33 Adewale estate, Festac, Lagos Nigeria',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 13.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.notifications_outlined,
                size: 25.0,
                color: CustomCOlors.whiteF7,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                EdgeInsets.only(top: height * 0.11, left: 30.0, right: 30.0),
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              decoration: BoxDecoration(
                color: CustomCOlors.whiteFE,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                    color: CustomCOlors.boxShadowColor.withAlpha(30),
                    blurRadius: 10.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: width * 0.05,
                        backgroundColor: CustomCOlors.primaryColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      const Text('Hi Ajao,',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w400))
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('How can we be of help today?',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
