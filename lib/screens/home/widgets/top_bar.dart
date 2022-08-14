import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../utils/hive_const.dart';
import '../../settings/settings_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final box = Hive.box(DatabaseBoxConstant.storage);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              timeselect(),
              Column(
                children: [
                  Text(
                    greeting(),
                    style: TextStyle(color: colorForTimer(), fontSize: 17),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    Get.to(() => SettingsScreen());
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            box.get(DatabaseFieldConstant.userName),
            style: GoogleFonts.amarante(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ]);
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 15) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  Color? colorForTimer() {
    var hour = DateTime.now().hour;
    if (hour < 15) {
      return const Color(0xffdfbbdd);
    }
    if (hour < 17) {
      return Colors.grey[700];
    }
    return Colors.grey[700];
  }

  Widget timeselect() {
    var hour = DateTime.now().hour;
    if (hour < 15) {
      return Image.asset(
        "assets/images/sun.png",
        color: const Color(0xffdfbbdd),
        scale: 15,
      );
    }
    if (hour < 17) {
      return Image.asset(
        "assets/images/moon.jpg",
        color: Colors.grey[700],
        scale: 7,
      );
    }
    return Image.asset(
      "assets/images/moon.jpg",
      color: Colors.grey[700],
      scale: 7,
    );
  }
}
