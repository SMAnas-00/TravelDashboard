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
        ChangeNotifierProvider(
            create: (_) => BarGraphProvider()..loadGraphData()),
        ChangeNotifierProvider(
            create: (_) => ChartDataProvider()..fetchChartData()),
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
