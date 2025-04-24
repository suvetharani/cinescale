import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/sidebar.dart';
import '../theme/color_palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.greyDarker,
      body: Stack(
        children: [
          Column(
            children: [
              CustomHeader(onMenuPressed: toggleDrawer),
              const Expanded(
                child: Center(
                  child: Text("Home Content Here", style: TextStyle(color: AppColors.light)),
                ),
              ),
            ],
          ),

          // Sidebar with animation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isDrawerOpen ? 0 : -screenWidth,
            top: 0,
            bottom: 0,
            child: SideDrawer(
              screenWidth: screenWidth,
              onClose: toggleDrawer,
            ),
          ),
        ],
      ),
    );
  }
}
