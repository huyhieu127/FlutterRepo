import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/pages/discover/DiscoverPage.dart';
import 'package:music_app/pages/home/HomePage.dart';
import 'package:music_app/pages/library/LibraryPage.dart';
import 'package:music_app/pages/menu/MenuForm.dart';
import 'package:music_app/pages/profile/ProfilePage.dart';

import '../../helper/AppColor.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

const sizeIcon = Size(32, 32);

class _MenuPageState extends State<MenuPage> {
  final menus = [
    MenuForm(
      page: const HomePage(),
      label: "Home",
      icon: SvgPicture.asset(
        "$assetIcon/ic_home.svg",
        colorFilter: const ColorFilter.mode(AppColor.icon3, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
      selectedIcon: SvgPicture.asset(
        "$assetIcon/ic_home_filled.svg",
        colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
    ),
    MenuForm(
      page: const DiscoverPage(),
      label: "Discover",
      icon: SvgPicture.asset(
        "$assetIcon/ic_discover.svg",
        colorFilter: const ColorFilter.mode(AppColor.icon3, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
      selectedIcon: SvgPicture.asset(
        "$assetIcon/ic_discover_filled.svg",
        colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
    ),
    MenuForm(
      page: const LibraryPage(),
      label: "Library",
      icon: SvgPicture.asset(
        "$assetIcon/ic_library.svg",
        colorFilter: const ColorFilter.mode(AppColor.icon3, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
      selectedIcon: SvgPicture.asset(
        "$assetIcon/ic_library_filled.svg",
        colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
    ),
    MenuForm(
      page: const ProfilePage(),
      label: "Profile",
      icon: SvgPicture.asset(
        "$assetIcon/ic_profile.svg",
        colorFilter: const ColorFilter.mode(AppColor.icon3, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
      selectedIcon: SvgPicture.asset(
        "$assetIcon/ic_profile_filled.svg",
        colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
        width: sizeIcon.width,
        height: sizeIcon.height,
      ),
    ),
  ];

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menus[currentPage].page,
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.bg2,
          showUnselectedLabels: true,
          elevation: 0,
          //Selected
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          selectedItemColor: AppColor.primary,
          //Unselected
          unselectedFontSize: 12,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          unselectedItemColor: AppColor.text3,
          items: [
            BottomNavigationBarItem(
              icon: menus[0].icon,
              activeIcon: menus[0].selectedIcon,
              label: menus[0].label,
            ),
            BottomNavigationBarItem(
              icon: menus[1].icon,
              activeIcon: menus[1].selectedIcon,
              label: menus[1].label,
            ),
            BottomNavigationBarItem(
              icon: menus[2].icon,
              activeIcon: menus[2].selectedIcon,
              label: menus[2].label,
            ),
            BottomNavigationBarItem(
              icon: menus[3].icon,
              activeIcon: menus[3].selectedIcon,
              label: menus[3].label,
            ),
          ],
        ),
      ),
    );
  }
}
