import 'package:flutter/material.dart';
import 'package:untitled/constants/asset_paths.dart';
import 'package:untitled/models/cart_item.dart';
import 'package:untitled/screens/home/widgets/cart_item_widget.dart';
import 'package:untitled/widgets/custom_btn.dart';
import 'package:untitled/widgets/custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <CartItemModel>[
                CartItemModel(
                  name: "Nike shoes",
                  image: image1,
                  cost: "12",
                  quantity: "7"

                )
              ]
                  .map((cartItem) => CartItemWidget(cartItem: cartItem,))
                  .toList(),
            ),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: CustomButton(
                  text: "Pay (\$${123.0})", onTap: () {}),
            ))
      ],
    );
  }
}
