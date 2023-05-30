import 'package:flutter/material.dart';
import 'package:plantforyou/screens/homes_page.dart';

class Philodendron extends StatefulWidget {
  @override
  _PlantDetailPageState createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<Philodendron> {
  int quantity = 1;
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomesPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomesPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Philodendron Moonlight',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/Philodendron moonlight.png', // Replace with your image path
              width: 350,
              height: 350,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plant Detail',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Price: \$9.99', // Replace with the actual price
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: decrementQuantity,
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: incrementQuantity,
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/drop .png', // Replace with your image path
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 5),
                        Text('Water'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/clear-sky 2.png', // Replace with your image path
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 5),
                        Text('Sunlight'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/temperature (1) 2.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 5),
                        Text('Temperature'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/sprout 2.png', // Replace with your image path
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 5),
                        Text('Growth'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Philodendron Moonlight is a popular cultivar of the Philodendron genus, known for its striking foliage color. Here some information about Philodendron Moonlight.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                      ),
                      onPressed: toggleLike,
                    ),
                    SizedBox(
                        width:
                            10), // Adjust the spacing between the heart icon and the button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add more widgets below if needed
        ],
      ),
    );
  }
}
