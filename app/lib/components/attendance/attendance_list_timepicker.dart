import 'package:flutter/material.dart';

class AttendaneListTimePicker extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const AttendaneListTimePicker({required this.onDateSelected});

  @override
  _AttendaneListTimePickerState createState() =>
      _AttendaneListTimePickerState();
}

class _AttendaneListTimePickerState extends State<AttendaneListTimePicker> {
  late DateTime _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _selectedDate == null
                  ? "날짜 선택"
                  : "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",

            style: TextStyle(
              fontSize: 12
            ),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
