import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _carouselScrollController = ScrollController();
  double _carouselScrollOffset = 0;

  @override
  void dispose() {
    _carouselScrollController.dispose();
    super.dispose();
  }

  void handleCarouselScrollUpdate(DragUpdateDetails details) {
    setState(() {
      _carouselScrollOffset -= details.delta.dx;
    });
  }

  void handleCarouselScrollEnd(DragEndDetails details) {
    if (_carouselScrollOffset.abs() > 100) {
      if (_carouselScrollOffset > 0) {
        _carouselScrollController.animateTo(
          _carouselScrollController.offset + 200,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        );
      } else {
        _carouselScrollController.animateTo(
          _carouselScrollController.offset - 200,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        );
      }
    }

    setState(() {
      _carouselScrollOffset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16.0,
          left: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Explorer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 50.0,
                      ),
                      child: Image.asset(
                        "assets/images/profile.png",
                        width: 40,
                        height: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                print('Search box clicked');
              },
              child: Container(
                width: 350.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                  children: [
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
                'Top Sale',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 200.0,
              child: GestureDetector(
                onHorizontalDragUpdate: handleCarouselScrollUpdate,
                onHorizontalDragEnd: handleCarouselScrollEnd,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _carouselScrollController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.0,
                      margin: EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: index % 2 == 0
                              ? [Colors.blue, Colors.blueAccent]
                              : [Colors.green, Colors.lightGreen],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Peace lily.png',
                              width: 80.0,
                              height: 80.0,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'tree',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
