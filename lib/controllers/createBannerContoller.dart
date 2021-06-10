import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/firebase.dart';
import 'package:untitled/models/product.dart';

class BannerContoller extends GetxController {
  static BannerContoller instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String productsCollection = 'products';
  TextEditingController id = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController price = TextEditingController();

  addProductsToFirestore() {
    try {
      firebaseFirestore.collection(productsCollection).doc().set({
        "id": id,
        "image": image,
        "name": name,
        "brand": brand,
        "price": price,
      }).then((value) {
        String userId;
        _initializeUserModel(userId);
      });
    } catch (e) {
      Get.snackbar('Try Again', e.message);
    }
  }

  _initializeUserModel(String userId) async {
    products.value = await firebaseFirestore
        .collection(productsCollection)
        .doc(userId)
        .get()
        .then((doc) => ProductModel.fromSnapshot(doc));
  }
}
