import 'package:bidding_house/features/search/presentations/controller/search_cubit.dart';
import 'package:bidding_house/features/search/presentations/views/widgets/search_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/imports.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              onChanged: (value) {
                context.read<SearchCubit>().getSearch(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.white70,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchItem(
                        data: context
                            .watch<SearchCubit>()
                            .filteredResults[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBoxApp(h: 20),
                    itemCount:
                        context.watch<SearchCubit>().filteredResults.length)),
          ],
        );
      },
    );
  }
}
