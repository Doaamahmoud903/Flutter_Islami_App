import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

class RadioComponent extends StatefulWidget {
  final String name;
 const RadioComponent({super.key , required this.name});

  @override
  State<RadioComponent> createState() => _RadioComponentState();
}

class _RadioComponentState extends State<RadioComponent> {
  bool isPlaying = false;
  bool isMuted = false;


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.only(top: screenHeight*0.04 , left: screenWidth*0.04 , right: screenWidth*0.04),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppAssets.mosqueBottom),
          Column(
            children: [
              Text(widget.name,
                style: AppStyles.fontBold16Black,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPlaying = !isPlaying; // Toggle play/pause state
                      });
                    },
                    child: Image.asset(
                      isPlaying ? AppAssets.pauseIcon : AppAssets.playIcon,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isMuted = !isMuted;
                      });
                    },
                      child: Image.asset(
                        isMuted
                          ?AppAssets.muteIcon:
                            AppAssets.volumnIcon,
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
