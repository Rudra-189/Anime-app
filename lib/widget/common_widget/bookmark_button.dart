import '../../core/utils/exports.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.060.sh,
      width: 0.060.sh,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.orange,width: 2),
            bottom: BorderSide(color: Colors.orange,width: 2),
            left: BorderSide(color: Colors.orange,width: 2),
            right: BorderSide(color: Colors.orange,width: 2),
          )
      ),
      alignment: Alignment.center,
      child: Icon(Icons.bookmark_outline,size: 20,color: Colors.orange,),
    );
  }
}
