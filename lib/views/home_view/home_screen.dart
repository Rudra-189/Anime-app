import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/hoem_bloc/home_bloc.dart';
import 'package:project2/viewmodel/hoem_bloc/home_event.dart';
import 'package:project2/viewmodel/hoem_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if(state.homeStatus == stateus.init){
            context.read<HomeBloc>().add(loadHomePageData());
          }
          if(state.homeStatus == stateus.loading){
            return Center(child: CircularProgressIndicator());
          }else if(state.homeStatus == stateus.success){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,         // 2 items per row
                          crossAxisSpacing: 10,      // spacing between columns
                          mainAxisSpacing: 10,       // spacing between rows
                          childAspectRatio: 0.55,    // width / height ratio (0.75 = taller items)
                        ),
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          final anime = state.data[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(11)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 225,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(anime.images.jpg..toString()),
                                      fit: BoxFit.fitHeight
                                    )
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                  )
                ],
              ),
            );
          }else if(state.homeStatus == stateus.failure){
            return Center(child: Text(state.errorMessage),);
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
