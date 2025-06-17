import 'package:project2/core/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<SplashBloc,SplashState>(
        listener: (context,state){
          if(state.splashStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.homeRoute,(Route<dynamic> route) => false,);
          }
        },
        builder: (context,state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSvgLogo(),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _buildSvgLogo(){
  return Container(
    height: 100.h,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.25),
          blurRadius: 1000,
          offset: Offset(4, 4),// horizontal & vertical offset
        ),
      ],
    ),
    child: CustomImageView(imagePath: 'assets/app_icon.png',fit: BoxFit.cover,)
  );
}

