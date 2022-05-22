class ProductEntity {
  ProductEntity({
    required String name,
    required double price,
    int quantity = 1,
  })  : _name = name,
        _price = price,
        _quantity = quantity;

  String _name;
  double _price;
  int _quantity;

  String get name => _name;
  double get price => _price;
  int get quantity => _quantity;

  double get totalPrice => _getTotalPrice();

  double _getTotalPrice() {
    return _price * _quantity;
  }

  remove() {
    if (_quantity > 1) {
      _quantity--;
    }
  }

  add() {
    _quantity++;
  }
}
