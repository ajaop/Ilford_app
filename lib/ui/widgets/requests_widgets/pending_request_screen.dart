import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/widgets/requests_widgets/request_item.dart';

class PendingRequest extends StatelessWidget {
  const PendingRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
      child: RefreshIndicator(
        color: CustomCOlors.primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView(
          children: const [
            RequestItem(
                requestName: 'General Maintenance',
                machineName: 'Linux Photocopier',
                machineId: '812356-78534-55698',
                departmentName: 'Faculty of Science',
                date: 'Pending'),
            RequestItem(
                requestName: 'Minor Repairs',
                machineName: 'Linux Photocopier',
                machineId: '812356-78534-55698',
                departmentName: 'Faculty of Science',
                date: 'Pending'),
            RequestItem(
                requestName: 'Emergency',
                machineName: 'Linux Photocopier',
                machineId: '812356-78534-55698',
                departmentName: 'Faculty of Science',
                date: 'Pending')
          ],
        ),
      ),
    );
  }
}
