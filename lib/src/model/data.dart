import 'package:eccomerce/src/model/category.dart';
import 'package:eccomerce/src/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
      id: 1,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: true,
      image: "assets/shoe_thumb_1.png",
      isSelected: true,
    ),
    Product(
      id: 2,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/shoe_thumb_2.png",
      isSelected: true,
    ),
    Product(
      id: 2,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/shoe_thumb_2.png",
      isSelected: true,
    ),
  ];
  static List<Product> cartList = [
    Product(
      id: 1,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/small_tilt_shoe_1.png",
      isSelected: true,
    ),
    Product(
      id: 2,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/small_tilt_shoe_1.png",
      isSelected: true,
    ),
    Product(
      id: 3,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/small_tilt_shoe_1.png",
      isSelected: true,
    ),
    Product(
      id: 4,
      name: "Nike Air Max 200",
      category: "Alto Nível",
      price: 240.00,
      isLiked: false,
      image: "assets/small_tilt_shoe_1.png",
      isSelected: true,
    ),
  ];

  static List<Category> categoryList = [
    Category(id: 1, name: "Sapatos", image: "assets/shoe_thumb_2.png"),
    Category(id: 2, name: "Jaquetas", image: "assets/jacket.png"),
    Category(id: 3, name: "Relógios", image: "assets/watch.png"),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless the people shoe returns with the Nike Air Max 90. Featurin the same iconic Waffle sole, stitched overlays and classic TPU accets you come to love, it lets you walk among the pantheon of Air. ";
}
