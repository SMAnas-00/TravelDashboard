import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/responsive.dart';

class MyNotification {
  
  static success(BuildContext context,String text) 
  {
    final isDesktop = Responsive.isDesktop(context);
    var width = MediaQuery.of(context).size.width;
    return ElegantNotification.success(title: const Text('Success',style: TextStyle(fontSize: 12,color: AppColor.textdash),),description: Text(text),background: AppColor.cardbg,width: isDesktop ? width*0.3:null,).show(context);
  }

  static error(BuildContext context,String text) 
  {
    final isDesktop = Responsive.isDesktop(context);
    var width = MediaQuery.of(context).size.width;
    return ElegantNotification.error(title: const Text('Error',style: TextStyle(fontSize: 12,color: AppColor.textdash,),),description: Text(text),background: AppColor.cardbg,width: isDesktop ? width*0.3:null,).show(context);
  }

  static info(BuildContext context,String text) 
  {
    final isDesktop = Responsive.isDesktop(context);
    var width = MediaQuery.of(context).size.width;
    return ElegantNotification.info(title: const Text('Alert',style: TextStyle(fontSize: 12,color: AppColor.textdash),),description: Text(text),background: AppColor.cardbg,width: isDesktop ? width*0.3:null,).show(context);
  }
}