import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Container(
            width: constraints.maxWidth * 0.8,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        tileColor: Colors.grey[200],
                        leading: CircleAvatar(),
                        title: Text('Item $index'),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Preço: R\$ 10,00'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Total:  R\$ 20,00'),
                            ],
                          ),
                        ),
                        trailing: FittedBox(
                          child: Column(
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.remove_circle_outline,
                                ),
                                onTap: () {},
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text('2')),
                              InkWell(
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOTAL'),
                      Text('R\$ 200,00'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: constraints.maxWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('FINALIZAR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
