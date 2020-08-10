import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        (showFavs) ? productsData.favoriteItem : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      // itemBuilder: (ctx, i) => ChangeNotifierProvider(
      //         create: (ctx) => products[i],   ///<- as we do not use the context we are switching
      /// to value which is shorter form of this syntax as the value
      /// the other thing is value works well with listView and grid views
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        ///<- change notifier also cleans up data.
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl
            ),
      ),
    );
  }
}
