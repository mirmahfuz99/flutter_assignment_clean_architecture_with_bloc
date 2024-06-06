import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/styles.dart';

class CustomCheckBox extends StatelessWidget {
  final String? title;
  final bool? value;
  final Function()? onClick;
  const CustomCheckBox({super.key, @required this.title, @required this.value, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: value,

            onChanged: (bool? isActive) => onClick!(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Theme.of(context).primaryColor.withOpacity(.8),
            side: BorderSide(width: 1,color: Theme.of(context).primaryColor.withOpacity(.8),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall), side: BorderSide.none),
          ),
        ),
        Text(title!, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
      ]),
    );
  }
}
