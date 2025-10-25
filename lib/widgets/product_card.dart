import 'package:ecommerce_app/model/app_data.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme/app_color.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final PageController _controller = PageController(viewportFraction: 0.65);
  double currentPage = 0.0;

  List<bool> isFavourite = [];

  @override
  void initState() {
    super.initState();
    isFavourite = List.generate(AppData.productList.length, (index) => false);

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemCount: AppData.productList.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final scale = (index == currentPage.floor())
              ? 1 - (currentPage - index) * 0.1
              : (index == currentPage.floor() + 1)
              ? 0.9 + (currentPage - index + 1) * 0.1
              : 0.9;

          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavourite[index] = !isFavourite[index];
                          });
                        },
                        child: Icon(
                          isFavourite[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavourite[index] ? Colors.red : Colors.grey,
                          size: 26,
                        ),
                      ),
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.orangeColor.withAlpha(40),
                        ),
                        Transform.rotate(
                          angle: -0.4,
                          child: Image.asset(
                            AppData.productList[index]['image'],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppData.productList[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        fontFamily: "Poppins",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4),

                    Text(
                      AppData.productList[index]['category'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.orangeColor,
                        fontFamily: "Poppins",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4),

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
                          AppData.productList[index]['price'].toStringAsFixed(
                            2,
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
