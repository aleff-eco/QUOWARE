import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'app_barCustomer.dart';

class DateHour extends StatefulWidget {
  const DateHour({Key? key}) : super(key: key);

  @override
  _DateHourState createState() => _DateHourState();
}

class _DateHourState extends State<DateHour> {
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _dateFormat.format(picked); // Formatear la fecha
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 24),
              child: Text(
                'Elegir fecha y hora',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'istok_web',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 29.0, right: 24.0, left: 24.0),
              child: Container(
                height:
                    40, // Establece el alto (largo) deseado para el ElevatedButton
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: const Color(0xFF486966),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Establece el borde redondeado
                    ),
                  ),
                  child: const Text(
                    'Seleccionar fecha',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'istok_web',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: SizedBox(
                height:
                    40, // Establece el alto (largo) deseado para el TextField
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => _selectTime(context),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF486966),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Seleccionar hora',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'istok_web',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
