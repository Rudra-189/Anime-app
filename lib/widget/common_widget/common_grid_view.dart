import 'package:project2/widget/common_widget/image_view.dart';
import 'package:project2/widget/common_widget/type_button.dart';

import '../../core/generated/l10n.dart';
import '../../core/utils/exports.dart';
import '../../model/animeDataModel.dart';

class CommonGridView extends StatelessWidget {
  final List<Anime> gridData;
 final ScrollPhysics? physics;
  const CommonGridView({super.key, required this.gridData,this.physics});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 0,
        mainAxisSpacing:0,
        childAspectRatio: 0.44 / 0.67, //
        // Width / Height
      ),
      itemCount: gridData.length,
      shrinkWrap: true,
      physics:physics?? NeverScrollableScrollPhysics(),// Total items
      itemBuilder: (context, index) {
        final data = gridData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap:(){
                Navigator.of(context).pushNamed(AppRouter.detailRoute,arguments: data.malId);
              },
              child: SizedBox(
                height: 285.h,
                width: 175.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 225.h,
                      width: 175.w,
                      decoration: BoxDecoration(
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
                      child: CustomImageView(imagePath: data.images.jpg.largeImageUrl.toString(),fit: BoxFit.cover,radius: BorderRadius.circular(10),fadeInDuration: Duration(microseconds: 300),),
                    ),
                    Text(data.title,style: TextStyle(color: Colors.white,fontSize: 14,overflow: TextOverflow.ellipsis),maxLines: 2,),
                    Row(
                      children: [
                        TypeButton(type: data.type.toString(),color: Colors.orange),
                        SizedBox(width: 5.w,),
                        TypeButton(type: data.source.toString(),color: Colors.orange),
                        SizedBox(width: 5.w,),
                        Text(Lang.of(context).lbl_dub_sub,style: TextStyle(color: Colors.white.withOpacity(0.75),fontSize: 12.sp),)
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
}
