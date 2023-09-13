import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import 'app_barProvider.dart';
import 'view_main_provider.dart';

import 'package:app_auth/features/provider/domain/usecases/servicio_usecase.dart';
import 'package:app_auth/features/provider/domain/entities/servicio.dart';
import 'package:provider/provider.dart';

class service_create extends StatefulWidget {
  const service_create({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _service_createState createState() => _service_createState();
}

class _service_createState extends State<service_create> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _costController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final servicioUseCase = Provider.of<ServicioUseCase>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text(
          'Crear un servicio',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3B3936),
          ),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: _scrollController,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 106.0, top: 1.0),
                  child: Text(
                    "Añadir un servicio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IstokWeb',
                      fontSize: 21.0,
                    ),
                  ),
                ),
                SizedBox(height: _responsiveHeight(context, 0.04)),
                TextFormField(
                  controller: _titleController,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintText: 'Título del servicio',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: TextStyle(
                      color: const Color(0xFF3B3936),
                      fontSize: _responsiveTextSize(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(height: _responsiveHeight(context, 0.02)),
                TextFormField(
                  controller: _costController,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintText: 'Costo',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: TextStyle(
                      color: const Color(0xFF3B3936),
                      fontSize: _responsiveTextSize(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Descripción del servicio',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color(0xFF3B3936),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _timeController,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintText: 'Tiempo del servicio',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: TextStyle(
                      color: const Color(0xFF3B3936),
                      fontSize: _responsiveTextSize(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: HexColor('#FFFFFF')),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_titleController.text.trim().isEmpty ||
                          _descriptionController.text.trim().isEmpty ||
                          _costController.text.trim().isEmpty ||
                          _timeController.text.trim().isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Campos Vacíos'),
                            content: Text(
                                'Por favor, completa todos los campos antes de publicar el servicio.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                      final newServicio = Servicio(
                        userId: widget.userId,
                        titulo: _titleController.text,
                        descripcion: _descriptionController.text,
                        costo: _costController.text,
                        tiempo: _timeController.text,
                      );
                      servicioUseCase.addServicio(newServicio);
                      _titleController.clear();
                      _descriptionController.clear();
                      _costController.clear();
                      _timeController.clear();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewMain(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF486966),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: const Size(321, 51),
                    ),
                    child: const Text(
                      'Publicar servicio',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'IstokWeb',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _responsiveTextSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  double _responsiveHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }
}
