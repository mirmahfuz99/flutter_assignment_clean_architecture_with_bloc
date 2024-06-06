import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/core/widgets/custom_check_box.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_event.dart';
import 'package:flutter_assignment/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomSheet extends StatefulWidget {
  final FilterCriteria selectedCriteria;


  const BuildBottomSheet({
    super.key,
    required this.selectedCriteria,
  });

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  FilterCriteria? _selectedCriteria;

  @override
  initState(){
    super.initState();
    _selectedCriteria = widget.selectedCriteria;

  }

  updateSelectedCriteria(FilterCriteria filterCriteria){
    setState(() {
      _selectedCriteria = filterCriteria;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state){

      return  SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: Dimensions.paddingSizeExtraLarge,
        ),
        child: Wrap(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 3,
                width: MediaQuery.of(context).size.width/5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,),
              child: Text(AppConstants.filter,style: robotoBold.copyWith(
                fontSize: Dimensions.fontSizeLarge,
              ),),
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                      key: const Key('light'),
                      title: 'Newest',
                      value: _selectedCriteria == FilterCriteria.newest,
                      onClick: () {
                        updateSelectedCriteria(FilterCriteria.newest);
                      },
                    ),
                    CustomCheckBox(
                      key: const Key('oldest'),
                      title: 'Oldest',
                      value: _selectedCriteria == FilterCriteria.oldest,
                      onClick: () {
                        updateSelectedCriteria(FilterCriteria.oldest);
                      },
                    ),
                    CustomCheckBox(
                      key: const Key('priceLow'),
                      title: 'Price low > High',
                      value: _selectedCriteria == FilterCriteria.priceLow,
                      onClick: () {
                        updateSelectedCriteria(FilterCriteria.priceLow);
                      },
                    ),
                    CustomCheckBox(
                      key: const Key('priceHigh'),
                      title: 'Price high > Low',
                      value: _selectedCriteria == FilterCriteria.priceHigh,
                      onClick: () {
                        updateSelectedCriteria(FilterCriteria.priceHigh);
                      },
                    ),
                    CustomCheckBox(
                      key: const Key('bestSelling'),
                      title: 'Best selling',
                      value: _selectedCriteria == FilterCriteria.bestSelling,
                      onClick: () {
                        updateSelectedCriteria(FilterCriteria.bestSelling);
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge + 30,),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius:  const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
                        border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
                      ),
                      child: Center(child: Text(AppConstants.cancel,style: robotoBold.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),)),
                    ),
                  ),
                  CustomButton(
                    height: 60,
                    backgroundColor: const Color(0xff1ABC9C),
                    width: MediaQuery.of(context).size.width / 2.3,
                    buttonText: AppConstants.apply,
                    onPressed: () {
                      context.read<ProductBloc>().add(UpdateFilterCriteria(_selectedCriteria!));
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),

          ],
        ),
      );
    });
  }
}

