import 'package:bidding_house/core/utils/function/location_fun.dart';
import 'package:bidding_house/core/utils/imports.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key, required this.file});
  final File file;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26.w(context)),
      child:  Column(
        children: [
          const AddPostAppBar(),
          SizedBoxApp(
            h: 20.h(context),
          ),
          Container(
            height: 230.h(context),
            width: 250.w(context),
            decoration: BoxDecoration(
              image:  DecorationImage(
                image: FileImage(file),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(20.w(context)),
            ),
          ),
          SizedBoxApp(
            h: 20.h(context),
          ),
          TextFormField(
            style: AppTextStyles.style16_800(context, CustomColor.white),
            decoration: InputDecoration(
              hintText: "write a caption or description",
              hintStyle: AppTextStyles.style14_800(context, CustomColor.grey),
            ),
          ),
          SizedBoxApp(
            h: 20.h(context),
          ),
          const MyDropDown(),
          SizedBoxApp(
            h: 20.h(context),
          ),
          TextFormField(
          controller: controller,
            onTap: () async {
   await requestLocationPermissionAndRetrieveLocation();
    },
            readOnly: true,
            style: AppTextStyles.style16_800(context, CustomColor.white),
            decoration: InputDecoration(
              hintText: "Click to add location",
              hintStyle: AppTextStyles.style14_800(context, CustomColor.grey),
            ),
          ),
          SizedBoxApp(
            h: 20.h(context),
          ),
          const MyDropDown(),
          SizedBoxApp(
            h: 20.h(context),
          ),

        ],
      ),
    );
  }
}
