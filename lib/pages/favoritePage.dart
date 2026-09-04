import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data/products.dart';
import './homePage.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
          final favoriteProductsList = products.where((product) {
            final name = product['name']?.toString() ?? '';
            return favorites.contains(name);
          }).toList();

          if (favoriteProductsList.isEmpty) {
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
            itemCount: favoriteProductsList.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 20,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              final product = favoriteProductsList[index];

              final String name =
                  product['name']?.toString() ?? 'Nama Produk';

              final String category =
                  product['category']?.toString() ?? 'Category';

              final String price =
                  product['price']?.toString() ?? '0';

              final String? image =
                  product['image']?.toString();

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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(16),
                              child: image != null
                                  ? Image.asset(
                                      image,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return const Center(
                                          child: Icon(
                                            Icons.image_outlined,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
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

                                  Fluttertoast.showToast(
                                    msg:
                                        '$name dihapus dari favorite',
                                    toastLength:
                                        Toast.LENGTH_SHORT,
                                    gravity:
                                        ToastGravity.BOTTOM,
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
                            overflow:
                                TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color:
                                  Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Rp $price',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  const Color(0xFFB8860B),
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