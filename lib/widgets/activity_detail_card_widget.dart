import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stats/provider/healthProvider.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/responsive.dart';
import 'package:stats/widgets/custom_card_widget.dart';

class ActivityDetailCard extends StatelessWidget {
  const ActivityDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HealthProvider>(
      builder: (context, healthProvider, child) {
        if (healthProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          itemCount: healthProvider.healthData.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, index) {
            final healthItem = healthProvider.healthData[index];
            return CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    healthItem.icon,
                    width: 30,
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 4),
                    child: Text(
                      healthItem.value,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColor.text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    healthItem.title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColor.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
