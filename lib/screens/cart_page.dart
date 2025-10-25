import 'package:ecommerce_app/components/icon_box.dart';
import 'package:ecommerce_app/model/app_data.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice => AppData.cartItems.fold(
    0,
    (sum, item) => sum + (item['price'] * item['qty']),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: IconBox(
                  //     icon: Icons.arrow_back,
                  //     color: AppColors.blackColor,
                  //   ),
                  // ),
                  IconBox(icon: Icons.menu, color: AppColors.blackColor),

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

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shopping",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.subTitleTextColor,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.titleTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon:
                  Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.orangeColor,
                    size: 34,
                  ),
                  // ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: AppData.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = AppData.cartItems[index];
                    return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),

                        leading: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            Positioned(
                              top: -22,
                              left: 6,
                              child: Transform.rotate(
                                angle: -0.4,
                                child: Image.asset(
                                  item['image'],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // 📄 Product Info
                        title: Padding(
                          padding: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Text(
                                  item['price'].toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 🔢 Quantity Container
                        trailing: Container(
                          height: 35,
                          width: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            "x${item['qty']}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 🔹 Total & Button Section
              Padding(
                padding: EdgeInsets.only(top: 1),
                child: Column(
                  children: [
                    Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppData.cartItems.length} Items",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),

                    // Next Button
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 26),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
