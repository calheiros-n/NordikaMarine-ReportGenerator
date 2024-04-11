import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nreport/pages/MobileVersion/pictures&Descriptions_Mobile.dart';
import 'package:nreport/pages/WebVersion/Second_Page_Web.dart';

class ServiceDescription extends StatefulWidget {
  final String initialdate;
  final String finaldate;
  final String inicialHour;
  final String finalHour;
  final String TechnicianName;

  const ServiceDescription({
    Key? key,
    required this.initialdate,
    required this.finaldate,
    required this.inicialHour,
    required this.finalHour,
    required this.TechnicianName,
  }) : super(key: key);

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(height: 8),
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.note_rounded),
                            SizedBox(width: 8),
                            Text(
                              'Descrição do serviço',
                              style: TextStyle(
                                fontFamily: 'Baloo2',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromARGB(255, 86, 84, 84),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 120, // Definindo um tamanho para evitar o erro de layout
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _description = value;
                              });
                            },
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Digite a descrição do serviço...',
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding: EdgeInsets.all(8.0),
                            ),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  key: ValueKey('NavigatetoPageWeborNormal'),
                  onTap: () {
  if (kIsWeb) {
    // Navegação específica para web
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPageWeb(
          description: _description,
          initialdate: widget.initialdate,
          finaldate: widget.finaldate,
          inicialHour: widget.inicialHour,
          finalHour: widget.finalHour, 
          TechnicianName: widget.TechnicianName,
        )
      ),
    );
  } else {
    // Navegação padrão para outras plataformas
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          description: _description,
          initialdate: widget.initialdate,
          finaldate: widget.finaldate,
          inicialHour: widget.inicialHour,
          finalHour: widget.finalHour, 
          TechnicianName: widget.TechnicianName,
        ),
      ),
    );
  }
},
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 40, 60, 117),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Próximo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
