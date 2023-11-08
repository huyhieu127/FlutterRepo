import 'package:flutter/widgets.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppDecoration.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/widgets/AppInkWell.dart';

class GetPremium extends StatelessWidget {
  const GetPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.boxDecorationLinearGradient(radius: 24),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            bottom: 1,
            child: Image.asset(
              "$assetImage/person_1.png",
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100.0, left: 25.0, top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enjoy All Benefits!",
                  style: TextStyle(
                    color: AppColor.icon2,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enjoy listening podcast with better audio quality, without restrictions and without ads",
                  style: TextStyle(
                      color: AppColor.icon2, fontSize: 12, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 14),
                AppInkWell(
                  onTap: () {},
                  radius: 20,
                  decoration: AppDecoration.boxDecoration(
                    radius: 20,
                    color: AppColor.button2,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    child: Text(
                      "Get Premium",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
