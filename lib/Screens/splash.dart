// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:splash_view/source/presentation/pages/splash_view.dart';
// import 'package:splash_view/source/presentation/presentation.dart';
// import 'package:stats/utils/colors.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 2),() async{
//       try {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         final userId = prefs.getString('userId');
//         final islogin = prefs.getInt('login');

//         if (userId != null) {
//           if (islogin == 0) {
//             Navigator.pushReplacementNamed(context, '/dashboard');
//           } 
//         } else {
//           Navigator.pushReplacementNamed(context, '/auth');
//         }
//       } catch (e) {
//         if (kDebugMode) {
//           print('An error occurred while navigating from SplashScreen: $e');
//         }
//       }
//     });
//     return  SplashView(
//       backgroundColor: AppColor.black,
//       logo: FlutterLogo(),
//       duration: Duration(seconds: 2),
//       bottomLoading: true,
//       done: Done(),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/widgets/app_icon.dart';
import 'package:stats/widgets/linear_indecator_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return SplashView(
      backgroundColor: AppColor.black,
      logo: AppIcon(height: MediaQuery.of(context).size.height*0.12,width: MediaQuery.of(context).size.width*0.3,),
      loadingIndicator: LinearIndecatorWidget(width: MediaQuery.of(context).size.width*0.12,color: AppColor.textdash.withOpacity(0.8),),
    );
  }

  void _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final islogin = prefs.getInt('login');
      if (userId != null) {
        if (islogin == 0) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          Navigator.pushReplacementNamed(context, '/auth');
        }
      } else {
        Navigator.pushReplacementNamed(context, '/auth');
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred while navigating from SplashScreen: $e');
      }
    }
  }
}
