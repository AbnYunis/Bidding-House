import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/features/home/presentations/controllers/sign_out_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> itemsName = [
  'Real Estate',
  'Hours',
  'Cars',
  'Mobiles',
  'Clothes&shoes',
  'Collectibles',
];

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key, required this.classification});

  final void Function(String?) classification;

  @override
  MyDropDownState createState() => MyDropDownState();
}

class MyDropDownState extends State<MyDropDown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit()..getData(),
      child: BlocBuilder<SignOutCubit, SignOutState>(
        builder: (context, state) {
          if(state is HomeDataSuccess){
            return DropdownButton<String>(
              isExpanded: true,
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                  widget.classification(selectedItem);
                });
              },
              items:List.generate(state.message.docs.length, (index) {
                return DropdownMenuItem<String>(
                  value: state.message.docs[index]['name'],
                  child: Text(
                    state.message.docs[index]['name'],
                    style: AppTextStyles.style16_400(context, CustomColor.blue),
                  ),
                );
              },) ,
              hint: Text('Select an item',
                  style: AppTextStyles.style16_400(context, CustomColor.white)),

            );

          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
