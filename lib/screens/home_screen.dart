import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/item_data_provider.dart';
import 'package:provider_demo/widgets/display_item.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          if (context.watch<ItemDataProvider>().getAllCartItemList.isNotEmpty)

            /// We can also use context.select which allows to listen only specific part of data
            // if (context.select<ItemDataProvider, bool>(
            //     ((value) => value.getAllCartItemList.isNotEmpty)))
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Consumer<ItemDataProvider>(
          builder: (context, itemDataProvider, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: itemDataProvider.allItems.length,
            itemBuilder: (context, index) => DisplayItem(
                  itemName: itemDataProvider.allItems[index],
                ));
      }),
    );
  }
}
