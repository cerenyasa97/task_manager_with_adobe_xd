import 'package:flutter/material.dart';
import 'package:task_manager_with_xd/utils/constants.dart';

class Priority extends StatefulWidget {

  final Function(int) onSubmitted;
  final String initialPriority;

  const Priority({Key key, this.onSubmitted, this.initialPriority}) : super(key: key);

  @override
  _PriorityState createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  String _priorityValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _priorityValue = widget.initialPriority != null ? widget.initialPriority : Constants.priority[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.height * 0.058,
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
        child: DropdownButtonHideUnderline(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: DropdownButton<String>(
                value: _priorityValue,
                onChanged: (value) {
                  setState(() {
                    _priorityValue = value;
                  });
                  widget.onSubmitted(int.parse(_priorityValue));
                },
                items: Constants.priority.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ))
    );
  }
}
