import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';


class DropDownListExample extends StatefulWidget {

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {


  final TextEditingController _cityTextEditingController =
  TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _cityTextEditingController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

/// Model textFiel.
class AppTextField extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem> cities;
  AppTextField({
    this.textEditingController,
    this.title,
    this.hint,
    this.isCitySelected,
    this.cities,

  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _searchTextEditingController = TextEditingController();


  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: kDone,
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: kSearch,
        bottomSheetTitle: kCities,
        searchBackgroundColor: Colors.black12,
        dataList: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {

        },
        selectedItem: (String selected) {
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.blue,
          onTap: widget.isCitySelected
              ? () {
            FocusScope.of(context).unfocus();
            onTextFieldTap();
          }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0,),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
