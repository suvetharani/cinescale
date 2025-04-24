import 'package:flutter/material.dart';
import '../data/wishlist.dart';
import '../models/movie.dart';
import '../theme/color_palette.dart';
import 'movie_details_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Movie> wishlist = Wishlist.movies;

    return Scaffold(
      backgroundColor: AppColors.greyDarker,
      appBar: AppBar(
        backgroundColor: AppColors.greyDark,
        title: const Text('Wishlist', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: wishlist.isEmpty
          ? const Center(
              child: Text("No movies in wishlist.",
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // You can make this responsive later
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final movie = wishlist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => MovieDetailsScreen(movie: movie),
                    ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(movie.imagePath, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(movie.title,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
