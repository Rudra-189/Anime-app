import 'package:project2/core/utils/exports.dart';
import 'package:project2/widget/common_widget/common_app_bar.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebViewBloc()..add(LoadWebViewEvent(url)),
      child: Scaffold(
        appBar: commonAppBar(context),
        body: BlocBuilder<WebViewBloc, WebViewState>(builder: (context, state) {
          if (state.webViewStatus == status.loading) {
            return Center(child: CircularProgressIndicator(),);
          } else if (state.webViewStatus == status.success) {
            final controller = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(url));
            return WebViewWidget(controller: controller);
          } else{
            return Center(child: Text(state.errorMessage,),);
          }
        }),
      ),
    );
  }
}
