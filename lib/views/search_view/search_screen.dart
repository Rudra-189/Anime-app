import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/detail_bloc/detail_bloc.dart';
import 'package:project2/viewmodel/detail_bloc/detail_state.dart';
import 'package:project2/viewmodel/search_bloc/search_bloc.dart';
import 'package:project2/viewmodel/search_bloc/search_event.dart';
import 'package:project2/viewmodel/search_bloc/search_state.dart';

import '../../core/constants/app_constants.dart';
import '../../model/animeDataModel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if(state.searchStatus == status.loading){
          return Center(child: CircularProgressIndicator(),);
        }else if(state.searchStatus == status.success){
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back, color: Colors.orange, size: 20,)),
              title: SearchBar(
                controller: state.searchController,
                hintText: 'Search',
                textStyle: WidgetStatePropertyAll(
                    TextStyle(color: Colors.white, fontSize: 15)),
                hintStyle: WidgetStatePropertyAll(
                    TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 15)),
                backgroundColor: WidgetStatePropertyAll(
                    Colors.white.withOpacity(0.2)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                )),
                leading: Icon(Icons.search, color: Colors.orange, size: 20,),
                onChanged: (value){
                  context.read<SearchBloc>().add(OnSearchTextChange(value));
                },
              ),
            ),
            body: BlocBuilder<SearchBloc,SearchState>(builder: (context,state){
              if(state.searchController!.text.isNotEmpty){
                final data = state.data;
                return Column(children: [_buildGridView(data)]);
              }else{
                final data = state.dataFiltered;
                return Column(children: [_buildGridView(data)]);
              }
            }),
          );
        }else if(state.searchStatus == status.failure){
          return Scaffold(body: Center(child: Text(state.data.toString()),),);
        }else{
          return const SizedBox();
        }
      },
);
  }
}

Widget _buildGridView(List<Anime> gridData){
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 0,
        mainAxisSpacing:0,
        childAspectRatio: 0.45 / 0.67, // Width / Height
      ),
      itemCount: gridData.length,
      shrinkWrap: true,
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
                width: 165.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 225.h,
                      width: 165.w,
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
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.orange.withOpacity(0.25),
                                offset: Offset(5, 5),
                                blurRadius: 5
                            )
                          ]
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

    ),
  );
}