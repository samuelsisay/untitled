import 'package:flutter/material.dart';
import 'package:untitled/models/cart_item.dart';
import 'package:untitled/widgets/custom_text.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemWidget({Key key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.asset(
            cartItem.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                    child: CustomText(
                      text: cartItem.name,
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                            Icons.chevron_left),
                        onPressed: () {}),
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child: CustomText(
                        text: cartItem.quantity,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons
                            .chevron_right),
                        onPressed: () {}),
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem.cost}",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
