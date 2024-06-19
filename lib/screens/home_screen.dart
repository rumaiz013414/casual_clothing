import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/product_detail.dart';
import '../model/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      imageUrl: 'assets/images/blue.jpeg',
      title: 'Blue Jeans',
      price: 'LKR3900.00',
    ),
    Product(
      imageUrl: 'assets/images/red.jpeg',
      title: 'Red T-shirt',
      price: 'LKR2500.00',
    ),
    Product(
      imageUrl: 'assets/images/cotton.jpeg',
      title: 'Cotton pant',
      price: 'LKR1500.00',
    ),
    Product(
      imageUrl: 'assets/images/short.jpeg',
      title: 'Cotton short',
      price: 'LKR4500.00',
    ),
  ];

  int selectedIndex = -1;
  int _selectedBottomIndex = 0;
  bool _hovering = false;

  List<Color> iconColors = [
    Colors.black,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
      iconColors = List<Color>.generate(
          4, (i) => i == index ? Colors.black : Colors.grey);
    });
    switch (index) {
      case 0:
        // current screen
        break;
      case 1:
        // Navigate to Liked screen
        Navigator.pushNamed(context, '/liked');
        break;
      case 2:
        // Navigate to Cart screen
        Navigator.pushNamed(context, '/cart');
        break;
      case 3:
        // Navigate to Profile screen
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/advertisement_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSelectionField(context, 'T-shirts', 0),
                      _buildSelectionField(context, 'Trousers', 1),
                      _buildSelectionField(context, 'Shorts', 2),
                      _buildSelectionField(context, 'Jeans', 3),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _buildProductItem(context, products[index]);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 25,
            right: 25,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: Colors.grey),
                    onPressed: () {
                      // Handle bell icon press
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _hovering ? 100 : 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Transform.translate(
          offset: Offset(0, _hovering ? -5 : 0),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: iconColors[0]),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, color: iconColors[1]),
                label: 'Liked',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: iconColors[2]),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: iconColors[3]),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedBottomIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: _onBottomNavItemTapped,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionField(BuildContext context, String title, int index) {
    final bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[400] : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          title,
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: isSelected ? Colors.white : Color(0xFF121212),
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(product.imageUrl),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.title,
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xB2000000),
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.price,
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF121212),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
