import '../../core/utils/exports.dart';

class DetailsButton extends StatelessWidget {
  final String type;
  final String message;
  const DetailsButton({super.key,  required this.type,required this.message,});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1)
          ),
          child: Text(message,style: TextStyle(color: Colors.white,fontSize: 10.sp),),
        ),
        Text(type,style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 1),)
      ],
    );
  }
}
