import 'dart:io';
import 'dart:typed_data';
import 'package:nreport/miscelanius/file_handle_api_android.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfFormatterApiWeb {
  static Future<Future<File>> generateAndDownload(
    PdfColor color,
    pw.Font fontFamily,
    String company,
    String date,
    String initialHour,
    String finalHour,

    // normal images
    Uint8List? serviceImage,
    Uint8List? beforeImage,
    Uint8List? afterImage,

    //extra images
    Uint8List? FirstExtraImage,
    Uint8List? SecondExtraImage,
    Uint8List? ThirdExtraImage,
    Uint8List? FourthExtraImage,
    Uint8List? FifthExtraImage,
    Uint8List? SixthExtraImage,
    Uint8List? SeventhExtraImage,
    Uint8List? EighthExtraImage,
    Uint8List? NinthExtraImage,

    // normal description
    String descriptionService,
    String descriptionImageService,
    String descriptionBefore,
    String descriptionAfter,
    String technicianName,

    // extras description
    String descriptionFirstExtra,
    String descriptionSecondExtra,
    String descriptionThirdExtra,
    String descriptionFourthExtra,
    String descriptionFifthExtra,
    String descriptionSixthExtra,
    String descriptionSeventhExtra,
    String descriptionEighthExtra,
    String descriptionNinthExtra,
  ) async {
    final pdf = pw.Document();

    // Carregar a imagem do ícone
    final iconImage = (await rootBundle.load('icons/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'Pictures',
    ];

    final tableData = [[

        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: serviceImage != null
                  ? pw.Image(pw.MemoryImage(serviceImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionImageService.isNotEmpty ?
                descriptionImageService : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
       
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: beforeImage != null
                  ? pw.Image(pw.MemoryImage(beforeImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionBefore.isNotEmpty ?
                descriptionBefore : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
     
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: afterImage != null
                  ? pw.Image(pw.MemoryImage(afterImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionAfter.isNotEmpty ?
                descriptionAfter : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
    ]];

    // extras 1,2,3
    final tableData1 = [[
    //extra 1
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: FirstExtraImage != null
                  ? pw.Image(pw.MemoryImage(FirstExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionFirstExtra.isNotEmpty ?
                descriptionFirstExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 2
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: SecondExtraImage != null
                  ? pw.Image(pw.MemoryImage(SecondExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionSecondExtra.isNotEmpty ?
                descriptionSecondExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 3
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: ThirdExtraImage != null
                  ? pw.Image(pw.MemoryImage(ThirdExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionThirdExtra.isNotEmpty ?
                descriptionThirdExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
    ]];

    // extras 4,5,6
    final tableData2 = [[
      //extra 4
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: FourthExtraImage != null
                  ? pw.Image(pw.MemoryImage(FourthExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionFourthExtra.isNotEmpty ?
                descriptionFourthExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 5
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: FifthExtraImage != null
                  ? pw.Image(pw.MemoryImage(FifthExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionFifthExtra.isNotEmpty ?
                descriptionFifthExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 6
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: SixthExtraImage != null
                  ? pw.Image(pw.MemoryImage(SixthExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionSixthExtra.isNotEmpty ?
                descriptionSixthExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
    ]];

    // extras 7,8,9
    final tableData3 = [[
      //extra 7
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: SeventhExtraImage != null
                  ? pw.Image(pw.MemoryImage(SeventhExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionSeventhExtra.isNotEmpty ?
                descriptionSeventhExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 8
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: EighthExtraImage != null
                  ? pw.Image(pw.MemoryImage(EighthExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionEighthExtra.isNotEmpty ?
                descriptionEighthExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
        //extra 9
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 100,
              height: 100,
              child: NinthExtraImage != null
                  ? pw.Image(pw.MemoryImage(NinthExtraImage))
                  :  pw.Container(width: 100, height: 100, color: PdfColors.white),
            ),
              pw.Text(
                descriptionNinthExtra.isNotEmpty ?
                descriptionNinthExtra : '', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
    ]];

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Row(
              children: [
                pw.Image(
                  pw.MemoryImage(iconImage),
                  height: 72,
                  width: 72,
                ),
                pw.SizedBox(width: 1 * PdfPageFormat.mm),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Service Report',
                      style: pw.TextStyle(
                        fontSize: 12.0,
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                        //font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      company,
                      style: pw.TextStyle(
                        fontSize: 12.0,
                        color: color,
                        //font: fontFamily,
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      technicianName,
                      style: pw.TextStyle(
                        fontSize: 11,
                        color: color,
                        //font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      'nordika@gmail.com',
                      style: pw.TextStyle(
                        fontSize: 11.0,
                        color: color,
                        //font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      date, 
                      style: pw.TextStyle(
                        fontSize: 11.0,
                        color: color,
                        //font: fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Text('Horas trabalhadas: $initialHour - $finalHour'),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Text(
              'Description Service,\n$descriptionService',
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 12.0,
                color: color,
                //font: fontFamily,
              ),
            ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            pw.Table.fromTextArray(
              //headers: tableHeaders,
              data: tableData,
              border: null,
              //headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              //headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
              },
            ),
            // extras 1,2,3
            pw.Table.fromTextArray(
              data: tableData1,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.white),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
              },
            ),
            // extras 4,5,6
            pw.Table.fromTextArray(
              data: tableData2,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.white),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
              },
            ),
            //extras 7,8,9
            pw.Table.fromTextArray(
              data: tableData3,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.white),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
              },
            ),
            
            pw.Divider(),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text(
                company,
                style: pw.TextStyle(
                     color: color, //font: fontFamily
                    ),
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Address: ',
                    style: pw.TextStyle(
                         color: color, //font: fontFamily
                        ),
                  ),
                  pw.Text(
                    'Miami Beach, FL 1212',
                    style: pw.TextStyle(color: color, //font: fontFamily
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(
                         color: color, //font: fontFamily
                        ),
                  ),
                  pw.Text(
                    'nordikamarine@gmail.com',
                    style: pw.TextStyle(color: color,),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // Crie um blob com os bytes do PDF
    final blob = html.Blob([await pdf.save()], 'application/pdf');

    // Crie a URL do blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Crie um link para fazer o download do PDF
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'my_invoice.pdf')
      ..click();

    // Limpe os recursos utilizados
    html.Url.revokeObjectUrl(url);

    return FileHandleApiAndroid.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}
