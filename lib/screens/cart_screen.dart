import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_data_provider.dart';
import '../widgets/display_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Consumer<ItemDataProvider>(
          builder: (context, itemDataProvider, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: itemDataProvider.getAllCartItemList.length,
            itemBuilder: (context, index) => DisplayItem(
                  itemName: itemDataProvider.getAllCartItemList[index],
                ));
      }),
    );
  }
}
