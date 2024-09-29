import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class DashboardStatus extends StatelessWidget {
  const DashboardStatus({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              //TODO: MAKE SEE ALL EASILY TAPPABEL
              TextButton(
                  onPressed: () {
                    print('see all tapped');
                  },
                  child: Text(
                    'see all',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: CustomCOlors.primaryColor,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: CustomCOlors.red9b),
                  )),
            ],
          ),
          statusWidget('Linux Photocopier', '812356-78534-55698',
              'Faculty of Science', 'Under Repair'),
          statusWidget('Linux Photocopier', '812356-78534-55698',
              'Faculty of Science', 'Operational'),
          statusWidget('Linux Photocopier', '812356-78534-55698',
              'Faculty of Science', 'Service Needed'),
        ],
      ),
    );
  }

  Widget statusWidget(String machineName, String machineId, String department,
      String maintenanceStatus) {
    final Map<String, Color> statusColors = {
      'Under Repair': CustomCOlors.primaryColor,
      'Operational': CustomCOlors.green19,
      'Service Needed': CustomCOlors.grey55,
    };

    // Function to get color based on status
    Color getStatusColor(String status) {
      return statusColors[status] ?? CustomCOlors.primaryColor;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(machineName,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
              Text(machineId,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.grey77)),
              Text(department,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: CustomCOlors.grey77)),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                width: width * 0.04,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: getStatusColor(maintenanceStatus),
                    width: 1.6,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: getStatusColor(maintenanceStatus),
                ),
              ),
              SizedBox(
                width: 3.0,
              ),
              SizedBox(
                width: width * 0.23,
                child: Text(maintenanceStatus,
                    textAlign: TextAlign.end,
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
