class Product {
  int id;
  String nameBrand;
  String description;
  String imgSrc;
  String prix;
  List<dynamic>? optionsImg;
  int countItem;

  Product({
    required this.id,
    required this.nameBrand,
    required this.description,
    required this.imgSrc,
    required this.prix,
    this.optionsImg,
    this.countItem = 1,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      nameBrand: data['nameBrand'],
      description: data['description'],
      imgSrc: data['imgSrc'],
      prix: data['prix'].trim(),
      countItem: data.containsKey('itemCount') ? data['itemCount'] : 1,
      optionsImg: data['optionsImg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameBrand': nameBrand,
      'description': description,
      'imgSrc': imgSrc,
      'prix': prix,
      'itemCount': countItem,
      'optionsImg': optionsImg,
    };
  }

  bool equals(Product product) {
    return this.nameBrand == product.nameBrand &&
        this.description == product.description &&
        this.prix == product.prix;
  }

  @override
  String toString() {
    return 'Product{id: $id, Brand name: $nameBrand, description: $description, prix: $prix, countItem: $countItem}';
  }
}
