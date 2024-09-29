import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/widgets/requests_widgets/completed_request_screen.dart';
import 'package:ilford_app/ui/widgets/requests_widgets/pending_request_screen.dart';
import 'package:ilford_app/ui/widgets/requests_widgets/upcoming_request_screen.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Requests',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  print('this month clicked');
                },
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        color: CustomCOlors.redF1.withOpacity(0.4)),
                    child: Row(
                      children: [
                        const Text(
                          'This month',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/arrow_down.svg',
                        )
                      ],
                    )),
              )
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Pending'),
            ],
            //  indicatorColor: CustomCOlors.primaryColor,
            labelColor: CustomCOlors.primaryColor,
            unselectedLabelColor: CustomCOlors.grey77,
            dividerHeight: 0.0,
            labelStyle: TextStyle(fontSize: 18.0),
            indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 4.0, color: CustomCOlors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              insets: EdgeInsets.symmetric(horizontal: 25.0),
            ),
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                UpcomingRequest(),
                CompletedRequest(),
                PendingRequest(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0, bottom: height * 0.02),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: width * 0.06,
                  backgroundColor: CustomCOlors.primaryColor,
                  child: IconButton(
                      onPressed: () {
                        print('new request pressed');
                      },
                      icon: Icon(
                        Icons.add,
                        size: 32.0,
                        color: CustomCOlors.whiteFF,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
