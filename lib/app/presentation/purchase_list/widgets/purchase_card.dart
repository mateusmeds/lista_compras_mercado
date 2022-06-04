import 'package:flutter/material.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

class PurchaseCard extends StatelessWidget {
  const PurchaseCard({
    required this.purchaseEntity,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final PurchaseEntity purchaseEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          title: const Text(
            'Descrição',
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${purchaseEntity.date}"),
                const SizedBox(
                  height: 10,
                ),
                Text('R\$ ${purchaseEntity.totalValue}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
