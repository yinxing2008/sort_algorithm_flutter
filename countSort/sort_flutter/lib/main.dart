import 'package:flutter/material.dart';

/// 厦门大学计算机专业 | 前华为工程师
/// 专注《零基础学编程系列》  http://lblbc.cn/blog
/// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
/// 公众号：蓝不蓝编程
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '计数排序 - 蓝不蓝编程'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  var list = [2, 1, 5, 4, 3];

  @override
  void initState() {
    super.initState();
    setState(() {
      text = convertToStr(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    shuffle(list);
                    setState(() {
                      text = convertToStr(list);
                    });
                  },
                  child: const Text('打乱'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    sort(list);
                    setState(() {
                      text = convertToStr(list);
                    });
                  },
                  child: const Text('排序'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void shuffle(List<int> list) {
  list.shuffle();
}

void sort(List<int> array) {
  int min = array[0];
  int max = min;
  for (int num in array) {
    if (num > max) {
      max = num;
    } else if (num < min) {
      min = num;
    }
  }
  List<int> counting = List.filled(max - min + 1, 0);
  for (int i = 0; i < array.length; i++) {
    counting[array[i] - min] += 1;
  }
  int index = -1;
  for (int i = 0; i < counting.length; i++) {
    for (int j = 0; j < counting[i]; j++) {
      index++;
      array[index] = i + min;
    }
  }
}

convertToStr(List<int> list) {
  return list.join(" ");
}
