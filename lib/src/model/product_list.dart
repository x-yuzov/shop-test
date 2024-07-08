
class ProductList {
  final int productId;
  final String title;
  final String productDescription;
  final int price;
  final rating;
  final String imageUrl;
  final int isAvailableForSale;
  final List<String> images	;

  const ProductList({
    required this.productId,
    required this.title,
    required this.productDescription,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.images,
    required this.isAvailableForSale
  });

  factory ProductList.fromJson(dynamic json) {
    List<String> imgs = [];
    json['images'].forEach((el)=>{
      imgs.add(el)
    });

    return ProductList(
        productId: json['productId'],
        title: json['title'],
        productDescription: json['productDescription'],
        price: json['price'],
        rating: json['rating'],
        imageUrl: json['imageUrl'],
        images: imgs,
        isAvailableForSale: json['isAvailableForSale']
    );
  }
}