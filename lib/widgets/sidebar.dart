import 'package:flutter/material.dart';
import '../theme/color_palette.dart';
import '../screens/movies_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/contact_us_screen.dart';

class SideDrawer extends StatelessWidget {
  final VoidCallback onClose;
  final double screenWidth;

  const SideDrawer({super.key, required this.onClose, required this.screenWidth});

  Widget buildSection(String title, List<String> items) {
    return ExpansionTile(
      collapsedTextColor: AppColors.light,
      textColor: const Color.fromARGB(255, 0, 0, 0),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: items.map((item) => ListTile(
        title: Text(item, style: TextStyle(color: AppColors.light)),
        onTap: () {},
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth < 600 ? screenWidth : 280,
      height: double.infinity,
      color: AppColors.greyDark,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Color.fromARGB(255, 228, 101, 32)),
                onPressed: onClose,
              ),
            ),
            ListTile(
              title: Text("Movies", style: TextStyle(color: AppColors.light, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MoviesScreen()),
                );
                onClose(); // Closes the sidebar
              },
            ),

            ListTile(
              title: Text("wishlist", style: TextStyle(color: AppColors.light, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
                onClose();// Navigate or perform action here
              },
            ),
            ListTile(
              title: Text("contact us", style: TextStyle(color: AppColors.light, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );
                onClose();// Navigate or perform action here
              },
            ),
            buildSection("Languages", ["English", "Tamil", "Hindi"]),
          ],
        ),
      ),
    );
  }
}
