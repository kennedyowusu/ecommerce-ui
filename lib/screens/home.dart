import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/constants/data.dart';
import 'package:ecommerce_project/constants/images.dart';
import 'package:ecommerce_project/model/category_model.dart';
import 'package:ecommerce_project/widgets/banner.dart';
import 'package:ecommerce_project/widgets/carousel_indicator.dart';
import 'package:ecommerce_project/widgets/carousel_widget.dart';
import 'package:ecommerce_project/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CarouselController carouselCtrl;
  int currentCarousel = 0;

  final List<BannerWidget> banners = [
    BannerWidget(
      text: "Up To 50% Off",
      btnText: "Buy Now",
      backgroundColor: kBlackColor,
      btnBgColor: kPrimaryColor,
      textDirection: TextDirection.ltr,
      imgWidth: 120,
      titleColor: Colors.white,
      buttonColor: Colors.white,
      image: dress,
    ),
    BannerWidget(
      text: "T-Shirt for Sale",
      btnText: "Grab Now",
      backgroundColor: Colors.teal,
      btnBgColor: Colors.white,
      textDirection: TextDirection.ltr,
      imgWidth: 120,
      titleColor: Colors.white,
      buttonColor: kPrimaryColor,
      image: shirt,
    ),
    BannerWidget(
      text: "Cheap Prices",
      btnText: "Buy Now",
      backgroundColor: Colors.purpleAccent,
      btnBgColor: Colors.white,
      textDirection: TextDirection.ltr,
      imgWidth: 120,
      titleColor: Colors.white,
      buttonColor: Colors.black,
      image: shirt,
    ),
    BannerWidget(
      text: "Body Fit Shirt",
      btnText: "Buy Now",
      backgroundColor: Colors.brown,
      btnBgColor: kPrimaryColor,
      textDirection: TextDirection.ltr,
      imgWidth: 120,
      titleColor: Colors.white,
      buttonColor: Colors.white,
      image: shoe,
    ),
  ];

  @override
  void initState() {
    carouselCtrl = CarouselController();
    super.initState();
  }

  void selectedCategory(Category category) {
    setState(() {
      CategoryData.setIsSelected(category.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTertiaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Icon(Icons.menu),
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
      body: Column(
        children: [
          // Build Search Input
          SearchField(),
          CarouselWidget(
            carouselController: carouselCtrl,
            bannerWidget: banners,
            onPageChanged: (int index) {
              setState(() {
                currentCarousel = index;
              });
            },
          ),

          CarouselIndicator(
            carouselController: carouselCtrl,
            banners: banners,
            currentCarousel: currentCarousel,
          ),
          CategoryChip(
            categories: CategoryData.categories,
            onSelected: (category) => selectedCategory(category),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Trending",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "View All",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          ProductGridView(
            controller: ScrollController(),
            productData: ProductData.products
                .where(
                  (element) => element.productCategoryId
                      .contains(CategoryData.getSelectedCategory().categoryId),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CategoryData {
  static List<Category> categories = [
    Category(categoryId: 0, categoryName: "Popular", isSelected: true),
    Category(categoryId: 1, categoryName: "Clothing"),
    Category(categoryId: 2, categoryName: "Shoes"),
    Category(categoryId: 3, categoryName: "Accessories"),
    Category(categoryId: 4, categoryName: "Electronics"),
    Category(categoryId: 5, categoryName: "Home & Kitchen"),
    Category(categoryId: 6, categoryName: "Beauty & Personal Care"),
  ];

  static Category getSelectedCategory() {
    return categories.firstWhere((element) => element.isSelected);
  }

  static void setIsSelected(int categoryId) {
    for (var category in categories) {
      category.isSelected = category.categoryId == categoryId;
    }
  }
}

class CategoryChip extends StatefulWidget {
  final List<Category> categories;
  final void Function(Category) onSelected;

  const CategoryChip({
    Key? key,
    required this.categories,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<CategoryChip> createState() => CategoryChipState();
}

class CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: widget.categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: ChoiceChip(
              avatar: null,
              label: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(category.categoryName),
              ),
              selected: category.isSelected,
              onSelected: (isSelected) {
                widget.onSelected(category);
              },
              selectedColor: kPrimaryColor,
              labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: category.isSelected ? Colors.white : kBlackColor,
                  ),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: category.isSelected ? kPrimaryColor : kBlackColor,
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Icon(Icons.search),
              SizedBox(width: 6.0),
              Text(
                "Enter Term...",
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
