class CartItem {
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          imageUrl == other.imageUrl &&
          quantity == other.quantity;

  @override
  int get hashCode =>
      name.hashCode ^ price.hashCode ^ imageUrl.hashCode ^ quantity.hashCode;
}
