import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/detail_bloc/detail_bloc.dart';
import 'package:project2/viewmodel/detail_bloc/detail_event.dart';
import 'package:project2/viewmodel/detail_bloc/detail_state.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  DetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    context.read<DetailBloc>().add(loadAnimeDetail(id));
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if(state.detailPageStatus == status.loading){
            return Center(child: CircularProgressIndicator(),);
          }else if(state.detailPageStatus == status.success){
            final data = state.data;
            return CustomScrollView(
              slivers: [
                // Top Image
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/sao_banner.jpg', // Replace with your asset
                      fit: BoxFit.cover,
                    ),
                    title: Text('Sword Art Online'),
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                  ),
                ),

                // Body content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tags and Rating
                        Text(
                          'Dub | Sub • Action, Adventure, Fantasy, Isekai, Sci-Fi',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.orange),
                            SizedBox(width: 4),
                            Text('4.7 (95.2K)'),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Icon(Icons.add, color: Colors.orange),
                                Text('My List'),
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.share, color: Colors.orange),
                                Text('Share'),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Description
                        const Text(
                          'In the near future, a Virtual Reality Massive Multiplayer Online Role-Playing Game (VRMMORPG)...',
                          style: TextStyle(fontSize: 14),
                        ),

                        const SizedBox(height: 20),
                        const Divider(),

                        // Tabs
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: const [
                              TabBar(
                                labelColor: Colors.orange,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: 'EPISODES'),
                                  Tab(text: 'FEATURED MUSIC'),
                                  Tab(text: 'MORE LIKE THIS'),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Season & Episodes Section
                        const Text('S2: Sword Art Online II',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),

                        const SizedBox(height: 20),

                        // Start Watching Button
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('START WATCHING S1 E1'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }else if(state.detailPageStatus == status.failure){
            return Center(child: Text(state.errorMessage),);
          }else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
