class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.dataAdded,
    required this.expirationDate,
    required this.quantity,
  });
  

  final String id;
  final String title;
  final DateTime dataAdded;
  final DateTime expirationDate;
  final String quantity;
}