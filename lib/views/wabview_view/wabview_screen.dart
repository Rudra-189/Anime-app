import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/wabview_bloc/wab_view_bloc.dart';
import 'package:project2/viewmodel/wabview_bloc/wab_view_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WabViewScreen extends StatelessWidget {
  final String url;
  WabViewScreen({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      body: BlocBuilder<WabViewBloc,WabViewState>(builder: (context,state){
        if(state.wabViewStatus == status.loading){
          return Center(child: CircularProgressIndicator(),);
        }else if(state.wabViewStatus == status.loading){
          return WebViewWidget(controller: controller);
        }
      }),
    );
  }
}
