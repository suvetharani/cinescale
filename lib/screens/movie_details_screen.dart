import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../theme/color_palette.dart';
import '../data/wishlist.dart'; // 🔥 import the wishlist

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWishlisted = Wishlist.isInWishlist(movie);

    return Scaffold(
      backgroundColor: AppColors.greyDarker,
      appBar: AppBar(
        backgroundColor: AppColors.greyDark,
        title: Text(movie.title, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(movie.imagePath, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 20),

            Text(movie.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),

            const SizedBox(height: 8),

            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _infoChip("Rating", "${movie.rating} ⭐"),
                if (movie.rated != null) _infoChip("Rated", movie.rated!),
                if (movie.runtime != null) _infoChip("Runtime", movie.runtime!),
                if (movie.country != null) _infoChip("Country", movie.country!),
              ],
            ),

            const SizedBox(height: 20),

            Text("Story",
                style: const TextStyle(fontSize: 16, color: AppColors.orange, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              movie.description ?? "No description available.",
              style: const TextStyle(fontSize: 14, color: Colors.white70, height: 1.4),
            ),

            const SizedBox(height: 24),

            // Add to Wishlist Button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isWishlisted ? Colors.grey : AppColors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (!isWishlisted) {
                    Wishlist.add(movie);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${movie.title} added to wishlist!'),
                        backgroundColor: AppColors.orange,
                      ),
                    );
                  }
                },
                icon: Icon(
                  isWishlisted ? Icons.check : Icons.favorite_border,
                  color: Colors.black,
                ),
                label: Text(
                  isWishlisted ? "In Wishlist" : "Add to Wishlist",
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(String label, String value) {
    return Chip(
      backgroundColor: AppColors.greyDark,
      label: Text("$label: $value", style: const TextStyle(color: Colors.white)),
    );
  }
}
