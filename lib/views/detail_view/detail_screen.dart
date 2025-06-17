import 'package:project2/core/themes/theme_helper.dart';
import 'package:project2/core/utils/exports.dart';
import 'package:project2/widget/common_widget/bookmark_button.dart';
import 'package:project2/widget/common_widget/common_app_bar.dart';
import 'package:project2/widget/common_widget/details_button.dart';
import 'package:project2/widget/common_widget/image_view.dart';
import 'package:project2/widget/common_widget/play_button.dart';

import '../../core/generated/l10n.dart';
import '../../model/animeDataModel.dart';
import '../../widget/common_widget/type_button.dart';


class DetailScreen extends StatelessWidget {
  final int id;

  DetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: commonAppBar(context),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if(state.detailPageStatus == status.init){
            context.read<DetailBloc>().add(LoadAnimeDetailEvent(id));
          }
          if (state.detailPageStatus == status.loading) {
            return Center(child: CircularProgressIndicator(),);
          } else if (state.detailPageStatus == status.success) {
            final data = state.data;
            return _buildDetailDesign(context,data!);
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

Widget _buildDetailDesign(BuildContext context,Anime data){
  return Stack(
    children: [
      SizedBox(
        height: 600.sh,
        width: double.infinity,
        child: CustomImageView(imagePath: data.images.jpg.largeImageUrl.toString(),fit: BoxFit.cover,)
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.55.sh), // Start content mid-image
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.15),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.75),
                        Colors.black.withOpacity(0.90),
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
                      TypeButton(type: data.type.toString(),color: Colors.orange),
                      SizedBox(width: 6.w),
                      TypeButton(type: data.source.toString(),color: Colors.orange),
                      SizedBox(width: 6.w),
                      Text(
                        "${Lang.of(context).lbl_dub_sub}  ${data.status}",
                        style: MyAppThemeHelper.darkTheme.textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "${Lang.of(context).lbl_duration} : ${data.duration}",
                    style: MyAppThemeHelper.darkTheme.textTheme.titleSmall,
                  )
                  // For scroll testing
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0.h, 0.h),
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
                            Text(Lang.of(context).lbl_my_list,style:MyAppThemeHelper.darkTheme.textTheme.displaySmall,)
                          ],
                        ),
                        SizedBox(width: 30.w,),
                        Column(
                          children: [
                            Icon(Icons.share_outlined,size: 20.sp,color: Colors.orange,),
                            Text(Lang.of(context).lbl_share,style:MyAppThemeHelper.darkTheme.textTheme.displaySmall,)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30 .h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsButton(type: Lang.of(context).lbl_rank, message: data.rank.toString()),
                        DetailsButton(type: Lang.of(context).lbl_popularity, message: data.popularity.toString()),
                        DetailsButton(type: Lang.of(context).lbl_members, message: data.members.toString()),
                        DetailsButton(type: Lang.of(context).lbl_favorites, message: data.favorites.toString()),
                      ],
                    ),
                    SizedBox(height: 30 .h),
                    Text("Show ${data.type} info : ",style: MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(fontSize: 16,fontWeight: FontWeight.w600,letterSpacing: 1)),
                    SizedBox(height: 10 .h),
                    Text("${Lang.of(context).lbl_type} : ${data.type}",style:  MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(fontSize: 12,letterSpacing: 1)),
                    Text("${Lang.of(context).lbl_source} : ${data.score}",style:  MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(fontSize: 12,letterSpacing: 1)),
                    Text("${Lang.of(context).lbl_status} : ${data.status}",style:  MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(fontSize: 12,letterSpacing: 1)),
                    SizedBox(height: 10.h),
                    Text("${Lang.of(context).lbl_youtube_link} : ",style:  MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(color:Colors.orange,fontSize: 14,letterSpacing: 1,fontWeight: FontWeight.w600)),
                    SizedBox(height: 10.h),
                    data.trailer!.url != 'no url' ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data.trailer!.images!.largeImageUrl != 'no image' ? GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRouter.wabViewRoute,arguments: data.trailer?.url);
                            },
                            child: SizedBox(
                              height: 175.h,
                              width: 325.w,
                              child: CustomImageView(imagePath: data.trailer?.images?.largeImageUrl.toString(),fit: BoxFit.cover,),
                            )
                        ) : GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRouter.wabViewRoute,arguments: data.trailer?.url);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_circle,size: 30.sp,color: Colors.orange,),
                                Text("Play Trailer",style: MyAppThemeHelper.darkTheme.textTheme.titleSmall)
                              ],
                            )
                        )
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No link",style: MyAppThemeHelper.darkTheme.textTheme.titleSmall!.copyWith(color: Colors.white))
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Lang.of(context).lbl_show_synopsis_plot,style: MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(color:Colors.orange,fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      data.synopsis.toString(),
                      style: MyAppThemeHelper.darkTheme.textTheme.labelLarge!.copyWith(color:Colors.white,fontSize: 12),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlayButton(title: Lang.of(context).lbl_start_watching_e1),
                        SizedBox(width: 20.w,),
                        BookmarkButton(),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
