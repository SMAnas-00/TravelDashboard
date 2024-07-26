import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/responsive.dart';
import 'package:stats/widgets/dashboard_CC_widget.dart';
// import 'package:flutter/widgets.dart';
import 'package:stats/widgets/dashboard_widget.dart';
import 'package:stats/widgets/side_menu_widget.dart';
import 'package:stats/widgets/summary_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: !Responsive.isDesktop(context) ? AppBar(
          centerTitle: true,
          title: Column(
            children: [
              if (!Responsive.isDesktop(context))
                Text(
                  '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('dd').format(DateTime.now())}',
                  style: const TextStyle(fontSize: 15),
                ),
            ],
          ),
          backgroundColor: AppColor.black,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.auto_graph),
              ),
              Tab(
                icon: Icon(Icons.call),
              )
            ],
          ),
        ):null,
        drawer: Drawer(
          child: !isDesktop
              ? const SizedBox(
                  width: 250,
                  child: SideMenuWidget(),
                )
              : null,
        ),
        body: SafeArea(
          child: Row(
            children: [
              if (isDesktop)
                const Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: SideMenuWidget(),
                    )),
              if (isDesktop)
                const Expanded(flex: 7, child: DashboardWidget()),
              if (Responsive.isMobile(context))
                const Expanded(flex: 7, child: TabBarView(children: [
                  DashboardWidget(),
                  DashboardCCWidget(),

                ])),
              if (isDesktop) const Expanded(flex: 3, child: SummaryWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
