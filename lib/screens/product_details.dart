import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/model/product_model.dart';
import 'package:ecommerce_project/widgets/product_details_widget.dart';
import 'package:ecommerce_project/widgets/rating.dart';
import 'package:ecommerce_project/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Ecommerce",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 14,
            ),
            child: Icon(
              Icons.shopping_bag_sharp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(product: widget.product),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.product.productName,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                RatingContainer(
                  productRating: widget.product.productRating,
                  totalReview: widget.product.totalReview,
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Description",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                ReadMoreText(
                  "The Nike Air Max shoe, often referred to as simply Air Max is an iconic and highly recognizable athletic footwear line produced by Nike, Inc. These shoes are renowned for their innovative design, superior comfort, and cutting-edge technology, making them a favorite among athletes, sneaker enthusiasts, and casual wearers alike. In summary, Nike Air Max shoes are more than just athletic footwear; they represent a fusion of sport, style, and innovation. With their distinct design and groundbreaking cushioning technology, they have left an indelible mark on both the sports and fashion worlds, making them a symbol of performance and style. ",
                  trimLines: 4,
                  colorClickableText: kPrimaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Read More",
                  trimExpandedText: "Read Less",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Available Sizes",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizeContainer(),
                const SizedBox(height: 120.0)
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "\$${widget.product.productPrice}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
