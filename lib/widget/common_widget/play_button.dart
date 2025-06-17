import '../../core/utils/exports.dart';
import 'custom_button.dart';

class PlayButton extends StatelessWidget {
  final String title;
  void Function()? onTap;
  PlayButton({super.key, required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onTap,
      text: title,
      height: 0.060.sh,
      width: 0.75.sw,
      leftIcon: Icon(Icons.play_arrow_outlined,color: Colors.black,size: 25,),
      buttonTextStyle: MyAppThemeHelper.darkTheme.textTheme.displayLarge,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}