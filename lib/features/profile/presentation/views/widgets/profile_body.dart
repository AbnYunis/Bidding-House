import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/profile/presentation/views/widgets/profile_list_items.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Hossam Samy',
                  style: AppTextStyles.style20_800(context, CustomColor.white),
                ),
                SizedBoxApp(
                  h: 10.h(context),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.w(context),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 27.w(context),
                    child: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                      size: 50.w(
                        context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBoxApp(
            h: 20.h(context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w(context),
            ),
            child: Text(
              'Sales',
              style: AppTextStyles.style14_800(context, CustomColor.white),
            ),
          ),
          const ProfileListItems(),
        ],
      ),
    );
  }
}
