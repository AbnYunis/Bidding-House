import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/category-page/presentation/views/category-view.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return CategoryView(title: text);
            },
          ),
        );
      },
      child: Column(
        children: [
          const MyImage(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5McanARG73EB7PNmo1fjRKFeX75BlB6ZlXu84xHzxMA&s',
          ),
          SizedBoxApp(h: 18.h(context)),
          Text(
            text,
            style: AppTextStyles.style16_800(context, CustomColor.white),
          ),
        ],
      ),
    );
  }
}
