import 'package:flutter/material.dart';

class ConfirmDialogTest extends StatelessWidget {
  const ConfirmDialogTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showDeleteConfirmDialog1() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示'),
            content: const Text('您确定要删除当前文件吗?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('删除'),
              ),
            ],
          );
        },
      );
    }

    changeLanguage() async {
      var i = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('简体中文'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('美国英语'),
                ),
              ),
            ],
          );
        },
      );
      if (i != null) {
        print('选择了：${i == 1 ? '简体中文' : '美国英语'}');
      }
    }

    showListDialog() async {
      var index = await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              children: [
                const ListTile(
                  title: Text('请选择'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('$index'),
                        onTap: () => Navigator.of(context).pop(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
      if (index != null) {
        print('点击了：$index');
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () async {
                var delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print('取消删除');
                } else {
                  print('已确认删除');
                }
              },
              child: const Text('删除'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: changeLanguage,
              child: const Text('改变语言'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: showListDialog,
              child: const Text('列表选择'),
            ),
          ),
        ],
      ),
    );
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('对话框'),
        ),
        body: const ConfirmDialogTest(),
      ),
    ),
  );
}
