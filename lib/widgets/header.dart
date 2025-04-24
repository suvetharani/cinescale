import 'package:flutter/material.dart';
import '../theme/color_palette.dart';
import '../screens/wishlist_screen.dart';
import '../screens/auth_screen.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const CustomHeader({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: AppColors.greyDarker,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menu + Logo
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.light),
                    onPressed: onMenuPressed,
                  ),
                  const SizedBox(width: 10),
                  Text("CineScale", style: TextStyle(color: AppColors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),

              if (!isMobile)
                // Search bar for larger screens
                SizedBox(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: AppColors.light),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.greyDark,
                      hintText: "Search...",
                      hintStyle: TextStyle(color: AppColors.light.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),

              // Right buttons
              Row(
                children: [
                  if (!isMobile)
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WishlistScreen()),
                        );
                      },
                      child: Text("Wishlist", style: TextStyle(color: AppColors.light)),
                    ),

                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.orange),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AuthScreen()),
                        );
                    },
                    child: const Text("Sign In", style: TextStyle(color: AppColors.light)),
                  ),
                  const SizedBox(width: 8),
                ],
              )
            ],
          ),

          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  style: TextStyle(color: AppColors.light),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greyDark,
                    hintText: "Search...",
                    hintStyle: TextStyle(color: AppColors.light.withOpacity(0.6)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
