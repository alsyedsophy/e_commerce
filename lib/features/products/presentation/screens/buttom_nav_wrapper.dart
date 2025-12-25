import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/features/products/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtomNavWrapper extends StatefulWidget {
  const ButtomNavWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<ButtomNavWrapper> createState() => _ButtomNavWrapperState();
}

class _ButtomNavWrapperState extends State<ButtomNavWrapper> {
  int _currentIndex = 0;
  final taps = [AppRouts.homeScreen, AppRouts.profileScreen];

  void _onTap(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      context.go(taps[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [HomeScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        backgroundColor: AppColors.backGroundColor,
      ),
    );
  }
}
