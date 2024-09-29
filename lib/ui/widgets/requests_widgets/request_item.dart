import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class RequestItem extends StatefulWidget {
  final String requestName;
  final String machineName;
  final String machineId;
  final String departmentName;
  final String date;
  const RequestItem(
      {super.key,
      required this.requestName,
      required this.machineName,
      required this.machineId,
      required this.departmentName,
      required this.date});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.requestName,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
              Text(widget.machineName,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.grey77)),
              Text(widget.machineId,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.grey77)),
              Text(widget.departmentName,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.grey77)),
            ],
          ),
          widget.date == 'Pending'
              ? CircularProgressIndicator(
                  value: controller.value,
                  color: CustomCOlors.primaryColor,
                  backgroundColor: CustomCOlors.redF1,
                  semanticsLabel: 'Circular progress indicator',
                )
              : Text(widget.date,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.primaryColor))
        ],
      ),
    );
  }
}
