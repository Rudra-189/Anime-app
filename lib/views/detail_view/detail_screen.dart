import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/detail_bloc/detail_bloc.dart';
import 'package:project2/viewmodel/detail_bloc/detail_event.dart';
import 'package:project2/viewmodel/detail_bloc/detail_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatelessWidget {
  final int id;


  DetailScreen({super.key, required this.id});

  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DetailBloc>().add(loadAnimeDetail(id));
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.detailPageStatus == status.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.detailPageStatus == status.success) {
            final data = state.data;
            _controller = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(data!.trailer!.url ?? ''));
            return Stack(
              children: [
                SizedBox(
                  height: 600.sh,
                  width: double.infinity,
                  child: Image.network(
                    data!.images.jpg.largeImageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 0.55.sh), // Start content mid-image
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.25),
                              Colors.black.withOpacity(0.75),
                              Colors.black.withOpacity(0.95),
                              Colors.black.withOpacity(0.98),
                              Colors.black
                            ])),
                        alignment:
                            Alignment.bottomCenter, // Transparent background
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              data.title,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                      blurRadius: 4,
                                      color: Colors.white,
                                      offset: Offset(1, 1))
                                ],
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1)),
                                  child: Text(
                                    data.type.toString(),
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 10.sp),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.h),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1)),
                                  child: Text(
                                    data.source.toString(),
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 10.sp),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.h),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  "Dub | Sub  " + data.status.toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Duration : " + data.duration.toString(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 12),
                            )
                            // For scroll testing
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -1.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  colors: [Colors.black, Colors.black])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.add,size: 20.sp,color: Colors.orange,),
                                      Text("MY LIST",style:TextStyle(color: Colors.orange,fontSize: 10.sp,),)
                                    ],
                                  ),
                                  SizedBox(width: 30.w,),
                                  Column(
                                    children: [
                                      Icon(Icons.share_outlined,size: 20.sp,color: Colors.orange,),
                                      Text("SHARE",style:TextStyle(color: Colors.orange,fontSize: 10.sp,),)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30 .h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.1)
                                        ),
                                        child: Text(data.rank.toString(),style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                                      ),
                                      Text("RANK",style: TextStyle(color: Colors.white,fontSize: 12.sp,letterSpacing: 1),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.1)
                                        ),
                                        child: Text(data.popularity.toString(),style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                                      ),
                                      Text("POPULARITY",style: TextStyle(color: Colors.white,fontSize: 12,letterSpacing: 1),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.1)
                                        ),
                                        child: Text(data.members.toString(),style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                                      ),
                                      Text("MEMBERS",style: TextStyle(color: Colors.white,fontSize: 14.sp,letterSpacing: 1),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.1)
                                        ),
                                        child: Text(data.favorites.toString(),style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                                      ),
                                      Text("FAVORITES",style: TextStyle(color: Colors.white,fontSize: 14.sp,letterSpacing: 1),)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30 .h),
                              Text("Show" +data.type.toString()+ "info : ",style: TextStyle(color: Colors.white,fontSize: 15.sp,letterSpacing: 1,fontWeight: FontWeight.w600),),
                              SizedBox(height: 10 .h),
                              Text("Rank : "+data.rank.toString(),style: TextStyle(color: Colors.white,fontSize: 12),),
                              Text("Type : "+data.type.toString(),style: TextStyle(color: Colors.white,fontSize: 12),),
                              Text("Source : "+data.score.toString(),style: TextStyle(color: Colors.white,fontSize: 12),),
                              Text("status : "+data.status.toString(),style: TextStyle(color: Colors.white,fontSize: 12),),
                              SizedBox(height: 10.h),
                              Text("Youtube Link : ",style: TextStyle(color: Colors.orange,fontSize: 14.sp),),
                              GestureDetector(
                                onTap: (){
                                  launchUrl(Uri.parse(data.trailer!.url.toString()),mode: LaunchMode.externalApplication);
                                },
                                child: Text(" - "+data.trailer!.url.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 12.sp,overflow: TextOverflow.ellipsis),),
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("SHOW - SYNOPSIS/PLOT : ",style: TextStyle(color: Colors.orange,fontSize: 15.sp,letterSpacing: 1,fontWeight: FontWeight.w600),)
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                data.synopsis.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.75)
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 275.w,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.play_arrow_outlined,size: 25,color: Colors.black,),
                                        Text("START WATCHING E1",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,letterSpacing: 1),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.w,),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(color: Colors.orange,width: 2),
                                        bottom: BorderSide(color: Colors.orange,width: 2),
                                        left: BorderSide(color: Colors.orange,width: 2),
                                        right: BorderSide(color: Colors.orange,width: 2),
                                      )
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.bookmark_outline,size: 20,color: Colors.orange,),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              // For scroll testing
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.orange,size: 20.sp,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.detailPageStatus == status.failure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
