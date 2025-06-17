import 'package:project2/core/themes/theme_helper.dart';

import '../../core/utils/exports.dart';

class TypeButton extends StatelessWidget {
  final String type;
  final Color color;
  const TypeButton({super.key, required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1)
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
      alignment: Alignment.center,
      child: Text(type,style: MyAppThemeHelper.darkTheme.textTheme.displaySmall),
    );
  }
}
