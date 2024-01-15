import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/movies_model_class.dart';
import '../theme&utilities/pallets.dart';
import '../theme&utilities/style_constants.dart';

class FavouriteItemWidget extends StatelessWidget {
  final Movie movie;

  const FavouriteItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Card(
        color: Pallete.greySoft,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Pallete.greySoft),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(movie.posterUrl,
                    height: 280.h, width: 360.w, fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  children: [
                    FittedBox(
                        child: Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: miniTitle,
                    )),
                    5.verticalSpace,
                    FittedBox(
                        child: Text(
                      movie.releaseDate,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: miniTitle,
                    )),
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
