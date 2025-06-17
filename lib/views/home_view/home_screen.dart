import 'package:project2/core/utils/exports.dart';
import 'package:project2/model/animeDataModel.dart';
import 'package:project2/widget/common_widget/app_shimmer.dart';

import '../../core/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state.homeStatus == status.init){
            context.read<HomeBloc>().add(LoadHomePageDataEvent());
          }
          if (state.homeStatus == status.loading) {
            return AppShimmer.buildShimmerLoading(context); // Replace CircularProgressIndicator
          } else if (state.homeStatus == status.success) {
            final data = state.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.black,
                  elevation: 10,
                  expandedHeight: 600.h,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.searchRoute);
                        },
                        icon: Icon(
                          Icons.search,
                          color:
                              MyAppThemeHelper.darkTheme.secondaryHeaderColor,
                          size: 22.sp,
                        )),
                    SizedBox(
                      width: 5.w,
                    )
                  ],
                  pinned: true,
                  title: CustomImageView(imagePath: "assets/app_icon.png",height: 75),
                  flexibleSpace: FlexibleSpaceBar(
                    background: _buildCarouselSlider(context, data),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildTextAndSeeMore(context,Lang.of(context).lbl_manga_for_you),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildListView(state.mangaData),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildTextAndSeeMore(context,Lang.of(context).lbl_original_for_you),
                    CommonGridView(gridData: state.originalData)
                  ],
                ))
              ],
            );
          }else{
            return Center(
              child: Text(state.errorMessage),
            );
          }
        },
      ),
    );
  }
}

Widget _buildCarouselSlider(BuildContext context, List<Anime> data) {
  return CarouselSlider(
      items: data
          .map((e) => Stack(
            children: [
              SizedBox(
                height: 600.h,
                child: CustomImageView(imagePath: e.images.jpg.largeImageUrl.toString(),fit: BoxFit.cover,),
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
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title,
                        style: MyAppThemeHelper
                            .darkTheme.textTheme.titleLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        TypeButton(
                            type: e.type.toString(),
                            color: Colors.orange),
                        SizedBox(
                          width: 5.w,
                        ),
                        TypeButton(
                            type: e.source.toString(),

                            color: Colors.orange),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          Lang.of(context).lbl_dub_sub,
                          style: MyAppThemeHelper
                              .darkTheme.textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(e.status.toString(),
                            style: MyAppThemeHelper
                                .darkTheme.textTheme.titleMedium),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      e.synopsis.toString(),
                      style: MyAppThemeHelper
                          .darkTheme.textTheme.titleSmall,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlayButton(title: Lang.of(context).lbl_start_watching,onTap: ()
                          {  Navigator.of(context)
                              .pushNamed(AppRouter.detailRoute, arguments: e.malId);},),
                        SizedBox(
                          width: 20.w,
                        ),
                        BookmarkButton(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ))
          .toList(),
      options: CarouselOptions(
        height: 600.h,
        aspectRatio: 16 / 9,
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
      ));
}

Widget _buildListView(List<Anime> listData) {
  return SizedBox(
    height: 250.h,
    child: ListView.builder(
      itemBuilder: (context, index) {
        final data = listData[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.detailRoute, arguments: data.malId);
          },
          child: Container(
            height: 250.h,
            width: 150.w,
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200.h,
                  width: 145.w,
                  child: CustomImageView(imagePath: data.images.jpg.largeImageUrl.toString(),fit: BoxFit.cover,radius: BorderRadius.circular(10),),
                ),
                Text(
                  data.title,
                  style: MyAppThemeHelper.darkTheme.textTheme.bodyMedium,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    TypeButton(
                        type: data.type.toString(),

                        color: Colors.orange),
                    SizedBox(
                      width: 5.w,
                    ),
                    TypeButton(
                        type: data.source.toString(),

                        color: Colors.orange),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: Text(
                      Lang.of(context).lbl_dub_sub,
                      style: MyAppThemeHelper.darkTheme.textTheme.bodySmall!
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ))
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

Widget _buildTextAndSeeMore(BuildContext context,String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: MyAppThemeHelper.darkTheme.textTheme.titleLarge),
        Text(Lang.of(context).lbl_see_more,
            style: MyAppThemeHelper.darkTheme.textTheme.displayMedium),
      ],
    ),
  );
}
