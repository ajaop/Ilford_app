import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/widgets/dashboard_widgets/dashboard_services.dart';
import 'package:ilford_app/ui/widgets/dashboard_widgets/dashboard_status.dart';
import 'package:ilford_app/ui/widgets/dashboard_widgets/dashboard_top.dart';
import 'package:ilford_app/ui/widgets/ilford_app_bar.dart';

class DashbardScreen extends StatefulWidget {
  const DashbardScreen({super.key});

  @override
  State<DashbardScreen> createState() => _DashbardScreenState();
}

class _DashbardScreenState extends State<DashbardScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: ADxD SHIMMER LOADING SCREEN
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const IlfordAppBar(title: 'ILFORD'),
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
              color: CustomCOlors.primaryColor,
              backgroundColor: Colors.white,
              onRefresh: () async {
                return Future<void>.delayed(const Duration(seconds: 3));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DashboardTop(
                      width: width,
                      height: height,
                    ),
                  ),
                  SliverToBoxAdapter(child: DashboardServices(width: width)),
                  SliverToBoxAdapter(child: DashboardStatus(width: width))
                ],
              ),
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
                        print('chat pressed');
                      },
                      icon: Icon(
                        Icons.chat_outlined,
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
