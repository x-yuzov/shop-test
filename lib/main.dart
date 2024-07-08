import 'package:flutter/material.dart';
import 'package:shop/src/view/about.dart';
import 'package:shop/src/view/feedback.dart';
import 'package:shop/src/view/cart.dart';
import 'package:shop/api/category.dart';
import 'package:shop/src/view/product_list.dart';
import 'package:shop/src/model/category.dart';
import 'package:shop/src/view/product.dart';
import 'package:shop/src/view/drawer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Интернет-магазин',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainPage(title: 'Магазин'),
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => const MainPage(title: 'Магазин'),
          '/category': (BuildContext context) =>
              const CategoryPage(id: 0, title: ''),
          '/product': (BuildContext context) => const DetailPage(),
          '/cart': (BuildContext context) => const CartPage(),
          '/feedback': (BuildContext context) => const FeedbackPage(),
          '/about': (BuildContext context) => const AboutPage(),
        });
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Category>> futureCat;

  @override
  void initState() {
    super.initState();
    futureCat = getCat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Menu(),
        body:
        FutureBuilder<List<Category>>(
          future: futureCat,
          builder: (context, snapshot) {
            List<Widget> taskWidgets = [];
            snapshot.data?.forEach((element) {
              taskWidgets.add(
                ElementList(
                  id: element.categoryId,
                  img: element.imageUrl,
                  txt: element.title,
                )
              );
            });

            return GridView.count(
                crossAxisCount: 2,
                children: taskWidgets
            );
          }
        ),
        );
  }
}

class ElementList extends StatelessWidget {
  final String img;
  final String txt;
  final int id;

  const ElementList(
      {super.key, required this.img, required this.txt, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryPage(id: id, title: txt)),
        )
      },
      child: Card(
          color: Colors.white60,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex:1,
                  child: Image.network(img, width: 100, height: 100)
                ),
                Flexible(flex:1,
                  child: Text(txt, style: const TextStyle(color: Colors.black))
                ),
              ],
            ),
          )
      )
    );
  }
}
