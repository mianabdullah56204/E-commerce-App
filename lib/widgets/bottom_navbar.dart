import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:ecommerce_app/screens/favourite_page.dart';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:ecommerce_app/screens/search_page.dart';
import 'package:ecommerce_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required int selectedIndex,
    // required onItemTapped,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.storefront,
    Icons.search,
    Icons.shopping_basket_outlined,
    Icons.favorite_border,
  ];

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CartPage(),
    FavouritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withAlpha(50),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: List.generate(icons.length, (index) {
            final bool isSelected = selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  transform: Matrix4.translationValues(
                    0,
                    isSelected ? -25 : 0, // ✅ lift up on select
                    0,
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.orangeColor.withOpacity(0.9)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.orangeColor.withOpacity(0.6),
                              blurRadius: 8, // ✅ Always positive
                              offset: Offset(0, 3),
                            ),
                          ]
                        : [],
                  ),
                  child: Icon(
                    icons[index],
                    size: isSelected ? 28 : 24,
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.iconColor.withOpacity(0.8),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
