import 'package:delivery_ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:delivery_ecommerce/widgets/app_icon.dart';
import 'package:delivery_ecommerce/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;

  AccountWidget({
    super.key, 
    required this.appIcon, 
    required this.bigText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        top: Dimensions.width10,
        bottom: Dimensions.width10
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
          offset: const Offset(0,2),
          color: Colors.grey.withOpacity(0.2)
        )
      ]
    ),
    child: Row(
      children: [
        appIcon,
        SizedBox(width: Dimensions.width20),
        bigText
      ],
    ),
    
    );
  }
}
