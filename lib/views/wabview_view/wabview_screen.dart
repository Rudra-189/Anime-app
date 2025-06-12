import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../viewmodel/webView_bloc/wab_view_bloc.dart';
import '../../viewmodel/webView_bloc/wab_view_event.dart';
import '../../viewmodel/webView_bloc/wab_view_state.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebViewBloc()..add(LoadWebView(url)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.orange,size: 20,)),
        ),
        body: BlocBuilder<WebViewBloc, WebViewState>(builder: (context, state) {
          if (state.webViewStatus == status.loading) {
            return Center(child: CircularProgressIndicator(),);
          } else if (state.webViewStatus == status.success) {
            final controller = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(url));
            return WebViewWidget(controller: controller);
          } else if (state.webViewStatus == status.failure) {
            return Center(child: Text(state.errorMessage,),);
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
