import 'package:bidding_house/core/utils/function/location_fun.dart';
import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/add_post/presentations/controllers/add_post_cubit.dart';
import 'package:bidding_house/features/add_post/presentations/views/widgets/date_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/function/show_dialog.dart';
import '../../../../../core/utils/widgets/custom_snackbar.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({super.key, required this.file});

  final List<File> file;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
              child: Form(
                key:formKey,
                child: Column(
                  children: [
                    ImageGridView(files: file),
                    SizedBoxApp(
                      h: 20.h(context),
                    ),
                    TextFormField(
                      validator:(value) {
                        if(value!.isEmpty){
                          return "please enter title";
                        }
                        return null;
                      },
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
                      validator:(value) {
                        if(value!.isEmpty){
                          return "please enter caption";
                        }
                        return null;
                      },
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
                    SelectLocation(locationController: locationController),
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
                            validator:(value) {
                              if(value!.isEmpty){
                                return "please enter price";
                              }
                              return null;
                            },
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
                        if (state is AddPostSuccess) {
                          snackBar(state.message, context, Colors.white);
                          context.pop();
                        }
                        if(state is AddPostFailure){
                          snackBar(state.message, context, Colors.red);
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
                                if(formKey.currentState!.validate()){
                                  BlocProvider.of<AddPostCubit>(context).addPost(
                                      titleController.text,
                                      file,
                                      captionController.text,
                                      typeController.text,
                                      locationController.text,
                                      priceController.text,
                                      dateController.text);
                                }

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
            ),
          )
        ],
      ),
    );
  }
}

class SelectLocation extends StatefulWidget {
  const SelectLocation({
    super.key,
    required this.locationController,
  });

  final TextEditingController locationController;

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  bool manually = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(value) {
        if(value!.isEmpty){
          return "please enter location";
        }
        return null;
      },
      controller: widget.locationController,
      onTap: manually?null:()  {
         showDialogFun(
            context,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'The way of select your location details',
                  style: AppTextStyles.style16_400(context, CustomColor.white),
                ),
                SizedBoxApp(
                  h: 20.h(context),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () async {
                          await requestLocationPermissionAndRetrieveLocation().then((value) {
                            widget.locationController.text=value;
                            context.pop();
                          },);

                        },
                        child: Text(
                          'Automatically',
                          style:
                          AppTextStyles.style16_400(context, CustomColor.white),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            manually=true;
                          });

                          context.pop();
                        },
                        child: Text(
                          'Manually',
                          style:
                          AppTextStyles.style16_400(context, CustomColor.white),
                        )),
                  ],
                )
              ],
            ),
        );
      },
      readOnly: !manually,
      style:
          AppTextStyles.style16_800(context, CustomColor.white),
      decoration: InputDecoration(
        hintText: "Click to add location",
        hintStyle:
            AppTextStyles.style14_800(context, CustomColor.grey),
      ),
    );
  }
}

class ImageGridView extends StatefulWidget {
  final List<File> files;

  const ImageGridView({super.key, required this.files});

  @override
  ImageGridViewState createState() => ImageGridViewState();
}

class ImageGridViewState extends State<ImageGridView> {
  late List<File> fileList;

  @override
  void initState() {
    super.initState();
    fileList = widget.files;
  }

  void _removeItem(int index) {
    if (fileList.length > 1) {
      setState(() {
        fileList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(fileList.length, (index) {
        File image = fileList[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: [
              Image.file(image, fit: BoxFit.cover),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => _removeItem(index),
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}