import 'package:bidding_house/features/search/presentations/views/widgets/search_body.dart';

import '../../../../core/utils/imports.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SearchBody()));
  }
}
