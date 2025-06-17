import 'package:project2/core/utils/exports.dart';


class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if(state.searchStatus == status.init){
          context.read<SearchBloc>().add(LoadSearchDataEvent());
        }
        if (state.searchStatus == status.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.searchStatus == status.success) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: commonAppBar(context),
            body:Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.75.sw,
                            height: 0.060.sh,
                            child: TextFormField(
                              controller: searchController,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.1),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.orange,
                                    size: 20.sp,
                                  )),
                              style: TextStyle(color: Colors.white),
                              onChanged: (value) {
                                context
                                    .read<SearchBloc>()
                                    .add(OnSearchTextChangeEvent(value));
                              },
                            ),
                          ),
                          Container(
                            height: 0.060.sh,
                            width:0.060.sh,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            alignment: Alignment.center,
                            child: PopupMenuButton(
                              icon: Icon(Icons.filter_alt_outlined),
                              iconColor: Colors.orange,
                              color: Colors.white,

                              itemBuilder: (context) =>[
                                PopupMenuItem(
                                  onTap: (){
                                    context.read<SearchBloc>().add(OnFilterChangeEvent(type: true, source: "TV"));
                                  },
                                  child: Center(child: Text("TV",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                                ),
                                PopupMenuItem(
                                  onTap: (){
                                    context.read<SearchBloc>().add(OnFilterChangeEvent(type: true, source: "Movie"));
                                  },
                                  child: Center(child: Text("MOVIE",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                                ),
                                PopupMenuItem(
                                  onTap: (){
                                    context.read<SearchBloc>().add(OnFilterChangeEvent(type: false, source: "Manga"));
                                  },
                                  child: Center(child: Text("MANGA",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                                ),
                                PopupMenuItem(
                                  onTap: (){
                                    context.read<SearchBloc>().add(OnFilterChangeEvent(type: false, source: "Original"));
                                  },
                                  child: Center(child: Text("ORIGINAL",style: TextStyle(fontSize: 15,letterSpacing: 1),)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(child: CommonGridView(
                    physics: AlwaysScrollableScrollPhysics(),
                    gridData: state.data)),
              ],
            ),
          );
        } else{
          return Scaffold(
            body: Center(
              child: Text(state.data.toString()),
            ),
          );
        }
      },
    );
  }
}



