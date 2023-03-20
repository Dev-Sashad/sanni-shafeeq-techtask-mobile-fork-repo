import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/core/model/ingredients_model.dart';
import 'package:tech_task/utils/_utils.dart';
import 'package:tech_task/widgets/text_widget.dart';

class CustomIngredientsCard extends StatelessWidget {
  final IngredientModel data;
  final bool isSelected;
  final DateTime lunchDate;
  final VoidCallback? onTap;
  const CustomIngredientsCard({
    Key? key,
    required this.data,
    required this.lunchDate,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasExpired = hasExpire(
        initalDate: lunchDate, expiryDate: DateTime.parse(data.useBy!));
    return InkWell(
      onTap: hasExpired
          ? () {
              showErrorToast(
                  expriedMessage(data.title!, initalDate: lunchDate));
            }
          : onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
                color: hasExpired
                    ? Colors.red
                    : isSelected
                        ? AppColors.primaryColor
                        : AppColors.white,
                width: 1.5),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
        child: Flexible(
          child: CustomText(
            data.title!,
            textType: TextType.mediumText,
            color: hasExpired ? Colors.red : AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
