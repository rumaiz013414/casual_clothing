import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikedClothesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Liked'),
      ),
      body: ListView(
        children: [
          _buildClothingItemCard(
            context,
            'Red T-Shirt',
            'assets/images/red.jpeg',
            'Comfortable cotton T-shirt in red color.',
          ),
          _buildClothingItemCard(
            context,
            'Blue Jeans',
            'assets/images/blue.jpeg',
            'Classic blue denim jeans with a slim fit.',
          ),
        ],
      ),
    );
  }

  Widget _buildClothingItemCard(
      BuildContext context, String title, String imageUrl, String description) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
