import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_app_bar.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_assignment/features/home/presentation/widgets/build_bottom_sheet.dart';
import 'package:flutter_assignment/features/home/presentation/widgets/products_section.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        bgColor: Theme.of(context).cardColor,
        isBackButtonExist: false,
        title: AppConstants.productList,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            child: Image.asset(Images.search,scale: 3,color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.8),),),
            ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody(){
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state){
          if(state is ProductsLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductsLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(Dimensions.radiusSmall),
                            topStart: Radius.circular(Dimensions.radiusSmall),
                          ),
                        ),
                        builder: (context) => BuildBottomSheet(
                          selectedCriteria: state.criteria!,
                        ),
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
                        boxShadow: [BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.10),
                          )],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(Images.filter, scale: 3,),
                                const SizedBox(width: Dimensions.paddingSizeSmall),
                                Text(AppConstants.filter,style: robotoRegular.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: Theme.of(context).primaryColorLight,
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(AppConstants.sortBy,style: robotoRegular.copyWith(
                                      fontSize: Dimensions.fontSizeDefault,
                                      color: Theme.of(context).primaryColorLight,
                                    ),),
                                    const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                                    RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Theme.of(context).primaryColorLight,
                                        )),
                                  ],
                                ),

                                const SizedBox(width: Dimensions.paddingSizeLarge,),
                                Image.asset(Images.menu, scale: 3,),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: ProductSection(
                  isScrollable: true,
                  products: state.products,)),
              ],
            );
          }
          return const SizedBox();
        });
  }
}
