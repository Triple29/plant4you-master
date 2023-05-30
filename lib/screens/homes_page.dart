import 'package:flutter/material.dart';
import 'package:plantforyou/components/product.dart';
import 'package:plantforyou/screens/calathea.dart';
import 'package:plantforyou/screens/cart.dart';
import '../components/menubar.dart';

class HomesPage extends StatefulWidget {
  const HomesPage({Key? key}) : super(key: key);

  @override
  _HomesPageState createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  int selectedButtonIndex = 0;
  bool isAllSelected = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> plants = [];

    for (int i = 0; i < 5; i++) {
      plants.add(
        GestureDetector(
          // เพิ่ม GestureDetector รอบๆ Widget ของสินค้าแต่ละรายการ
          onTap: () {
            Navigator.push(
              // เปลี่ยนไปยังหน้าสินค้าที่เกี่ยวข้องเมื่อคลิกที่สินค้า
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Calathea(), // เปลี่ยนเป็นหน้าสินค้าที่เกี่ยวข้อง
              ),
            );
          },
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
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
                      child: Image.asset(
                        'assets/images/Philodendron Birkin.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Monstera ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' deliciosa',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$8.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16.0,
          // left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Explorer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                      ),
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
              child: Container(
                width: 350.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Selling',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 400,
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: plants,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShoppingCartPage(), // เปลี่ยนเป็นหน้า CartPage ที่คุณต้องการไป
                        ),
                      );
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: selectedButtonIndex == 0
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1;
                        isAllSelected = false;
                      });
                    },
                    child: Text(
                      'Indoor',
                      style: TextStyle(
                        color: selectedButtonIndex == 1
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2;
                        isAllSelected = false;
                      });
                    },
                    child: Text(
                      'Outdoor',
                      style: TextStyle(
                        color: selectedButtonIndex == 2
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 3;
                        isAllSelected = false;
                      });
                    },
                    child: Text(
                      'Flower',
                      style: TextStyle(
                        color: selectedButtonIndex == 3
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 313,
              width: double.infinity,
              child: AllPage(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: Menubar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
