import 'package:bidding_house/core/utils/imports.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key, required this.image});
  final File image ;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
      body: AddPostBody(file: image,),
    ),);
  }
}
