import 'package:ecommerce_project/model/product_model.dart';
import 'package:ecommerce_project/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "productCard${widget.product.productId}",
      child: ProductImageWithFavButton(
        product: widget.product,
        onPressed: () {
          setState(() {
            widget.product.isFavourite = !widget.product.isFavourite;
          });
        },
      ),
    );
  }
}
