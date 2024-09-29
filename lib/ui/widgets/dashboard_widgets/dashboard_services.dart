import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class DashboardServices extends StatelessWidget {
  const DashboardServices({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Services',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              serviceWidget(
                  'assets/icons/maintenance.svg', 'General Maintenance'),
              serviceWidget(
                  'assets/icons/emergency_home.svg', 'Emergency Repairs'),
              serviceWidget(
                  'assets/icons/auto_repair.svg', 'Major or Minor Repairs')
            ],
          )
        ],
      ),
    );
  }

  Container serviceWidget(String iconUrl, String serviceName) {
    return Container(
      decoration: const BoxDecoration(
          color: CustomCOlors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: width * 0.05,
            backgroundColor: CustomCOlors.whiteFF,
            child: SvgPicture.asset(
              iconUrl,
              width: 25.0,
              height: 25.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: width * 0.28,
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: CustomCOlors.whiteFF),
            ),
          )
        ],
      ),
    );
  }
}
