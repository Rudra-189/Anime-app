import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_view.dart';

AppBar commonAppBar(BuildContext context){
  return  AppBar(
    leading: IconButton(onPressed: (){
      Navigator.of(context).pop();
    },icon: Icon(Icons.arrow_back_ios,color: Colors.orange,size: 20.sp,)),
    backgroundColor: Colors.black,
    title: CustomImageView(imagePath: "assets/app_icon.png",height: 75.h,),
    centerTitle: true,
  );
}