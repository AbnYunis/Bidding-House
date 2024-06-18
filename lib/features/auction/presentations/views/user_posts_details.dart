import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/auction/presentations/views/widgets/user_post_details_body.dart';

class UserPostsDetails extends StatelessWidget {
  final Map<String ,dynamic >data;
  const UserPostsDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: UserPostDetailsBody(data: data,),
      ),
    );
  }
}
