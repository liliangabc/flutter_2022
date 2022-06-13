import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'images/avatar.png',
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    'Wendux',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottombar = BottomAppBar(
  color: Colors.white,
  shape: const CircularNotchedRectangle(),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [
      IconButton(
        icon: Icon(Icons.home),
        onPressed: null,
      ),
      SizedBox(),
      IconButton(
        onPressed: null,
        icon: Icon(Icons.business),
      ),
    ],
  ),
);

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  State<ScaffoldRoute> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: const Icon(
        //         Icons.dashboard,
        //         color: Colors.white,
        //       ),
        //     );
        //   },
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onAdd() {}
}

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: ScaffoldRoute(),
    ),
  );
}
