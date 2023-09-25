import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/model/sizes_model.dart';
import 'package:flutter/material.dart';

class SizeContainer extends StatefulWidget {
  const SizeContainer({
    super.key,
  });

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: SizeData.sizeData.map((size) {
          return ChoiceChip(
            label: Text(size.indicator),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 4.0,
            ),
            selected: size.isSelected,
            onSelected: (value) {
              setState(() {
                SizeData.setIsSelected(size.indicator);
              });
            },
            selectedColor: kPrimaryColor,
            backgroundColor: kGreyColor,
            labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: size.isSelected ? Colors.white : kBlackColor,
                ),
          );
        }).toList(),
      ),
    );
  }
}

class SizeData {
  static List<SizeModel> sizeData = [
    SizeModel(
      indicator: "S",
      sizeName: "Small",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "M",
      sizeName: "Medium",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "L",
      sizeName: "Large",
      isAvailable: true,
    ),
    SizeModel(
      indicator: "XL",
      sizeName: "Extra Large",
      isAvailable: true,
    ),
  ];

  static void setIsSelected(String sizeIndicator) {
    for (var size in sizeData) {
      size.isSelected = size.indicator == sizeIndicator;
    }
  }
}
