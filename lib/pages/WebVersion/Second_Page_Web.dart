import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nreport/controllers/controller.dart';
import 'package:nreport/pages/WebVersion/pdfFormatter_Web.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SecondPageWeb extends StatefulWidget {
  
  final String description;
  final String initialdate;
  final String finaldate;
  final String inicialHour;
  final String finalHour;
  final String TechnicianName;

  const SecondPageWeb({
    Key? key,
    required this.description,
    required this.initialdate,
    required this.finaldate,
    required this.inicialHour,
    required this.finalHour,
    required this.TechnicianName,
  }) : super(key: key);

  @override
  State<SecondPageWeb> createState() => _SecondPageWebState();
}

class _SecondPageWebState extends State<SecondPageWeb> {
  

  //bools visible
  

  bool ExtraButtonVisible = true;

  // normal images
  XFile? _serviceImage;
  XFile? _beforeImage;
  XFile? _afterImage;

  // extra images
  XFile? _FirstExtraImage;
  XFile? _SecondExtraImage;
  XFile? _ThirdExtraImage;
  XFile? _FourthExtraImage;
  XFile? _FifthExtraImage;
  XFile? _SixthExtraImage;
  XFile? _SeventhExtraImage;
  XFile? _EighthExtraImage;
  XFile? _NinthExtraImage;

  // normal descriptions
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

  

  Future<void> _getServiceImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _serviceImage = pickedFile;
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
        _beforeImage = pickedFile;
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
        _afterImage = pickedFile;
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  //extras 1
  Future<void> _getFirstExtraImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _FirstExtraImage = pickedFile;
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
        _SecondExtraImage = pickedFile;
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
        _ThirdExtraImage = pickedFile;
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
        _FourthExtraImage = pickedFile;
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
        _FifthExtraImage = pickedFile;
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
        _SixthExtraImage = pickedFile;
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
        _SeventhExtraImage = pickedFile;
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
        _EighthExtraImage = pickedFile;
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
        _NinthExtraImage = pickedFile;
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    PdfColor themeColor = PdfColors.black;
    pw.Font font = pw.Font.courier();
    String company = 'Nordika Marine';
    String InitialDate = widget.initialdate;
    String FinalDate = widget.finaldate;
    String InicialHour = widget.inicialHour;
    String FinalHour = widget.finalHour;
    
    // normal images
    XFile? serviceImage = _serviceImage;
    XFile? beforeImage = _beforeImage;
    XFile? afterImage = _afterImage;

    //extra images
    XFile? FirstExtraImage = _FirstExtraImage;
    XFile? SecondExtraImage = _SecondExtraImage;
    XFile? ThirdExtraImage = _ThirdExtraImage;
    XFile? FourthExtraImage = _FourthExtraImage;
    XFile? FifthExtraImage = _FifthExtraImage;
    XFile? SixthExtraImage = _SixthExtraImage;
    XFile? SeventhExtraImage = _SeventhExtraImage;
    XFile? EighthExtraImage = _EighthExtraImage;
    XFile? NinthExtraImage = _NinthExtraImage;

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
                                 ? Image.network(_serviceImage!.path, fit: BoxFit.cover)
                                 : Icon(Icons.camera_alt_rounded),
                           ),
                         ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                        height: 12,
                ),
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
                      SizedBox(
                        height: 12,
                      ),
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
                        SizedBox(height: 12),
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
                                ? Image.network(_beforeImage!.path, fit: BoxFit.cover)
                                : Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                       ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                      SizedBox(
                        height: 12,
                      ),

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
                                ? Image.network(_serviceImage!.path, fit: BoxFit.cover)
                                : Icon(Icons.camera_alt_rounded),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 12,),
                      
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
                                          SizedBox(width: 8),
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
                                              ? Image.network(_FirstExtraImage!.path, fit: BoxFit.cover)
                                              : Icon(Icons.camera_alt_rounded),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12,),
                                
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_SecondExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_ThirdExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
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
                                      SizedBox(width: 8),
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
                                  SizedBox(height: 12),
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
                                          ? Image.network(_FourthExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_FifthExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_SixthExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_SeventhExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() =>Visibility(
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
                                      SizedBox(width: 8),
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
                                          ? Image.network(_EighthExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          Obx(() => Visibility(
                            visible: controller.extra9Visible.value,
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
                                          ? Image.network(_NinthExtraImage!.path, fit: BoxFit.cover)
                                          : Icon(Icons.camera_alt_rounded),
                                    ),
                                  ),
                                ),
                                ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 12,),
                          
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
                          //add more one button
                          SizedBox(height: 8),
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
                        SizedBox(height: 8),
              
                      GestureDetector(
                        onTap: () async {

                          //normal
                          final Uint8List? serviceImageBytes = _serviceImage != null ? await _serviceImage!.readAsBytes() : null;
                          final Uint8List? beforeImageBytes = _beforeImage != null ? await _beforeImage!.readAsBytes() : null;
                          final Uint8List? afterImageBytes = _afterImage != null ? await _afterImage!.readAsBytes() : null;
                          
                          //extras
                          final Uint8List? FirstExtraImageBytes = _FirstExtraImage != null ? await _FirstExtraImage!.readAsBytes() : null;
                          final Uint8List? SecondExtraImageBytes = _SecondExtraImage != null ? await _SecondExtraImage!.readAsBytes() : null;
                          final Uint8List? ThirdExtraImageBytes = _ThirdExtraImage != null ? await _ThirdExtraImage!.readAsBytes() : null;
                          final Uint8List? FourthExtraImageBytes = _FourthExtraImage != null ? await _FourthExtraImage!.readAsBytes() : null;
                          final Uint8List? FifthExtraImageBytes = _FifthExtraImage != null ? await _FifthExtraImage!.readAsBytes() : null;
                          final Uint8List? SixthExtraImageBytes = _SixthExtraImage != null ? await _SixthExtraImage!.readAsBytes() : null;
                          final Uint8List? SeventhExtraImageBytes = _SeventhExtraImage != null ? await _SeventhExtraImage!.readAsBytes() : null;
                          final Uint8List? EighthExtraImageBytes = _EighthExtraImage != null ? await _EighthExtraImage!.readAsBytes() : null;
                          final Uint8List? NinthExtraImageBytes = _NinthExtraImage != null ? await _NinthExtraImage!.readAsBytes() : null;

                          
                          // Passando os bytes das imagens para o método generateAndDownload
                          final pdfFile = await PdfFormatterApiWeb.generateAndDownload(
                          themeColor,
                          pw.Font.courier(),
                          company,
                          InitialDate,
                          InicialHour,
                          FinalHour,

                          // normal images
                          serviceImageBytes,
                          beforeImageBytes,
                          afterImageBytes,
                          
                          //extra images
                          FirstExtraImageBytes,
                          SecondExtraImageBytes,
                          ThirdExtraImageBytes,
                          FourthExtraImageBytes,
                          FifthExtraImageBytes,
                          SixthExtraImageBytes,
                          SeventhExtraImageBytes,
                          EighthExtraImageBytes,
                          NinthExtraImageBytes,

                          // normal description
                          descriptionService,
                          descriptionImageService,
                          descriptionAfter,
                          descriptionBefore,
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
                          descriptionNinthExtra
                          );
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
