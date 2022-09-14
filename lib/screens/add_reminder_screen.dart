import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/date.dart';
import '../constants/reminder_colors.dart';
import '../theme/colors.dart';
import '../validators/add_reminder.dart';
import '../widgets/button.dart';

class AddReminder extends StatefulWidget {
  static const routeName = 'add-reminder';
  const AddReminder({Key? key}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  Color _selectedColor = reminderColors[0];

  final _formKey = GlobalKey<FormState>();

  void _saveReminder() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(DateTime.now().year + 10),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _selectedTime,
    ).then((pickedTime) {
      if (pickedTime == null) return;
      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  String get _formattedTime {
    final now = DateTime.now();

    final dt = DateTime(
        now.year, now.month, now.day, _selectedTime.hour, _selectedTime.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  String get _formattedDate {
    return DateFormat('MMM, d').format(_selectedDate);
  }

  Widget _buildFormDivider() {
    return const SizedBox(
      height: 10,
      width: 10,
    );
  }

  Widget _buildHeader() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Text(
        'Add reminder - $todayText',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDateTimeField(
      String label, String value, Function onTap, BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              _buildFormDivider(),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              )
            ],
          )),
    );
  }

  Widget _buildColorBox(Color color) {
    final isSelected = color.value == _selectedColor.value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
          width: 60,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                  color: isSelected ? primaryColor : color, width: 2),
              borderRadius: BorderRadius.circular(5))),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: _formKey,
          //autovalidateMode: const AutovalidateMode.always(),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                  validator: validateTitle),
              _buildFormDivider(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                controller: _descriptionController,
                validator: validateDescription,
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              _buildFormDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateTimeField(
                      'Date:', _formattedDate, _showDatePicker, context),
                  _buildDateTimeField(
                      'Time:', _formattedTime, _showTimePicker, context),
                ],
              ),
              _buildFormDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  _buildFormDivider(),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: reminderColors
                            .map((color) => _buildColorBox(color))
                            .toList()),
                  ),
                ],
              ),
              _buildFormDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    title: 'Cancel',
                    onPressed: () => _cancel(context),
                    type: ButtonType.cancel,
                  ),
                  _buildFormDivider(),
                  Button(
                    title: 'Save',
                    onPressed: _saveReminder,
                  )
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _buildHeader(),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }
}
