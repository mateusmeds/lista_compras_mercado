import 'package:hive/hive.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:uuid/uuid.dart';
part 'purchase_entity.g.dart';

@HiveType(typeId: 0)
class PurchaseEntity extends HiveObject {
  PurchaseEntity({required this.products});

  String _id = Uuid().v4();

  @HiveField(0)
  String get id => _id;

  @HiveField(1)
  List<ProductEntity> products;

  @HiveField(2)
  DateTime date = DateTime.now();

  double get totalValue {
    return products.fold<double>(
        0, (previousValue, element) => previousValue + element.totalPrice);
  }

  int get quantityProducts {
    return products.length;
  }

  int get quantityTotalProducts {
    return products.fold<int>(
        0, (previousValue, element) => previousValue + element.quantity);
  }
}
