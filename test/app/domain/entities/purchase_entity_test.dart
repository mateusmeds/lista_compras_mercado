import 'package:flutter_test/flutter_test.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

void main() {
  late PurchaseEntity _purchaseEntity;

  setUpAll(() {
    _purchaseEntity = PurchaseEntity(products: [
      ProductEntity(name: 'Arroz', price: 4.0, quantity: 4),
      ProductEntity(name: 'Feijão', price: 6.0, quantity: 2),
      ProductEntity(name: 'Macarrão', price: 3.0, quantity: 4),
    ]);
  });

  test('Deve retornar a quantidade de produtos igual a 3', () {
    int quantityProducts = _purchaseEntity.quantityProducts;
    expect(quantityProducts, equals(3));
  });

  test('Deve retornar a quantidade total de produtos igual a 10', () {
    int quantityTotalProducts = _purchaseEntity.quantityTotalProducts;
    expect(quantityTotalProducts, equals(10));
  });

  test('Deve retornar o valor total igual a 40.0', () {
    double totalValue = _purchaseEntity.totalValue;
    expect(totalValue, equals(40.0));
  });

  test('Deve adicionar 1 produto e removê-lo', () {
    _purchaseEntity.addProduct(ProductEntity(name: 'Café', price: 10.0));
    _purchaseEntity.removeProduct(_purchaseEntity.products.last);

    int quantityProducts = _purchaseEntity.quantityProducts;
    int quantityTotalProducts = _purchaseEntity.quantityTotalProducts;
    double totalValue = _purchaseEntity.totalValue;
    bool contains = _purchaseEntity.products
        .any((product) => product.name.contains('Café'));

    expect(contains, isFalse);
    expect(quantityProducts, equals(3));
    expect(quantityTotalProducts, equals(10));
    expect(totalValue, equals(40.0));
  });

  test('Deve adicionar 2 novos produtos', () {
    _purchaseEntity.addProduct(
        ProductEntity(name: 'Molho de tomate', price: 1.5, quantity: 10));
    _purchaseEntity.addProduct(
        ProductEntity(name: 'Barra de chocolate', price: 5.5, quantity: 5));

    int quantityProducts = _purchaseEntity.quantityProducts;
    int quantityTotalProducts = _purchaseEntity.quantityTotalProducts;
    double totalValue = _purchaseEntity.totalValue;

    expect(quantityProducts, equals(5));
    expect(quantityTotalProducts, equals(25));
    expect(totalValue, equals(82.5));
  });
}
