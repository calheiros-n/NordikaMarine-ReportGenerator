import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nreport/controllers/controller.dart';
import 'package:nreport/miscelanius/file_handle_api_android.dart';
import 'package:nreport/miscelanius/file_handle_api_ios.dart';
import 'package:nreport/pages/MobileVersion/pdfFormatter_Mobile.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SecondPage extends StatefulWidget {
  final String description;
  final String initialdate;
  final String finaldate;
  final String inicialHour;
  final String finalHour;
  final String TechnicianName;

  const SecondPage({
    Key? key,
    required this.description,
    required this.initialdate,
    required this.finaldate,
    required this.inicialHour,
    required this.finalHour,
    required this.TechnicianName,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  // images 
  File? _serviceImage;
  File? _beforeImage;
  File? _afterImage;

  // extra images
  File? _FirstExtraImage;
  File? _SecondExtraImage;
  File? _ThirdExtraImage;
  File? _FourthExtraImage;
  File? _FifthExtraImage;
  File? _SixthExtraImage;
  File? _SeventhExtraImage;
  File? _EighthExtraImage;
  File? _NinthExtraImage;
  
  // descriptions
  String _descriptionBefore = '';
  String _descriptionAfter = '';
  String _descriptionImageService = '';

  // extras description
  String _descriptionFirstExtra = '';
  String _descriptionSecondExtra = '';
  String _descriptionThirdExtra = '';
  String _descriptionFourthExtra = '';
  String _descriptionFifthExtra = '';
  String _descriptionSixthExtra = '';
  String _descriptionSeventhExtra = '';
  String _descriptionEighthExtra = '';
  String _descriptionNinthExtra = '';

  // font selection
  late pw.Font _arialFont;

  @override
  void initState() {
    super.initState();
    _loadArialFont();
  }

  Future<void> _getServiceImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _serviceImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  // Função para selecionar imagem antes do serviço
Future<void> _getBeforeImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  setState(() {
    if (pickedFile != null) {
      _beforeImage = File(pickedFile.path);
    } else {
      print('Nenhuma imagem selecionada.');
    }
  });
}

Future<void> _getFirstExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _FirstExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getSecondExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _SecondExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getThirdExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _ThirdExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getFourthExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _FourthExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getFifthExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _FifthExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getSixthExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _SixthExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getSeventhExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _SeventhExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getEighthExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _EighthExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  Future<void> _getNinthExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _NinthExtraImage = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

// Função para selecionar imagem depois do serviço
Future<void> _getAfterImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  setState(() {
    if (pickedFile != null) {
      _afterImage = File(pickedFile.path);
    } else {
      print('Nenhuma imagem selecionada.');
    }
  });
}



Future<void> _loadArialFont() async {
    final fontData = await rootBundle.load('assets/fonts/arial.ttf');
    final Uint8List fontUint8List = fontData.buffer.asUint8List();
    setState(() {
      _arialFont = pw.Font.ttf(fontUint8List.buffer.asByteData());
    });
  }



  @override
  Widget build(BuildContext context) {
    PdfColor themeColor = PdfColors.black;
    _loadArialFont();
    String company = 'Nordika Marine';
    String InitialDate = widget.initialdate;
    String FinalDate = widget.finaldate;
    String InicialHour = widget.inicialHour;
    String FinalHour = widget.finalHour;
    
    // normal images
    File? serviceImage = _serviceImage;
    File? beforeImage = _beforeImage;
    File? afterImage = _afterImage;

    //extra images
    File? FirstExtraImage = _FirstExtraImage;
    File? SecondExtraImage = _SecondExtraImage;
    File? ThirdExtraImage = _ThirdExtraImage;
    File? FourthExtraImage = _FourthExtraImage;
    File? FifthExtraImage = _FifthExtraImage;
    File? SixthExtraImage = _SixthExtraImage;
    File? SeventhExtraImage = _SeventhExtraImage;
    File? EighthExtraImage = _EighthExtraImage;
    File? NinthExtraImage = _NinthExtraImage;

    // nomal descriptions
    String descriptionService = widget.description;
    String descriptionBefore = _descriptionBefore;
    String descriptionAfter = _descriptionAfter;
    String descriptionImageService = _descriptionImageService;

    //extra descriptions
    String descriptionFirstExtra = _descriptionFirstExtra;
    String descriptionSecondExtra = _descriptionSecondExtra;
    String descriptionThirdExtra = _descriptionThirdExtra;
    String descriptionFourthExtra = _descriptionFourthExtra;
    String descriptionFifthExtra = _descriptionFifthExtra;
    String descriptionSixthExtra = _descriptionSixthExtra;
    String descriptionSeventhExtra = _descriptionSeventhExtra;
    String descriptionEighthExtra = _descriptionEighthExtra;
    String descriptionNinthExtra = _descriptionNinthExtra;


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            Icon(Icons.camera_alt_rounded),
                            SizedBox(width: 8),
                            Text(
                              'Fotografias do serviço',
                              style: TextStyle(
                                fontFamily: 'Baloo2',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromARGB(255, 86, 84, 84),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
  onTap: () {
    _getServiceImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
  },
  child: Container(
    height: 100, // Definindo um tamanho para evitar o erro de layout
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.transparent),
    ),
    child: Center(
      child: _serviceImage != null
          ? Image.file(_serviceImage!, fit: BoxFit.cover)
          : Icon(Icons.camera_alt_rounded),
    ),
  ),
),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                      
                      //----
                Container(
                        height: 150,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                            'Descrição das fotos do servico',
                            style: TextStyle(
                              fontFamily: 'Baloo2',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color.fromARGB(255, 86, 84, 84),
                            ),
                          ),
                                ],
                              ),
                              SizedBox(height: 8),
                              
                              
                              Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                border: Border.all(color: Colors.grey),
                                              ),
                                              child: TextFormField(
                                                onChanged: (descriptionImageService) {
                                                  setState(() {
                                                    _descriptionImageService = descriptionImageService;
                                                  });
                                                },
                                                maxLines: null,
                                                keyboardType: TextInputType.multiline,
                                                textAlignVertical: TextAlignVertical.top,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: '...',
                                                  hintStyle: TextStyle(fontSize: 14),
                                                  contentPadding: EdgeInsets.all(8.0),
                                                ),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                              
                            ],
                          ),
                        ),
                      ),
                      // ---
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
                            Icon(Icons.camera_alt_rounded),
                            SizedBox(width: 12),
                            Text(
                              'Fotografias Antes do serviço',
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
                        GestureDetector(
  onTap: () {
    _getBeforeImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
  },
  child: Container(
    height: 100, // Definindo um tamanho para evitar o erro de layout
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.transparent),
    ),
    child: Center(
      child: _beforeImage != null
          ? Image.file(_beforeImage!, fit: BoxFit.cover)
          : Icon(Icons.camera_alt_rounded),
    ),
  ),
),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                      Container(
                        height: 150,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              

                              Row(
                                children: [
                                  Text(
                            'Descrição do antes',
                            style: TextStyle(
                              fontFamily: 'Baloo2',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color.fromARGB(255, 86, 84, 84),
                            ),
                          ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                border: Border.all(color: Colors.grey),
                                              ),
                                              child: TextFormField(
                                                onChanged: (descriptionAfter) {
                                                  setState(() {
                                                    _descriptionAfter = descriptionAfter;
                                                  });
                                                },
                                                maxLines: null,
                                                keyboardType: TextInputType.multiline,
                                                textAlignVertical: TextAlignVertical.top,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Digite a descrição da imagem antes do serviço...',
                                                  hintStyle: TextStyle(fontSize: 14),
                                                  contentPadding: EdgeInsets.all(8.0),
                                                ),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                              
                            ],
                          ),
                        ),
                      ),
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
                            Icon(Icons.camera_alt_rounded),
                            SizedBox(width: 12),
                            Text(
                              'Fotografias Depois do serviço',
                              style: TextStyle(
                                fontFamily: 'Baloo2',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromARGB(255, 86, 84, 84),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
  onTap: () {
    _getAfterImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
  },
  child: Container(
    height: 100, // Definindo um tamanho para evitar o erro de layout
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.transparent),
    ),
    child: Center(
      child: _afterImage != null
          ? Image.file(_afterImage!, fit: BoxFit.cover)
          : Icon(Icons.camera_alt_rounded),
    ),
  ),
),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 8),
                      
                      Container(
                        height: 150,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                            'Descrição do depois',
                            style: TextStyle(
                              fontFamily: 'Baloo2',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color.fromARGB(255, 86, 84, 84),
                            ),
                          ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                border: Border.all(color: Colors.grey),
                                              ),
                                              child: TextFormField(
                                                onChanged: (descriptionBefore) {
                                                  setState(() {
                                                    _descriptionBefore = descriptionBefore;
                                                  });
                                                },
                                                maxLines: null,
                                                keyboardType: TextInputType.multiline,
                                                textAlignVertical: TextAlignVertical.top,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Digite a descrição da imagem depois do serviço...',
                                                  hintStyle: TextStyle(fontSize: 14),
                                                  contentPadding: EdgeInsets.all(8.0),
                                                ),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                            ],
                          ),
                        ),
                      ),

                      //extra1
                      GetBuilder<ButtonVisibilityController>(
                        init: ButtonVisibilityController(),
                        builder: (controller) {
                          return 
                          
                          Column(
                            children: [
                              Obx(() => Visibility(
                                visible: controller.extra1Visible.value,
                                child: Column(
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
                                          Icon(Icons.camera_alt_rounded),
                                          SizedBox(width: 12),
                                          Text(
                                            'Fotografias Extra 1',
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color.fromARGB(255, 86, 84, 84),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      GestureDetector(
                                      onTap: () {
                                        _getFirstExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                      },
                                      child: Container(
                                        height: 100, // Definindo um tamanho para evitar o erro de layout
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: Colors.transparent),
                                        ),
                                        child: Center(
                                          child: _FirstExtraImage != null
                                              ? Image.file(_FirstExtraImage!, fit: BoxFit.cover)
                                              : Icon(Icons.camera_alt_rounded),
                                        ),
                                      ),
                                    ),
                                    ],
                                                        ),
                                                      ),
                                                    ),
                                    
                                                    SizedBox(height: 8),
                                    
                                    Container(
                                      height: 150,
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                          'Descrição do extra 1',
                                          style: TextStyle(
                                            fontFamily: 'Baloo2',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Color.fromARGB(255, 86, 84, 84),
                                          ),
                                        ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.only(top: 8.0),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              border: Border.all(color: Colors.grey),
                                                            ),
                                                            child: TextFormField(
                                                              onChanged: (descriptionExtra1) {
                                                                setState(() {
                                                                  _descriptionFirstExtra = descriptionExtra1;
                                                                });
                                                              },
                                                              maxLines: null,
                                                              keyboardType: TextInputType.multiline,
                                                              textAlignVertical: TextAlignVertical.top,
                                                              decoration: InputDecoration(
                                                                border: InputBorder.none,
                                                                hintText: 'Digite a descrição da imagem extra 1...',
                                                                hintStyle: TextStyle(fontSize: 14),
                                                                contentPadding: EdgeInsets.all(8.0),
                                                              ),
                                                              style: TextStyle(fontSize: 14),
                                                            ),
                                                          ),
                                                        ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ),

                              //extra2
                      Obx(() => Visibility(
                        visible: controller.extra2Visible.value,
                        child: Column(
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
                                  Icon(Icons.camera_alt_rounded),
                                  SizedBox(width: 12),
                                  Text(
                                    'Fotografias Extra 2',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              GestureDetector(
                              onTap: () {
                                _getSecondExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                              },
                              child: Container(
                                height: 100, // Definindo um tamanho para evitar o erro de layout
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.transparent),
                                ),
                                child: Center(
                                  child: _SecondExtraImage != null
                                      ? Image.file(_SecondExtraImage!, fit: BoxFit.cover)
                                      : Icon(Icons.camera_alt_rounded),
                                ),
                              ),
                            ),
                            ],
                                                ),
                                              ),
                                            ),
                            
                                            SizedBox(height: 8),
                            
                            Container(
                              height: 150,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                  'Descrição do Extra 2',
                                  style: TextStyle(
                                    fontFamily: 'Baloo2',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 86, 84, 84),
                                  ),
                                ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(top: 8.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      border: Border.all(color: Colors.grey),
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (descriptionExtra2) {
                                                        setState(() {
                                                          _descriptionSecondExtra = descriptionExtra2;
                                                        });
                                                      },
                                                      maxLines: null,
                                                      keyboardType: TextInputType.multiline,
                                                      textAlignVertical: TextAlignVertical.top,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: 'Digite a descrição da imagem Extra 2...',
                                                        hintStyle: TextStyle(fontSize: 14),
                                                        contentPadding: EdgeInsets.all(8.0),
                                                      ),
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),

                      //extra3
                      Obx( () =>
                         Visibility(
                          visible: controller.extra3Visible.value,
                           child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 3',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getThirdExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _ThirdExtraImage != null
                                        ? Image.file(_ThirdExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do extra 3',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra3) {
                                                          setState(() {
                                                            _descriptionThirdExtra = descriptionExtra3;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem depois do serviço...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                                                   ),
                         ),
                      ),

                      //extra4
                      Obx( () => Visibility(
                        visible: controller.extra4Visible.value,
                        child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 4',
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
                                GestureDetector(
                                onTap: () {
                                  _getFourthExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _FourthExtraImage != null
                                        ? Image.file(_FourthExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do extra 4',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra4) {
                                                          setState(() {
                                                            _descriptionFourthExtra = descriptionExtra4;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 4...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                      ),

                      //extra5
                      Obx( () =>
                       Visibility(
                        visible: controller.extra5Visible.value,
                         child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 5',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getFifthExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _FifthExtraImage != null
                                        ? Image.file(_FifthExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do extra 5',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra5) {
                                                          setState(() {
                                                            _descriptionFifthExtra = descriptionExtra5;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 5...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                       ),
                      ),

                      //extra6
                      Obx( () =>
                         Visibility(
                          visible: controller.extra6Visible.value,
                           child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 6',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getSixthExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _SixthExtraImage != null
                                        ? Image.file(_SixthExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                             SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do Extra 6',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra6) {
                                                          setState(() {
                                                            _descriptionSixthExtra = descriptionExtra6;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 6...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                                                   ),
                         ),
                      ),

                      //extra7
                      Obx( () =>
                        Visibility(
                          visible: controller.extra7Visible.value,
                          child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 7',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getSeventhExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _SeventhExtraImage != null
                                        ? Image.file(_SeventhExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do Extra 7',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra7) {
                                                          setState(() {
                                                            _descriptionSeventhExtra = descriptionExtra7;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 7...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //extra8
                      Obx( () =>
                       Visibility(
                        visible: controller.extra8Visible.value,
                         child: Column(
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 12),
                                    Text(
                                      'Fotografias Extra 8',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getEighthExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _EighthExtraImage != null
                                        ? Image.file(_EighthExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do extra 8',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra8) {
                                                          setState(() {
                                                            _descriptionEighthExtra = descriptionExtra8;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 8...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                       ),
                      ),

                      //extra9
                      Obx( () =>
                         Visibility(
                          visible: controller.extra9Visible.value,
                           child: Column(
                            children: [
                              SizedBox(height: 12),
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
                                    Icon(Icons.camera_alt_rounded),
                                    SizedBox(width: 8),
                                    Text(
                                      'Fotografias Extra 9',
                                      style: TextStyle(
                                        fontFamily: 'Baloo2',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 86, 84, 84),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                onTap: () {
                                  _getNinthExtraImage(ImageSource.gallery); // Esta função deve ser chamada somente quando o usuário tocar no Container, não na imagem
                                },
                                child: Container(
                                  height: 100, // Definindo um tamanho para evitar o erro de layout
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: Center(
                                    child: _NinthExtraImage != null
                                        ? Image.file(_NinthExtraImage!, fit: BoxFit.cover)
                                        : Icon(Icons.camera_alt_rounded),
                                  ),
                                ),
                              ),
                              ],
                                                  ),
                                                ),
                                              ),
                              
                                              SizedBox(height: 8),
                              
                              Container(
                                height: 150,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                    'Descrição do extra 9',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 86, 84, 84),
                                    ),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        border: Border.all(color: Colors.grey),
                                                      ),
                                                      child: TextFormField(
                                                        onChanged: (descriptionExtra9) {
                                                          setState(() {
                                                            _descriptionNinthExtra = descriptionExtra9;
                                                          });
                                                        },
                                                        maxLines: null,
                                                        keyboardType: TextInputType.multiline,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Digite a descrição da imagem extra 9...',
                                                          hintStyle: TextStyle(fontSize: 14),
                                                          contentPadding: EdgeInsets.all(8.0),
                                                        ),
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            ),
                         ),
                      ),

                      SizedBox(height: 12),
                          Obx(() => Visibility(
                        visible: controller.extraButtonVisible.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.incrementButtonClickedCount2();
                            controller.printButtonVisibility();
                          },
                          child: Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 40, 60, 117),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add more one',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                        ),
                      ),
                          ),
                          ],
                          );
                        }
                      ),

                      
                      
                      SizedBox(height: 12),
              
                      GestureDetector(
                        onTap: () async {
                          final pdfFile = await PdfFormatterApiMobile.generate(
                            themeColor,
                            pw.Font.courier(),
                            company,
                            InitialDate,
                            InicialHour,
                            FinalHour,

                            // normal images
                            serviceImage,
                            beforeImage,
                            afterImage,

                            //extra images
                            FirstExtraImage,
                            SecondExtraImage,
                            ThirdExtraImage,
                            FourthExtraImage,
                            FifthExtraImage,
                            SixthExtraImage,
                            SeventhExtraImage,
                            EighthExtraImage,
                            NinthExtraImage,


                            // normal descriptions
                            descriptionService,
                            descriptionImageService,
                            descriptionAfter,
                            descriptionBefore,
                            // name
                            widget.TechnicianName,
                            

                            // extras description
                           descriptionFirstExtra,
                           descriptionSecondExtra,
                           descriptionThirdExtra,
                           descriptionFourthExtra,
                           descriptionFifthExtra,
                           descriptionSixthExtra,
                           descriptionSeventhExtra,
                           descriptionEighthExtra,
                           descriptionNinthExtra,
                          );
                          if (Platform.isAndroid) {
                            FileHandleApiAndroid.openFile(pdfFile);
                          } else if (Platform.isIOS) {
                            FileHandleApiIOS.openFile(pdfFile);
                          }
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 40, 60, 117),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Próximo',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
