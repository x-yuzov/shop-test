import 'package:flutter/material.dart';
import 'package:shop/src/model/product_list.dart';
import 'package:shop/api/product_list.dart';
import 'package:shop/src/view/product.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<ProductList>> futureList;

  @override
  void initState() {
    super.initState();
    futureList = getList(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title == '' ? 'Все товары' : widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: [
          FutureBuilder<List<ProductList>>(
              future: futureList,
              builder: (context, snapshot) {
                List<Widget> taskWidgets = [];
                snapshot.data?.forEach((element) {
                  taskWidgets.add(GestureDetector(
                      onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        id: element.productId,
                                        title: element.title,
                                        img: element.imageUrl,
                                        price: element.price,
                                      )),
                            )
                          },
                      child: Card(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.white60,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Flex(
                                direction: Axis.horizontal,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network(
                                          element.imageUrl,
                                          width: 200,
                                        )),
                                  ),
                                  Flexible(
                                      flex: 2,
                                      child: Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(element.title,
                                              softWrap: true,
                                              style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold)),
                                          const Padding(
                                              padding: EdgeInsets.all(5)),
                                          SizedBox(
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(4))),
                                              child: Text( '${element.price} руб.'),
                                            )
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(10)),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPage(
                                                            id: element  .productId,
                                                            title: element.title,
                                                            img: element.imageUrl,
                                                            price: element.price)),
                                              );
                                            },
                                            color: Colors.black87,
                                            height: 50,
                                            child: Stack(
                                              children: const [
                                                Text('Купить', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                                ]),
                          ))));
                });
                return Column(
                  children: taskWidgets,
                );
              })
        ]));
  }
}
