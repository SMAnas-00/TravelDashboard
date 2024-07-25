import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stats/Screens/auth.dart';
import 'package:stats/Screens/dashboard.dart';
import 'package:stats/Screens/splash.dart';
import 'package:stats/provider/BarGraph_Provider.dart';
import 'package:stats/provider/LineGraphProvider.dart';
import 'package:stats/provider/SummaryGraphProvider.dart';
import 'package:stats/provider/SummaryProvider.dart';
import 'package:stats/provider/healthProvider.dart';
import 'package:stats/provider/lineGraphRevenueProvider.dart';
import 'package:stats/provider/login_auth_provider.dart';
import 'package:stats/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HealthProvider()),
        ChangeNotifierProvider(create: (context) => SummaryProvider()),
        ChangeNotifierProvider(create: (context) => LineGraphProvider()),
        ChangeNotifierProvider(create: (_) => BarGraphProvider()..loadGraphData(0, 'apiResponse')..loadGraphData(1, 'apiResponse2')..loadGraphData(2, 'apiResponse3')..loadGraphData(3, 'apiResponse4')..loadGraphData(4, 'apiResponse5')..loadGraphData(5, 'apiResponse6')..loadGraphData(6, 'apiResponse7')..loadGraphData(7, 'apiResponse8')),
        ChangeNotifierProvider(create: (_) => ChartDataProvider()..fetchChartData()),
        ChangeNotifierProvider(create: (context) => LineGraphRevenueProvider()),
      ],
      child: MaterialApp(
        
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.black,
            brightness: Brightness.dark),
        title: 'Stats',
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/auth': (context) => const AuthScreen(),
          '/dashboard': (context) => const DashboardScreen()
        },
      ),
    );
  }
}
