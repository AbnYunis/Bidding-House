
import 'package:bidding_house/core/utils/function/location_fun.dart';
import 'package:bidding_house/core/utils/imports.dart';

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
                  // Container(
                  //   height: 230.h(context),
                  //   width: 250.w(context),
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(image: FileImage(file), fit: BoxFit.fill),
                  //     borderRadius: BorderRadius.circular(20.w(context)),
                  //   ),
                  // ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(file.length, (index) {
                      File image = file[index];
                      return Image.file(image, fit: BoxFit.cover);
                    }),
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
                      controller.text =
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
                  Row(
                    children: [
                      Text(
                        "primary price",
                        style: AppTextStyles.style16_800(context, CustomColor.white),
                      ),
                      SizedBoxApp(
                        w: 16.w(context),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: AppTextStyles.style16_800(context, CustomColor.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.w(context)),
                            ),
                            contentPadding: EdgeInsets.all(10.h(context)),
                            fillColor: const Color(0xFF73807F),
                            filled: true,
                            hintText: "price",
                            hintStyle:
                            AppTextStyles.style14_800(context, CustomColor.grey),
                          ),
                        ),
                      ),
                      SizedBoxApp(
                        w: 7.w(context),
                      ),
                      Text(
                        "L.E",
                        style: AppTextStyles.style16_800(context, CustomColor.white),
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
                        style: AppTextStyles.style16_800(context, CustomColor.white),
                      ),
                      const Spacer(),
                      const Date()
                    ],
                  ),
                  SizedBoxApp(
                    h: 28.h(context),),
                  Center(
                      child: MaterialButton(
                        onPressed:() {

                        },
                        color: Colors.blueAccent,
                        minWidth: 153.w(context),
                        height: 40.h(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.w(context)),
                        ),
                        child: Text('share', style: AppTextStyles.style20_800(context, CustomColor.white),),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Date extends StatefulWidget {
  const Date({
    super.key,
  });

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  String text = "day\\mon\\year";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
            context: context,
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.dark()
                  ) ,//change to your desired color
                  child: child!);
            },
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
            initialDate: DateTime.now())
            .then((value) {
          setState(() {
            text = "${value!.day}/${value.month}/${value.year}";
          });
        });
      },
      child: Text(
        text,
        style: AppTextStyles.style16_800(context, CustomColor.white),
      ),
    );
  }
}
