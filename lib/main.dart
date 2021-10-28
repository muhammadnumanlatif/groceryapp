import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: GroceryApp(),
    );
  }
}

class GroceryApp extends StatefulWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
 final ValueNotifier<int> _bottomTabIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
           padding: EdgeInsets.only(top:8,),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Deliver to "),
                          Text(
                              "Work",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Expanded(child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        foregroundColor: Colors.teal,
                        child: Text("D"),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _bottomTabIndex,
                    builder: (context, pageIndex, child){
                      return IndexedStack(
                        index: pageIndex,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Shops"),
                            ),
                          ),

                          Container(
                            child: Center(
                              child: Text("Buy"),
                            ),
                          ),

                          Container(
                            child: Center(
                              child: Text("Send"),
                            ),
                          ),

                          Container(
                            child: Center(
                              child: Text("Offers"),
                            ),
                          ),

                          Container(
                            child: Center(
                              child: Text("Profile"),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _bottomTabIndex,
        builder: (context, bottomTabIndex, child){
         return BottomNavigationBar(
            onTap: (idx){
              _bottomTabIndex.value=idx;
            },
            currentIndex: bottomTabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.teal,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Shops",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: "Buy",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.markunread_mailbox_outlined),
                label: "Send",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_outlined),
                label: "Offers",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
