import 'package:bidding_house/features/search/presentations/controller/search_cubit.dart';
import 'package:bidding_house/features/search/presentations/views/widgets/search_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/imports.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: SearchBody(),
        ),
      ),
    );
  }
}
