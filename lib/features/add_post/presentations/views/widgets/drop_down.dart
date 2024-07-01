import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/imports.dart';
import '../../../../home/presentations/controllers/sign_out_cubit.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key, required this.classification, required this.validator});

  final void Function(String?) classification;
  final String? Function(String?) validator;

  @override
  MyDropDownState createState() => MyDropDownState();
}

class MyDropDownState extends State<MyDropDown> {
  String? selectedItem;
  String? validationMessage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit()..getData(),
      child: BlocBuilder<SignOutCubit, SignOutState>(
        builder: (context, state) {
          if (state is HomeDataSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue;
                      widget.classification(selectedItem);
                      validationMessage = null;
                    });
                  },
                  items: List.generate(state.message.docs.length, (index) {
                    return DropdownMenuItem<String>(
                      value: state.message.docs[index]['name'],
                      child: Text(
                        state.message.docs[index]['name'],
                        style: AppTextStyles.style16_400(context, CustomColor.blue),
                      ),
                    );
                  }),
                  hint: Text('Select an item',
                      style: AppTextStyles.style16_400(context, CustomColor.white)),
                ),
                if (validationMessage != null)
                  Text(
                    validationMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void validate() {
    setState(() {
      validationMessage = widget.validator(selectedItem);
    });
  }
}

