import 'package:ecommerce_app/components/icon_box.dart';
import 'package:ecommerce_app/screens/product_detail_page.dart';
import 'package:ecommerce_app/widgets/category_list.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBox(icon: Icons.menu, color: Colors.black),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        "assets/user.png",
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.subTitleTextColor,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      "Products",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.titleTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          cursorColor: AppColors.prefixIconColor,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                          decoration: InputDecoration(
                            hintText: "Search Products",
                            hintStyle: TextStyle(
                              color: AppColors.iconColor,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins",
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: AppColors.prefixIconColor,
                              size: 30,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    IconBox(icon: Icons.tune_rounded, color: Colors.black),
                  ],
                ),

                SizedBox(height: 30),

                CategoryList(),

                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(),
                      ),
                    );
                  },
                  child: ProductCard(),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
