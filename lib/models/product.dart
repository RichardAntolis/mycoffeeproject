class productCoffee {
  final String? title;
  final String? subtitle;
  final String? images;
  final String? price;

  productCoffee ({required this.title, required this.subtitle, required this.images, required this.price});

  Map<String, dynamic> toJson()
  {
    return {
      "title" : title,
      "subtitle" : subtitle,
      "images" : images,
      "price" : price,
    };
  }

  factory productCoffee.fromJson(Map<String, dynamic> json){
    return productCoffee(
      title: json['title'],
      subtitle: json['subtitle'],
      images: json['images'],
      price: json['price'],
    );
  }
}