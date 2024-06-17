import '../../../../../core/utils/imports.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextFormField(
          onChanged:(value) {

          },
          decoration: const InputDecoration(
            hintText: 'Search',
            suffixIcon: Icon(Icons.search),
            fillColor: Colors.white70,
            filled: true,
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
