import 'package:ecommerce_app/model/app_data.dart';
import 'package:ecommerce_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class ThumbnailList extends StatefulWidget {
  const ThumbnailList({super.key});

  @override
  State<ThumbnailList> createState() => _ThumbnailListState();
}

class _ThumbnailListState extends State<ThumbnailList> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                child: Text(
                  "AIR",
                  style: TextStyle(
                    color: AppColors.lightGrey.withOpacity(0.3),
                    fontSize: 160,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Positioned(
                top: 20,
                child: AnimatedContainer(
                  height: 240,
                  width: 280,
                  duration: Duration(milliseconds: 400),
                  child: Image.asset(
                    AppData.showThumbnailList[selectedImage],
                    key: ValueKey<int>(selectedImage),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 25),

        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: AppData.showThumbnailList.length,
              padding: EdgeInsets.only(left: 10),
              itemBuilder: (context, index) {
                bool isActive = selectedImage == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isActive
                            ? AppColors.orangeColor
                            : AppColors.lightGrey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      AppData.showThumbnailList[index],
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
