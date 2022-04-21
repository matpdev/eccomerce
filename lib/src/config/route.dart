import 'package:flutter/material.dart';
import 'package:eccomerce/src/pages/mainPage.dart';

import '../pages/product_detail.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const MainPage(),
      '/detail': (_) => const ProductDetailPage()
    };
  }
}
