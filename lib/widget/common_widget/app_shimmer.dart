import '../../core/generated/l10n.dart';
import '../../core/utils/exports.dart';

class AppShimmer{
  static Widget buildTextAndSeeMore(BuildContext context,String title) {
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

  static Widget buildShimmerLoading(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Shimmer for SliverAppBar carousel
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          expandedHeight: 600.h,
          actions: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: Icon(Icons.search, color: Colors.orange, size: 22.sp),
            ),
            SizedBox(width: 5.w)
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                height: 600.h,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
                child: Stack(
                  children: [
                    // Background shimmer
                    Container(
                      height: 600.h,
                      color: Colors.grey[800],
                    ),
                    // Bottom content shimmer
                    Positioned(
                      bottom: 20.h,
                      left: 10.w,
                      right: 10.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title shimmer
                          Container(
                            height: 20.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Tags shimmer
                          Row(
                            children: [
                              Container(
                                height: 18.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 18.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          // Synopsis shimmer
                          Column(
                            children: List.generate(
                                3,
                                    (index) => Padding(
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Container(
                                    height: 12.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.circular(2.r),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(height: 20.h),
                          // Buttons shimmer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50.h,
                                width: 290.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              buildTextAndSeeMore(context,"Original Popular"),
              SizedBox(height: 10.h),
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 250.h,
                      width: 150.w,
                      margin: EdgeInsets.only(left: 10.w),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[600]!,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200.h,
                              width: 145.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              height: 12.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Container(
                                  height: 15.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Container(
                                  height: 15.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              buildTextAndSeeMore(context,"Manga You"),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.45 / 0.67,
                ),
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[600]!,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 225.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              height: 14.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              height: 14.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Container(
                                  height: 15.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Container(
                                  height: 15.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

