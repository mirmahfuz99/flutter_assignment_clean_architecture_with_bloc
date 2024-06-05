import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/home/data/models/product.dart';
import 'package:flutter_assignment/features/home/presentation/widgets/product_widget.dart';
import 'package:flutter_assignment/utils/dimensions.dart';

class ProductSection extends StatelessWidget {
  final List<Product>? products;
  final EdgeInsetsGeometry? padding;
  final bool? isScrollable;
  final int? shimmerLength;
  final String? noDataText;
  final String? type;
  final Function(String type)? onVegFilterTap;

  const ProductSection(
      {super.key,
      required this.products,
      this.isScrollable = false,
      this.shimmerLength = 20,
      this.padding = const EdgeInsets.all(Dimensions.paddingSizeSmall),
      this.noDataText,
      this.type,
      this.onVegFilterTap});

  @override
  Widget build(BuildContext context) {
    bool isNull = true;
    int length = 0;

    isNull = products == null;
    if (!isNull) {
      length = products!.length;
    }

    return GridView.builder(
      key: UniqueKey(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Dimensions.paddingSizeDefault,
        mainAxisSpacing: Dimensions.paddingSizeDefault,
        childAspectRatio: .63,
        mainAxisExtent:280,
        crossAxisCount:2,
      ),
      physics: isScrollable! ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
      shrinkWrap: isScrollable! ? false : true,
      itemCount: products?.length,
      padding: padding,
      itemBuilder: (context, index) {
        return ProductWidget(product: products?.elementAt(index));
      },
    );
  }
}
