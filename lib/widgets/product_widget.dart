import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/model/product_model.dart';
import 'package:ecommerce_project/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetailsScreen(product: widget.product);
        }));
      },
      child: ProductCard(product: widget.product),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "productCard${widget.product.productId}",
            child: ProductImageWithFavButton(
              product: widget.product,
              onPressed: () {
                setState(() {
                  widget.product.isFavourite = !widget.product.isFavourite;
                });
              },
            ),
          ),
          ProductName(name: widget.product.productName),
          ProductPrice(price: widget.product.productPrice)
        ],
      ),
    );
  }
}

class ProductImageWithFavButton extends StatelessWidget {
  const ProductImageWithFavButton({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Product product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ProductImage(productId: product.productId),
        ProductFavButton(
          isFav: product.isFavourite,
          onPressed: () => onPressed(),
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.asset(
          'assets/images/shoe${productId + 1}.png',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class ProductFavButton extends StatefulWidget {
  const ProductFavButton({
    super.key,
    required this.isFav,
    required this.onPressed,
  });

  final bool isFav;
  final VoidCallback onPressed;

  @override
  State<ProductFavButton> createState() => _ProductFavButtonState();
}

class _ProductFavButtonState extends State<ProductFavButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        style: TextButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            minimumSize: const Size(10, 10)),
        child: Icon(
          widget.isFav ? Icons.favorite : Icons.favorite_outlined,
          color: Colors.red,
          size: 16,
        ),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
