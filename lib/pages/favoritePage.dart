import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './homePage.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  final Map<String, Map<String, String>> productData = const {
    'K87 T-Shirt': {
      'category': 'T-Shirt',
      'price': 'Rp 599.000',
      'image':
          'https://i.pinimg.com/1200x/27/d1/a0/27d1a069410f499dc4c91b2aee7306c0.jpg',
    },
    'Midweight Hoodie': {
      'category': 'Hoodie',
      'price': 'Rp 899.000',
      'image':
          'https://i.pinimg.com/1200x/ee/1a/b4/ee1ab49c70520f6f8d8b00c96cab6bdf.jpg',
    },
    'Detroit Jacket': {
      'category': 'Jacket',
      'price': 'Rp 1.499.000',
      'image':
          'https://i.pinimg.com/736x/62/59/51/625951708719a29228a1ddff35fa507d.jpg',
    },
    'Double Knee Pants': {
      'category': 'Pants',
      'price': 'Rp 1.099.000',
      'image':
          'https://i.pinimg.com/1200x/b0/a4/91/b0a491f7b23b43b243f8e9cbc7c2d88c.jpg',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<Set<String>>(
        valueListenable: favoriteProducts,
        builder: (context, favorites, child) {
          final favoriteList = favorites.toList();

          if (favoriteList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'No favorites yet',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Your favorite products will appear here.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: favoriteList.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 20,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              final name = favoriteList[index];
              final product = productData[name];

              if (product == null) {
                return const SizedBox();
              }

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.network(
                              product['image']!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  final updatedFavorites =
                                      Set<String>.from(
                                    favoriteProducts.value,
                                  );

                                  updatedFavorites.remove(name);

                                  favoriteProducts.value =
                                      updatedFavorites;

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '$name dihapus dari favorite',
                                      ),
                                      duration:
                                          const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product['category']!,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            product['price']!,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFB8860B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}