class ProductModel {
  final String name, image, description, price, color, size;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.color,
      required this.size});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      color: json['color'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'size': size,
      'color': color,
    };
  }
}
