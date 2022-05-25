import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity extends HiveObject {
  ProductEntity({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  String _id = Uuid().v4();

  @HiveField(0)
  String get id => _id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  double get totalPrice => _getTotalPrice();

  double _getTotalPrice() {
    return price * quantity;
  }

  remove() {
    if (quantity > 1) {
      quantity--;
    }
  }

  add() {
    quantity++;
  }
}
