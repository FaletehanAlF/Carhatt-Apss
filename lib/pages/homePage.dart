import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // Header
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Text(
          'CARHARTT',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.black,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Greeting
            Text(
              'Discover Your Style',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Built for work. Designed for everyday.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 22),

            // Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xFFFFC72C),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'NEW COLLECTION',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Built for\nEveryday.',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),

                        const SizedBox(height: 15),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: const Text('Shop Now'),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.shopping_bag,
                    size: 75,
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Categories
            Text(
              'Categories',
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 45,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  categoryItem('All'),
                  categoryItem('T-Shirt'),
                  categoryItem('Hoodie'),
                  categoryItem('Jacket'),
                  categoryItem('Pants'),
                  categoryItem('Accessories'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Popular Products',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFB8860B),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Product Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 14,
              mainAxisSpacing: 18,

              childAspectRatio: 0.68,

              children: [
                productItem(
                  'K87 T-Shirt',
                  'Rp 599.000',
                  'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800',
                ),

                productItem(
                  'Midweight Hoodie',
                  'Rp 899.000',
                  'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800',
                ),

                productItem(
                  'Detroit Jacket',
                  'Rp 1.499.000',
                  'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=800',
                ),

                productItem(
                  'Double Knee Pants',
                  'Rp 1.099.000',
                  'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=800',
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Products',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Category
  Widget categoryItem(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 10),

      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      decoration: BoxDecoration(
        color: title == 'All'
            ? const Color(0xFFFFC72C)
            : Colors.white,

        borderRadius: BorderRadius.circular(12),
      ),

      alignment: Alignment.center,

      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Product
  Widget productItem(
    String name,
    String price,
    String image,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),

              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

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
                  price,
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
  }
}