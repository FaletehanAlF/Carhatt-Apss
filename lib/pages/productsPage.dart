import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'T-Shirt',
    'Hoodie',
    'Jacket',
    'Pants',
    'Bag',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products
              .where((product) => product['category'] == selectedCategory)
              .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Products',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),

      // ================= BODY =================
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Text(
              'Find your everyday essentials.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
          ),

          // ================= CATEGORY =================
          SizedBox(
            height: 42,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // ================= JUMLAH PRODUK =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${filteredProducts.length} Products',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ================= PRODUCT GRID =================
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 20,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return ProductItem(
                  product: product,

                  // Klik card produk
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Kamu memilih ${product['name'] ?? 'Produk'}',
                        ),
                      ),
                    );
                  },

                  // Tombol favorite
                  onFavoritePressed: () {
                    setState(() {
                      product['isFavorite'] = !(product['isFavorite'] ?? false);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PRODUCT ITEM
// =====================================================

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onFavoritePressed;
  final VoidCallback? onTap;

  const ProductItem({
    super.key,
    required this.product,
    required this.onFavoritePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = product['isFavorite'] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================= IMAGE =================
        Expanded(
          child: Stack(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: product['image'] != null
                        ? Image.asset(
                            product['image'].toString(),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,

                            errorBuilder: (context, error, stackTrace) {
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
              ),

              // ================= FAVORITE =================
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onFavoritePressed,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 19,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // ================= PRODUCT NAME =================
        Text(
          product['name']?.toString() ?? 'Nama Produk',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 3),

        // ================= CATEGORY =================
        Text(
          product['category']?.toString() ?? 'Category',
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),

        const SizedBox(height: 3),

        // ================= PRICE =================
        Text(
          'Rp ${product['price'] ?? 0}',
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
