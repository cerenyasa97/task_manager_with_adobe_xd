import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TaskDateTimePicker extends StatefulWidget{
  
  final Function(DateTime) onDateChange;
  final double width, height;
  final DateTime initialDate;

  TaskDateTimePicker({@required this.onDateChange, this.width, this.height, this.initialDate});
  
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<TaskDateTimePicker> {

  DateTime currentDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDate = widget.initialDate;
  }
  
  @override
  build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.34,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.058,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: const Color(0xffcecece),
          boxShadow: [
            BoxShadow(
              color: const Color(0x4fffffff),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
        ),
      child: FlatButton(
          child: Text(
            currentDate == null
                ? "Date"
                : "${currentDate.day}/${currentDate.month}/${currentDate.year} ${currentDate.hour}:" +
                (currentDate.minute < 10
                    ? "0${currentDate.minute}"
                    : currentDate.minute.toString()),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
          onPressed: () {
            DatePicker.showDateTimePicker(context,
                minTime: DateTime.now(),
                maxTime: DateTime(2050, 12, 31), onConfirm: (date) {
                  setState(() {
                    currentDate = date;
                  });
                  widget.onDateChange(date);
                });
          }),
      );
  }
}

