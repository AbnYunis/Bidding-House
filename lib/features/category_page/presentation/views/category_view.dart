import 'package:bidding_house/core/utils/imports.dart';

class CategoryView extends StatelessWidget {
  final String title;
  const CategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: CategoryBody(title: title,),
      ),
    );
  }
}
