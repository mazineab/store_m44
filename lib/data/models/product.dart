class Product{
  int id;
  String nameBrand,description,imgSrc;
  String prix;
  List<dynamic>? optionsImg;
  late int countItem;

  Product({required this.id,required this.nameBrand,required this.description,required this.imgSrc, required this.prix,this.optionsImg,this.countItem=1});

  factory Product.fromJson(Map<String,dynamic> data){
    return Product(
        id: data['id'],
        nameBrand: data['nameBrand'],
        description: data['description'],
        imgSrc: data['imgSrc'],
        prix: data['prix'].trim(),
        optionsImg: data['optionsImg']
    );
  }

  Map<String,dynamic> toJson(Product product){
    return {
      'id':product.id,
      "nameBrand":product.nameBrand,
      'description':product.nameBrand,
      'imgSrc':product.imgSrc,
      'prix':product.prix,
      'optionsImg':product.optionsImg
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, description: $description, prix: $prix, countItem: $countItem}';
  }
}