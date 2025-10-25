import 'package:ecommerce_app/model/app_data.dart';
import 'package:ecommerce_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int selectedSize = 7;
  int selectedColor = 0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 30,
            offset: Offset(2, 2),
            spreadRadius: 30,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nike Court Vision Low",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 2),

                      Text(
                        "240",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star_border, color: Colors.amber, size: 18),
                    ],
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 6),

          Text(
            "Available Sizes",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...AppData.sizes.map((size) {
                bool isSelected = selectedSize == size;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedSize = size);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.orangeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.orangeColor
                            : AppColors.lightGrey,
                      ),
                    ),
                    child: Text(
                      "US $size",
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),

          SizedBox(height: 20),

          Text(
            "Color",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10),

          Row(
            children: [
              ...List.generate(AppData.colors.length, (index) {
                bool isSelected = selectedColor == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppData.colors[index].withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: AppData.colors[index].withOpacity(0.06),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppData.colors[index],
                      radius: 12,
                      child: isSelected
                          ? Icon(
                              Icons.check_outlined,
                              color: Colors.white,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            )
                          : null,
                    ),
                  ),
                );
              }),
            ],
          ),

          SizedBox(height: 20),

          Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),

          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Text(
              AppData.description,
              textAlign: TextAlign.justify,
              maxLines: isExpanded ? null : 3,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Show less" : "Show more",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.orangeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
