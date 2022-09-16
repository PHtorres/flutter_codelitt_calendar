import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/app.dart';
import '../constants/reminder_colors.dart';
import '../models/reminder.dart';
import '../theme/colors.dart';
import '../utils/reminder.dart';
import '../validators/reminder.dart';
import '../widgets/button.dart';

class ReminderForm extends StatefulWidget {
  final Reminder? initialDataForm;
  final Function onSave;
  final Function onCancel;
  final Function? onRemove;

  const ReminderForm(
      {Key? key,
      this.initialDataForm,
      required this.onSave,
      required this.onCancel,
      this.onRemove})
      : super(key: key);

  @override
  State<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  TimeOfDay _selectedTime = TimeOfDay.now();

  Color _selectedColor = reminderColors[0];

  @override
  void initState() {
    _titleController.text = widget.initialDataForm?.title ?? '';
    _descriptionController.text = widget.initialDataForm?.description ?? '';
    _selectedDate = widget.initialDataForm?.dateTime ?? DateTime.now();

    _selectedTime = widget.initialDataForm?.dateTime != null
        ? dateTimeToTime(widget.initialDataForm!.dateTime)
        : TimeOfDay.now();

    super.initState();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate,
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

  void _handleOnSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
          context,
          widget.initialDataForm?.id,
          _titleController.text,
          _descriptionController.text,
          _selectedDate,
          _selectedTime,
          _selectedColor);
    }
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

  Widget _buildDateTimeField(
      String label, String value, Function onTap, BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
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
          ),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                width: isDesktop
                    ? MediaQuery.of(context).size.width * 0.5
                    : double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateTimeField(
                        'Date:', _formattedDate, _showDatePicker, context),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildDateTimeField(
                        'Time:', _formattedTime, _showTimePicker, context),
                  ],
                ),
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
                    width: isDesktop
                        ? MediaQuery.of(context).size.width * 0.5
                        : double.infinity,
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
                  widget.onRemove != null
                      ? Button(
                          title: 'Remove',
                          onPressed: () => widget.onRemove!(
                              context, widget.initialDataForm?.id),
                          type: ButtonType.danger,
                        )
                      : const SizedBox(),
                  _buildFormDivider(),
                  Button(
                    title: 'Cancel',
                    onPressed: () => widget.onCancel(context),
                    type: ButtonType.cancel,
                  ),
                  _buildFormDivider(),
                  Button(
                    title: 'Save',
                    onPressed: () => _handleOnSave(context),
                  )
                ],
              )
            ],
          )),
    );
  }
}
