import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_image.dart';
import 'package:flutter_assignment/core/widgets/rating_bar.dart';
import 'package:flutter_assignment/core/widgets/ripple_button.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/styles.dart';


class ProductWidget extends StatelessWidget {
  final Product? product;
  const ProductWidget({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color:  Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              boxShadow: [BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 6,
                color: Colors.black.withOpacity(0.10),
              )]
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft:Radius.circular(Dimensions.radiusDefault),
                          topRight:Radius.circular(Dimensions.radiusDefault),
                      ),
                      child: CustomImage(
                        image: product!.images!.elementAt(0).src!,
                        fit: BoxFit.fill,
                        height: 177,
                      ),
                    ),
                    const SizedBox(height:Dimensions.paddingSizeSmall),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:Dimensions.paddingSizeLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          product!.name??'',
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                          maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start),
                      Row(
                        children: [
                          Text("\$${product!.price!}",
                            style: robotoRegular.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Theme.of(context).primaryColorLight,
                              color: Theme.of(context).primaryColorLight,
                                fontSize: Dimensions.fontSizeDefault+1),
                          ),
                          const SizedBox(width: Dimensions.paddingSizeSmall,),
                          Text("\$${product!.salePrice!.isEmpty ?  product!.regularPrice: product!.salePrice!}",
                            style: robotoBold.copyWith(
                                fontSize: Dimensions.fontSizeLarge + 2, ),
                          ),
                        ],
                      ),
                      const SizedBox(height:Dimensions.paddingSizeExtraSmall),

                      RatingBar(rating: product!.ratingCount!.toDouble(), size: 13, ratingCount: 5000),
                    ],
                  ),
                ),
                const SizedBox(height:Dimensions.paddingSizeSmall),

              ]),),
        Positioned.fill(
          child: RippleButton(
            onTap:() {

            }
          ),),
      ],);
  }
}
