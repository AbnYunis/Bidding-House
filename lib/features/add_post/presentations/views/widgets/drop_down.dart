import 'package:bidding_house/core/utils/imports.dart';

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
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue;
          widget.classification(selectedItem);
        });
      },
      items: itemsName.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: AppTextStyles.style16_400(context, CustomColor.blue),
          ),
        );
      }).toList(),
      hint: Text('Select an item',
          style: AppTextStyles.style16_400(context, CustomColor.white)),

    );
  }
}
