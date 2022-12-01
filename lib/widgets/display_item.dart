import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/item_data_provider.dart';
import 'package:provider_demo/widgets/add_remove_button.dart';

class DisplayItem extends StatelessWidget {
  // to pass a item name whenever we use DisplayItem Widget
  final String? itemName;
  const DisplayItem({
    super.key,
    this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 70, minWidth: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  itemName ?? "",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            /// To show the remove button if item is already present in cart list
            if (Provider.of<ItemDataProvider>(context, listen: false)
                .cartList
                .contains(itemName))
              AddRemoveButton(
                buttonText: "Remove",
                onTap: () {
                  /// call method to remove item from cart by using provider
                  Provider.of<ItemDataProvider>(context, listen: false)
                      .removeItemFromCart(itemName);
                },
              ),

            /// To show the add button if item is not present in cart list
            if (!Provider.of<ItemDataProvider>(context, listen: false)
                .cartList
                .contains(itemName))
              AddRemoveButton(
                buttonText: "Add",
                onTap: () {
                  /// call method to add item to cart by using provider
                  Provider.of<ItemDataProvider>(context, listen: false)
                      .addItemToCart(itemName);
                },
              )
          ],
        ),
      ),
    );
  }
}
