import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/ui/bottom_navigation_bar/MenuItem.dart';
import 'package:music_app/ui/pages/discover/DiscoverPage.dart';
import 'package:music_app/ui/pages/home/HomePage.dart';
import 'package:music_app/ui/pages/library/LibraryPage.dart';
import 'package:music_app/ui/pages/profile/ProfilePage.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

const sizeIcon = Size(32, 32);

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  final PageController _pageController = PageController();
  final menus = [
    MenuItem(
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
    MenuItem(
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
    MenuItem(
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
    MenuItem(
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
      body: PageView(
        controller: _pageController,
        children: menus.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            if (currentPage == index) return;
            _pageController.jumpToPage(index);
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
