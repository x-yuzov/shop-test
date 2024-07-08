import 'package:flutter/material.dart';
import 'package:shop/src/model/product.dart';
import 'package:shop/api/product.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.id=0, this.title='', this.img='', this.price=0});
  final String title;
  final String img;
  final int price;
  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = getProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title=='' ? 'Товар' : widget.title),
        ),
        body: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              String? titleProd =  snapshot.data?.title ?? widget.title;
              String? descriptionProd =  snapshot.data?.productDescription ?? 'нет описания';
              String? priceProd =  snapshot.data?.price.toString() ?? widget.price.toString();
              String? imageProd =  snapshot.data?.imageUrl ?? widget.img;
              List<String>? imgsProd =  snapshot.data?.images;

              List<Widget> imgsWidgets = [];
              imgsProd?.forEach((element) {
                imgsWidgets.add(Image.network(
                  element,
                  width: 50,
                ));
              });

              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.network(
                          imageProd,
                          width: 200,
                        ),
                      ),
                      SizedBox(width: 200, height: 40,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: imgsWidgets
                        ),
                      ),

                      const Padding(padding: EdgeInsets.all(5)),
                      Text('$priceProd руб.', style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),

                      const Padding(padding: EdgeInsets.all(5)),
                      MaterialButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: const Text('Корзина пока не работает...'),
                            action: SnackBarAction(
                              label: 'Скрыть',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        color: Colors.black87,
                        height: 50,
                        minWidth: 200,
                        child: Stack(children: const [
                          Text('Купить', style: TextStyle(color: Colors.white))
                        ]),
                      ),

                      const Padding(padding: EdgeInsets.all(5)),

                      Text(titleProd!),

                      const Padding(padding: EdgeInsets.all(5)),

                      const Text('Описание', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(descriptionProd,softWrap: true, )
                    ],
                  )
              );


            }),
    );
  }
}