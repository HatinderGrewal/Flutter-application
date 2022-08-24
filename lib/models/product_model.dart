class ProductModel{
  int id=-1;
  String title='';
  double price=-1.0;
  String description='';
  String category='';
  String imgUrl='';
  double rate=-1.0;
  double count=-1.0;

  ProductModel.empty();

  ProductModel.fromJson(Map<String,dynamic> json){
    id = int.parse('${json['id'] ?? -1}');
    title = json['title'] ?? '';
    price = double.parse('${json['price'] ?? -1.0}');
    description = json['description'] ?? '';
    category = json['category'] ?? '';
    imgUrl = json['image'] ?? '';
    rate = double.parse('${json['rating']['rate'] ?? -1.0}');
    count = double.parse('${json['rating']['count'] ?? -1.0}');
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, title: $title, price: $price, description: $description, category: $category, imgUrl: $imgUrl, rate: $rate, count: $count}';
  }
}