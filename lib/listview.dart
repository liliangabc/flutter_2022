import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

Widget demo1 = ListView(
  shrinkWrap: true,
  padding: const EdgeInsets.all(20),
  children: const [
    Text('I\'m dedicating every day to you'),
    Text('Domestic life was never quite my style'),
    Text('When you smile, you knock me out, I fall apart'),
    Text('And I thought I was so smart'),
  ],
);

Widget demo2 = ListView.builder(
  itemCount: 100,
  itemExtent: 50,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text('$index'),
    );
  },
);

class ListView3 extends StatelessWidget {
  const ListView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider1 = Divider(color: Colors.blue, height: 1);
    const divider2 = Divider(color: Colors.green, height: 1);
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      prototypeItem: const ListTile(title: Text('1')),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text('$index'));
      },
    );
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({Key? key}) : super(key: key);

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';
  final _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if (_words[index] == loadingTag) {
          if (_words.length - 1 < 100) {
            _retrieveData();
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const Text(
                '没有更多了',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        return ListTile(
          onTap: () {},
          title: Text(_words[index]),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }
}

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('列表视图'),
      ),
      body: const InfiniteListView(),
    ),
  ));
}
