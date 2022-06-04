import 'package:flutter/material.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

class PurchaseDetailPage extends StatefulWidget {
  PurchaseDetailPage({required this.purchaseEntity, Key? key})
      : super(key: key);

  PurchaseEntity purchaseEntity;

  @override
  State<PurchaseDetailPage> createState() => _PurchaseDetailPageState();
}

class _PurchaseDetailPageState extends State<PurchaseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUA COMPRA'),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Compra realizada ${widget.purchaseEntity.date}",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: widget.purchaseEntity.products.length,
                    itemBuilder: (context, index) {
                      ProductEntity productEntity =
                          widget.purchaseEntity.products[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            title: Text(
                              productEntity.name,
                              maxLines: 2,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Preço: R\$ ${productEntity.price.toStringAsFixed(2)}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Total: R\$ ${productEntity.totalPrice.toStringAsFixed(2)}'),
                                ],
                              ),
                            ),
                            trailing: CircleAvatar(
                              radius: 12,
                              child: FittedBox(
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text('${productEntity.quantity}')),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('TOTAL'),
                        Text(
                            'R\$ ${widget.purchaseEntity.totalValue.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
