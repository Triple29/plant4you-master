import 'package:flutter/material.dart';

class AllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(16.0),
      children: [
        Container(
          width: 500,
          height: 700,
          child: AllPageContent(),
        ),
      ],
    );
  }
}

class AllPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // First plant item
                  PlantItem(
                    image: 'assets/images/Philodendron Birkin.png',
                    title: 'Monstera deliciosa',
                    price: '\$8.00',
                  ),
                  SizedBox(height: 16.0),
                  // Second plant item
                  PlantItem(
                    image: 'assets/images/Philodendron Birkin.png',
                    title: 'Monstera deliciosa',
                    price: '\$10.00',
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            // Second column
            Expanded(
              child: Column(
                children: [
                  // Third plant item
                  PlantItem(
                    image: 'assets/images/Philodendron Birkin.png',
                    title: 'Monstera deliciosa',
                    price: '\$8.00',
                  ),
                  SizedBox(height: 16.0),
                  // Fourth plant item
                  PlantItem(
                    image: 'assets/images/Philodendron Birkin.png',
                    title: 'Monstera deliciosa',
                    price: '\$10.00',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        // Additional rows of plant items...
      ],
    );
  }
}

class PlantItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  PlantItem({required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        child: Container(
          width: 130,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(0, -20),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
