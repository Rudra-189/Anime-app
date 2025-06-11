import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/constants/app_constants.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';
import 'package:project2/viewmodel/hoem_bloc/home_bloc.dart';
import 'package:project2/viewmodel/hoem_bloc/home_event.dart';
import 'package:project2/viewmodel/hoem_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if(state.homeStatus == status.init){
            context.read<HomeBloc>().add(loadHomePageData());
          }
          if(state.homeStatus == status.loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state.homeStatus == status.success){
            final data = state.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.black,
                  expandedHeight:600.h,
                  actions: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppConstants.searchRoute);
                    }, icon: Icon(Icons.search,color: Colors.orange,size: 22.sp,))
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildCarouselSlider(context,data),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        _buildTextAndSeeMore("Most Popular"),
                        SizedBox(height: 10.h,),
                        _buildListView(data),
                        SizedBox(height: 20.h,),
                        _buildTextAndSeeMore("Popular Near You"),
                        _buildGridView(data)
                      ],
                    ),
                  ),
                )
              ],
            );
          }else if(state.homeStatus == status.failure){
            return Center(child: Text(state.errorMessage),);
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}


Widget _buildCarouselSlider(BuildContext context,List<Anime> data){
  return CarouselSlider(
      items: data.map((e)=> InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(AppConstants.detailRoute,arguments: e.malId);
        },
        child: Stack(
          children: [
            Container(
              height: 600.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(e.images.jpg.largeImageUrl.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 600.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.75),
                    Colors.black
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title,style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500,letterSpacing: 1)),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
                        alignment: Alignment.center,
                        child: Text(e.type.toString(),style: TextStyle(fontSize: 10.sp,color: Colors.orange),),
                      ),
                      SizedBox(width: 5.w,),
                      Text(" Dub | Sub ",style: TextStyle(color: Colors.white.withOpacity(0.75),fontSize: 13.sp),),
                      SizedBox(width: 5.w,),
                      Text(e.source.toString()+"   "+e.status.toString(),style: TextStyle(color: Colors.white.withOpacity(0.75),fontSize: 13.sp),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text(e.synopsis.toString(),style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 12.sp),maxLines: 3,),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 50.h,
                          width: 290.w,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.r)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow_outlined,color: Colors.black,size: 30.sp,),
                              Text("START WATCHING",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            ],
                          )
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.orange,width: 3.w),
                            bottom: BorderSide(color: Colors.orange,width: 3.w),
                            left: BorderSide(color: Colors.orange,width: 3.w),
                            right: BorderSide(color: Colors.orange,width: 3.w),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.bookmark_outline,color: Colors.orange,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )).toList(),
      options: CarouselOptions(
        height: 600.h,
        aspectRatio: 16/9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      )
  );
}

Widget _buildListView(List<Anime> listData){
  return SizedBox(
    height: 250.h,
    child: ListView.builder(itemBuilder: (context,index){
      final data = listData[index];
      return InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(AppConstants.detailRoute,arguments: data.malId);
        },
        child: Container(
          height: 250.h,
          width: 150.w,
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Container(
                height: 200.h,
                width: 145.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(data.images.jpg.largeImageUrl.toString()),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Text(data.title,style: TextStyle(color: Colors.white,fontSize: 12.sp,overflow: TextOverflow.ellipsis),),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
                    alignment: Alignment.center,
                    child: Text(data.type.toString(),style: TextStyle(color: Colors.orange,fontSize: 10.sp),),
                  ),
                  SizedBox(width: 5.w,),
                  Text("Dub | Sub",style: TextStyle(color: Colors.white.withOpacity(0.75),fontSize: 12.sp),)
                ],
              )
            ],
          ),
        ),
      );
    },
      itemCount: listData.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget _buildGridView(List<Anime> gridData){
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 0,
      mainAxisSpacing:0,
      childAspectRatio: 0.4 / 0.65, // Width / Height
    ),
    itemCount: gridData.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),// Total items
    itemBuilder: (context, index) {
      final data = gridData[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap:(){
              Navigator.of(context).pushNamed(AppConstants.detailRoute,arguments: data.malId);
            },
            child: SizedBox(
              height: 275.h,
              width: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 225.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data.images.jpg.largeImageUrl.toString()),
                            fit: BoxFit.cover
                        ),
                        border: Border(
                            top: BorderSide(color: Colors.orange,width: 2.5.w),
                            bottom: BorderSide(color: Colors.orange,width: 2.5.w),
                            left: BorderSide(color: Colors.orange,width: 2.5.w),
                            right: BorderSide(color: Colors.orange,width: 2.5.w)
                        )
                    ),
                  ),
                  Text(data.title,style: TextStyle(color: Colors.white,fontSize: 14,overflow: TextOverflow.ellipsis),),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
                        alignment: Alignment.center,
                        child: Text(data.type.toString(),style: TextStyle(color: Colors.orange,fontSize: 10.sp),),
                      ),
                      SizedBox(width: 5.w,),
                      Text("Dub | Sub",style: TextStyle(color: Colors.white.withOpacity(0.75),fontSize: 12.sp),)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    },

  );
}

Widget _buildTextAndSeeMore(String title){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w500),),
      Text("See more",style: TextStyle(color: Colors.orange,fontSize: 14.sp),),
    ],
  );
}