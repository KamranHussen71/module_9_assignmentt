import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, int> itemCounts = {"Pullover": 1, "T-shirt": 1, "Sport Dress": 1};
  double unitPrice = 51.00;

  void _incrementItem(String item) {
    setState(() {
      itemCounts[item] = itemCounts[item]! + 1;
    });
  }

  void _decrementItem(String item) {
    setState(() {
      itemCounts[item] = itemCounts[item]! > 0 ? itemCounts[item]! - 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount =
    itemCounts.values.fold(0, (previous, count) => previous + (count * unitPrice));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("My Bag", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildClothItem(
                    "Pullover",
                    "https://p1.akcdn.net/full/998816139.tommy-hilfiger-pamuchen-suichyr-tommy-hilfiger-v-zeleno-s-aplikacija-mw0mw25891-9byy.jpg",
                    "Green",
                  ),
                  _buildClothItem(
                    "T-shirt",
                    "https://artisanclick.com/wp-content/uploads/2021/09/1-3-scaled.jpg",
                    "Blue",
                  ),
                  _buildClothItem(
                    "Sport Dress",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9q5Yvyrjn5DLwKpre2VUb6odoktaE9DE4WNf6ygbP86baWfFh8GNPKm-vyYeG7VmM6sE&usqp=CAU",
                    "Black",
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity: 0.6, child: Text("Total Amount")),
                Text("\$${totalAmount.toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Congratulations on your checkout!")),
                );
              },
              child: Text("CHECK OUT"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(130),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildClothItem(String title, String imageUrl, String color) {
    if (color == "Green") {
    } else if (color == "Blue") {
    } else if (color == "Black") {
    } else {
    }

    return Column(
      children: [
        Container(
          height: 110,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Opacity(opacity: 0.6, child: Text("Color:")),
                            SizedBox(width: 5),
                            Text(color),
                            SizedBox(width: 20),
                            Opacity(opacity: 0.6, child: Text("Size:")),
                            SizedBox(width: 5),
                            Text("M"),
                          ],
                        ),
                        Row(
                          children: [
                            _buildCircleIcon(Icons.remove, () => _decrementItem(title)),
                            SizedBox(width: 10),
                            Text("${itemCounts[title]}", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            _buildCircleIcon(Icons.add, () => _incrementItem(title)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Icon(
                            Icons.more_vert,
                            size: 32,
                          ),
                        ),
                        Text("\$${(unitPrice * itemCounts[title]!).toStringAsFixed(0)}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCircleIcon(IconData iconData, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 12,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(child: Icon(iconData, color: Colors.black.withOpacity(0.75), size: 22)),
      ),
    );
  }
}