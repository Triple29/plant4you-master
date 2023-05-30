import 'package:flutter/material.dart';
import '../components/menubar.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 27.0),
                  child: Text(
                    'Explorer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset(
                        "assets/images/profile.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                print('Search box clicked');
              },
              child: Transform.translate(
                offset: Offset(20.0, 0.0),
                child: Container(
                  width: 350.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 10.0),
                      Icon(Icons.search),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 350,
              height: 120,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFF70A465),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/wepik-export-20230503085419 2.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Monstera Deliciosa',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$10.00',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/shopping-cart (1) 3.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/red-heart.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Menubar(selectedIndex: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
