class ProductDataModel{
  //data Type
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? components;
  String? ville;
  String? price;


// constructor
  ProductDataModel(
      {
        this.id,
        this.name,
        this.category,
        this.imageURL,
        this.components,
        this.ville,
        this.price

      }
      );

  //method that assign values to respective datatype vairables
  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    components = json['components'];
    ville = json['ville'];
    price = json['price'];

  }
}