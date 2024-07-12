import 'package:flutter/material.dart';
import 'package:stats/utils/responsive.dart';
// import 'package:flutter/widgets.dart';
import 'package:stats/widgets/dashboard_widget.dart';
import 'package:stats/widgets/side_menu_widget.dart';
import 'package:stats/widgets/summary_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer:Drawer(child: !isDesktop ? const SizedBox(width: 250,child: SideMenuWidget(),):null,) ,
      body: SafeArea(
        child: Row(
          children: [
            if(isDesktop)
              const Expanded(flex: 2,child: SizedBox(child: SideMenuWidget(),)),
            const Expanded(flex: 7,child: DashboardWidget()),
            if(isDesktop)
              const Expanded(flex: 3,child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
