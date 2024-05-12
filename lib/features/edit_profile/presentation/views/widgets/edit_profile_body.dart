import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/edit_profile/presentation/views/widgets/custom_textfield.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Edit Profile',
            style: AppTextStyles.style20_800(context, CustomColor.white),
          ),
          SizedBoxApp(
            h: 20.h(context),
          ),
          CircleAvatar(
            backgroundImage: const NetworkImage(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            ),
            radius: 50.w(context),
          ),
          SizedBoxApp(
            h: 30.h(context),
          ),
          const CustomTextField(text: 'Name'),
          const CustomTextField(text: 'Email'),
          const CustomTextField(text: 'Password'),
          const CustomTextField(text: 'Phone'),
          SizedBoxApp(
            h: 15.h(context),
          ),
          MaterialButton(
            height: 40.h(context),
            minWidth: 180.w(context),
            onPressed: () {},
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Save Changes',
              style: AppTextStyles.style14_800(context, CustomColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
