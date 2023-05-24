import 'package:flutter/material.dart';

class AttendanceListNameSelect extends StatefulWidget {
  const AttendanceListNameSelect({Key? key}) : super(key: key);

  @override
  _SelectableNamesState createState() => _SelectableNamesState();
}

class _SelectableNamesState extends State<AttendanceListNameSelect> {
  List<String> _names = ['전체 원생 보기', '오하늘', '김나현', '이연희'];
  String? _selectedName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border:Border.all(color:Colors.grey)
      ),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: DropdownButton<String>(
        value: _selectedName,
        onChanged: (String? newValue) {
          setState(() {
            _selectedName = newValue;
          });
        },
        iconSize: 30,
        icon:Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
        items: _names.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
