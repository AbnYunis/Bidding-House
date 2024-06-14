import 'package:bidding_house/core/utils/function/location_fun.dart';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/add_post/presentations/controllers/add_post_cubit.dart';
import 'package:bidding_house/features/add_post/presentations/views/widgets/date_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key, required this.file});

  final List<File> file;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w(context)),
      child: Column(
        children: [
          const AddPostAppBar(),
          SizedBoxApp(
            h: 20.h(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(file.length, (index) {
                      File image = file[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0.w(context)),
                        child: Image.file(image, fit: BoxFit.cover),
                      );
                    }),
                  ),
                  SizedBoxApp(
                    h: 20.h(context),
                  ),
                  TextFormField(
                    style:
                        AppTextStyles.style16_800(context, CustomColor.white),
                    decoration: InputDecoration(
                      hintText: "write a caption or description",
                      hintStyle:
                          AppTextStyles.style14_800(context, CustomColor.grey),
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
                      controller.text =
                          await requestLocationPermissionAndRetrieveLocation();
                    },
                    readOnly: true,
                    style:
                        AppTextStyles.style16_800(context, CustomColor.white),
                    decoration: InputDecoration(
                      hintText: "Click to add location",
                      hintStyle:
                          AppTextStyles.style14_800(context, CustomColor.grey),
                    ),
                  ),
                  SizedBoxApp(
                    h: 20.h(context),
                  ),
                  Row(
                    children: [
                      Text(
                        "primary price",
                        style: AppTextStyles.style16_800(
                            context, CustomColor.white),
                      ),
                      SizedBoxApp(
                        w: 16.w(context),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: AppTextStyles.style16_800(
                              context, CustomColor.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30.w(context)),
                            ),
                            contentPadding: EdgeInsets.all(10.h(context)),
                            fillColor: const Color(0xFF73807F),
                            filled: true,
                            hintText: "price",
                            hintStyle: AppTextStyles.style14_800(
                                context, CustomColor.grey),
                          ),
                        ),
                      ),
                      SizedBoxApp(
                        w: 7.w(context),
                      ),
                      Text(
                        "L.E",
                        style: AppTextStyles.style16_800(
                            context, CustomColor.white),
                      ),
                    ],
                  ),
                  SizedBoxApp(
                    h: 28.h(context),
                  ),
                  Row(
                    children: [
                      Text(
                        "Deadline",
                        style: AppTextStyles.style16_800(
                            context, CustomColor.white),
                      ),
                      const Spacer(),
                      const DateWidget()
                    ],
                  ),
                  SizedBoxApp(
                    h: 28.h(context),
                  ),
                  BlocConsumer<AddPostCubit, AddPostState>(
                    listener: (context, state) {
                      print(state);
                    },
                    builder: (context, state) {
                      if (state is AddPostLoading) {
                        return CircularProgressIndicator();
                      } else {
                        return Center(
                          child: MaterialButton(
                            onPressed: () {
                              BlocProvider.of<AddPostCubit>(context)
                                  .addPost(file, 'no cap', '', '', '', '');
                            },
                            color: Colors.blueAccent,
                            minWidth: 153.w(context),
                            height: 40.h(context),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30.w(context)),
                            ),
                            child: Text(
                              'share',
                              style: AppTextStyles.style20_800(
                                  context, CustomColor.white),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
