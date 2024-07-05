import '../../../../../core/utils/imports.dart';

class BiddingPeople extends StatelessWidget {
  const BiddingPeople({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  data[index]['userImage'] ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReKHfgKmxdGMSXoX0adCyPpVjDZI7tjYQzgxE7Xxk204YPzLi6axHU7LpmaQa-UYNhXno&usqp=CAU',
                ),
              ),
              SizedBoxApp(
                w: 7.w(context),
              ),
              Text(
                data[index]['email'],
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
              const Spacer(),
              Text(
                "price : \$ ${data[index]['price']}",
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBoxApp(
              h: 15.h(context),
            ),
        itemCount: data.length);
  }
}
