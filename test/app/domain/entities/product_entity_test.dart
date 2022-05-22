import 'package:flutter_test/flutter_test.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';

void main() {
  late ProductEntity _productEntity;

  setUpAll(() {
    _productEntity = ProductEntity(name: 'Arroz Integral', price: 4.0);
  });

  test('Deve retornar a quantidade inicial 1', () {
    int quantity = _productEntity.quantity;
    expect(quantity, equals(1));
  });

  test('Deve retornar o nome Arroz Integral', () {
    String name = _productEntity.name;
    expect(name, equals('Arroz Integral'));
  });

  test('Deve retornar o preço igual a 4.0', () {
    double price = _productEntity.price;
    expect(price, equals(4.0));
  });

  test('Deve retornar o preço total inicial igual a 4.0', () {
    double totalPrice = _productEntity.totalPrice;
    expect(totalPrice, equals(4.0));
  });

  test('Deve adicionar 3 novos itens e retornar o preço total igual a 16.0',
      () {
    _productEntity.add();
    _productEntity.add();
    _productEntity.add();

    int quantity = _productEntity.quantity;
    double totalPrice = _productEntity.totalPrice;
    expect(quantity, equals(4));
    expect(totalPrice, equals(16.0));
  });
}
