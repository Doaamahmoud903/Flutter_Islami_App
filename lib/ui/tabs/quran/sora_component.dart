import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class SoraComponent extends StatefulWidget {
  const SoraComponent({super.key, required this.soraNameEn, required this.soraNameAr, required this.soraNums});
  final String soraNameEn ;
  final String soraNameAr ;
  final String soraNums;

  @override
  State<SoraComponent> createState() => _SoraComponentState();
}

class _SoraComponentState extends State<SoraComponent> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(
              vertical: width*0.02 ,
              horizontal: height*0.02
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.soraNameEn , style:Theme.of(context).textTheme.bodyLarge ),
                  Text(widget.soraNameAr , style:Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 15,),
                  Text(widget.soraNums , style:Theme.of(context).textTheme.bodyMedium)
                ],
              ),
              Column(
                children: [
                  Image.asset(AppAssets.soraIcon,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
