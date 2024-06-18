import 'package:bidding_house/core/utils/function/location_fun.dart';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/widgets/custom_snackbar.dart';
import 'package:bidding_house/features/add_post/presentations/controllers/add_post_cubit.dart';
import 'package:bidding_house/features/add_post/presentations/views/widgets/date_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key, required this.file});

  final List<File> file;

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    TextEditingController captionController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController priceController = TextEditingController();
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
                    controller: titleController,
                    style:
                        AppTextStyles.style16_800(context, CustomColor.white),
                    decoration: InputDecoration(
                      hintText: "title",
                      hintStyle:
                          AppTextStyles.style14_800(context, CustomColor.grey),
                    ),
                  ),
                  SizedBoxApp(
                    h: 20.h(context),
                  ),
                  TextFormField(
                    controller: captionController,
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
                  MyDropDown(
                    classification: (p0) {
                      typeController.text = p0!;
                    },
                  ),
                  SizedBoxApp(
                    h: 20.h(context),
                  ),
                  TextFormField(
                    controller: locationController,
                    onTap: () async {
                      locationController.text =
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
                          controller: priceController,
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
                      DateWidget(
                        date: (p0) {
                          dateController.text = p0!;
                        },
                      )
                    ],
                  ),
                  SizedBoxApp(
                    h: 28.h(context),
                  ),
                  BlocConsumer<AddPostCubit, AddPostState>(
                    listener: (context, state) {
                      if (state is AddPostFailure) {
                        snackBar(state.message, context, Colors.red);
                      }
                      if (state is AddPostSuccess) {
                        snackBar(state.message, context, Colors.white);
                        context.pop();
                      }
                    },
                    builder: (context, state) {
                      if (state is AddPostLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      } else {
                        return Center(
                          child: MaterialButton(
                            onPressed: () {
                              BlocProvider.of<AddPostCubit>(context).addPost(
                                  titleController.text,
                                  file,
                                  captionController.text,
                                  typeController.text,
                                  locationController.text,
                                  priceController.text,
                                  dateController.text);
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
