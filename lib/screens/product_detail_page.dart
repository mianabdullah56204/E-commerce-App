import 'package:ecommerce_app/components/icon_box.dart';
import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:ecommerce_app/theme/app_color.dart';
import 'package:ecommerce_app/widgets/product_info.dart';
import 'package:ecommerce_app/widgets/thumbnail_list.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.orangeColor,
        child: Icon(Icons.shopping_basket, size: 26, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.iconColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(10),
                              blurRadius: 30,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),

                    IconBox(icon: Icons.favorite, color: Colors.red),
                  ],
                ),
              ),

              ThumbnailList(),

              SizedBox(height: 20),

              ProductInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
