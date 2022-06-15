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

class DialogRoute extends StatefulWidget {
  const DialogRoute({Key? key}) : super(key: key);

  @override
  State<DialogRoute> createState() => _DialogRouteState();
}

class _DialogRouteState extends State<DialogRoute> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    showDeleteConfirmDialog2() {
      withTree = false;
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('您确定要删除当前文件吗?'),
                Row(
                  children: [
                    const Text('同时删除子目录？'),
                    Builder(builder: (context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (value) {
                          setState(() {
                            (context as Element).markNeedsBuild();
                            withTree = !withTree;
                          });
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
                child: const Text('删除'),
              ),
            ],
          );
        },
      );
    }

    _showModalBottomSheet() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        },
      );
    }

    showLoadingDialog() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 26),
                      child: Text('正在加载，请稍后...'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    _showDatePicker1() {
      var date = DateTime.now();
      return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(
          const Duration(days: 30),
        ),
      );
    }

    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            var delete = await showDeleteConfirmDialog2();
            if (delete == null) {
              print('取消删除');
            } else {
              print('同时删除子目录：$delete');
            }
          },
          child: const Text('对话框2'),
        ),
        ElevatedButton(
          onPressed: () async {
            var type = await _showModalBottomSheet();
            print(type);
          },
          child: const Text('打开底部样式对话框'),
        ),
        ElevatedButton(
          onPressed: () {
            showLoadingDialog();
          },
          child: const Text('显示loading'),
        ),
        ElevatedButton(
          onPressed: () async {
            var value = await _showDatePicker1();
            print(value);
          },
          child: const Text('打开日期选择器'),
        ),
      ],
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
        body: const DialogRoute(),
      ),
    ),
  );
}
