import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project2/core/constants/app_constants.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/splash_bloc/splash_bloc.dart';
import 'package:project2/viewmodel/splash_bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc,SplashState>(
        listener: (context,state){
          if(state.splashStatus == status.success){
            Navigator.of(context).pushNamed(AppConstants.homeRoute);
          }
        },
        builder: (context,state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSvgLogo(),
                _buildAppName()
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _buildSvgLogo(){
  return SvgPicture.asset("assets/images/svgs/icons/ic_logo.svg",color: Colors.blueAccent,);
}

Widget _buildAppName(){
  return Text("Anime World",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 1),);
}
