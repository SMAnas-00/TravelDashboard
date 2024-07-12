import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stats/provider/BarGraph_Provider.dart';
import 'package:stats/provider/LineGraphProvider.dart';
import 'package:stats/provider/SummaryGraphProvider.dart';
import 'package:stats/provider/SummaryProvider.dart';
import 'package:stats/provider/healthProvider.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/notification.dart';
import 'package:stats/utils/responsive.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Provider.of<BarGraphProvider>(context, listen: false).loadGraphData();
    Provider.of<BarGraphProvider>(context, listen: false).loadGraphData2();
    Provider.of<BarGraphProvider>(context, listen: false).loadGraphData3();
    Provider.of<BarGraphProvider>(context, listen: false).loadGraphData4();
    Provider.of<LineGraphProvider>(context, listen: false).loadGraphData();
    Provider.of<SummaryProvider>(context, listen: false).load();
    Provider.of<ChartDataProvider>(context, listen: false).fetchChartData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      try {
        await Provider.of<BarGraphProvider>(context, listen: false)
            .fetchData1()
            .timeout(const Duration(seconds: 10));
        await Provider.of<BarGraphProvider>(context, listen: false)
            .fetchData2()
            .timeout(const Duration(seconds: 10));
        await Provider.of<BarGraphProvider>(context, listen: false)
            .fetchData3()
            .timeout(const Duration(seconds: 10));
        await Provider.of<BarGraphProvider>(context, listen: false)
            .fetchData4()
            .timeout(const Duration(seconds: 10));
        await Provider.of<HealthProvider>(context, listen: false)
            .fetchData()
            .timeout(const Duration(seconds: 10));
        await Provider.of<SummaryProvider>(context, listen: false)
            .fetchSummaryData()
            .timeout(const Duration(seconds: 10));
        await Provider.of<ChartDataProvider>(context, listen: false)
            .fetchChartData()
            .timeout(const Duration(seconds: 10));
        await Provider.of<LineGraphProvider>(context, listen: false)
            .fetchData()
            .timeout(const Duration(seconds: 10));
        MyNotification.success(context, 'Update Successful');
      } catch (e) {
        MyNotification.error(context, 'Unable to Update');
      }
    } else {
      MyNotification.error(context, 'Network Error');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.menu,
                  color: AppColor.icon,
                  size: 25,
                ),
              ),
            ),
          ),
        if (!Responsive.isDesktop(context))
          Text(
              '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('dd').format(DateTime.now())}'),
        if (!Responsive.isMobile(context))
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.cardbg,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 21,
                ),
              ),
            ),
          ),
        if (Responsive.isMobile(context))
          IconButton(
            onPressed: _isLoading ? null : _loadData,
            icon: const Icon(Icons.refresh, color: AppColor.icon, size: 25),
          ),
      ],
    );
  }
}
