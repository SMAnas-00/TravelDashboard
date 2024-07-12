import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/data/side_menu_data.dart';
import 'package:stats/utils/colors.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.9,
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: ListView.builder(
            itemCount: data.menu.length,
            itemBuilder: (context, index) => buildMenuEntry(data, index),
          ),
        ),
        const Text('A product of SES',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: AppColor.textdash),),
      ],
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: isSelected ? AppColor.selectiondash : Colors.transparent,
      ),
      child: InkWell(
        onTap: () { setState(() async{
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          selectedIndex = index;
          if (selectedIndex == 2) {
            prefs.setInt('login', 1);
           Navigator.pushReplacementNamed(context, '/auth');
          }
        });},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? AppColor.black : AppColor.icon,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColor.black : AppColor.textdash,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
