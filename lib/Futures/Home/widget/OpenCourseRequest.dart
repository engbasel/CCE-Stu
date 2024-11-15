import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OpenCourseRequest extends StatefulWidget {
  const OpenCourseRequest({Key? key}) : super(key: key);

  @override
  _OpenCourseRequestState createState() => _OpenCourseRequestState();
}

class _OpenCourseRequestState extends State<OpenCourseRequest> {
  // Controllers for each form field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController studyLevelController = TextEditingController();
  final TextEditingController programController = TextEditingController();
  final TextEditingController academicYearController = TextEditingController();
  final TextEditingController semesterGpaController = TextEditingController();
  final TextEditingController cumulativeGpaController = TextEditingController();
  final TextEditingController completedCreditHoursController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Course Request'),
        actions: [
          IconButton(
            onPressed: () async {
              // Generate and print the PDF with form data
              await _generatePdf();
            },
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: SmoothScrollBehavior(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Student Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                buildTextField('Name', nameController),
                buildTextField('Student ID', studentIdController),
                buildTextField('Phone Number', phoneNumberController),
                buildTextField('Study Level', studyLevelController),
                buildTextField('Program (e.g., CCE)', programController),
                buildTextField('Academic Year', academicYearController),
                buildTextField('Semester GPA', semesterGpaController),
                buildTextField('Cumulative GPA', cumulativeGpaController),
                buildTextField(
                    'Completed Credit Hours', completedCreditHoursController),
                const SizedBox(height: 20),

                // Section: Add Course Requests
                const Text(
                  'Add Course Requests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(height: 10),
                // buildCourseFields('Add Course'),
                const SizedBox(height: 20),

                // Section: Additional Notes
                const Text(
                  'Additional Notes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Enter any additional notes here',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle form submission logic
                    },
                    child: const Text('Submit Request'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();

    // Load the custom Arabic font
    final fontArabic = await rootBundle.load("fonts/Amiri-Regular.ttf");
    final ttfArabic = pw.Font.ttf(fontArabic);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // Header with Arabic and English text
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('جامعة المنصورة',
                          style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              font: ttfArabic),
                          textDirection: pw.TextDirection.rtl),
                      pw.Text('كلية الهندسة',
                          style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              font: ttfArabic),
                          textDirection: pw.TextDirection.rtl),
                    ],
                  ),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('Mansoura University',
                          style: pw.TextStyle(
                              fontSize: 16, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Faculty of Engineering',
                          style: pw.TextStyle(
                              fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                indent: 20,
                endIndent: 50,
                thickness: 2,
                height: 2,
              ),
              pw.SizedBox(height: 10),

              pw.Center(
                child: pw.Text(
                  'نموذج حذف أو إضافة إلكتروني',
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      font: ttfArabic),
                ),
              ),
              pw.SizedBox(height: 20),

              pw.Directionality(
                textDirection: pw.TextDirection.rtl,
                child: pw.Table.fromTextArray(
                  headers: [
                    'اسم الطالب',
                    'الرقم الجامعي',
                    'المستوى الدراسي',
                    'البرنامج',
                    'العام الأكاديمي'
                  ],
                  data: [
                    [
                      nameController.text,
                      studentIdController.text,
                      studyLevelController.text,
                      programController.text,
                      academicYearController.text
                    ],
                  ],
                  border: pw.TableBorder.all(),
                  cellStyle: pw.TextStyle(
                    fontSize: 14,
                    font: ttfArabic,
                  ),
                  headerStyle: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic,
                  ),
                  headerDecoration: pw.BoxDecoration(),
                  cellAlignment: pw.Alignment.center,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'معدل الفصل الدراسي: ${semesterGpaController.text}',
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic),
              ),
              pw.Text(
                'المعدل التراكمي: ${cumulativeGpaController.text}',
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic),
              ),
              pw.Text(
                'عدد الساعات المكتملة: ${completedCreditHoursController.text}',
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic),
              ),

              // Signature and date section
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                children: [
                  pw.Column(
                    children: [
                      // pw.Text('',
                      //     style: pw.TextStyle(fontSize: 14, font: ttfArabic)),
                      pw.Text(
                        'توقيع الطالب',
                        textDirection: pw.TextDirection.rtl,
                        style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            font: ttfArabic),
                      ),
                      pw.Container(
                          height: 30,
                          width: 100,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all())),
                    ],
                  ),
                  pw.Column(
                    children: [
                      // pw.Text('',
                      //     style: pw.TextStyle(fontSize: 14, font: ttfArabic)),

                      pw.Text(
                        'توقيع المرشد الأكاديمي',
                        textDirection: pw.TextDirection.rtl,
                        style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            font: ttfArabic),
                      ),
                      pw.Container(
                          height: 30,
                          width: 100,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all())),
                    ],
                  ),
                  pw.Column(
                    children: [
                      // pw.Text('ج',
                      //     style: pw.TextStyle(fontSize: 14, font: ttfArabic)),

                      pw.Text(
                        'توقيع المدير التنفيذي للبرنامج ',
                        textDirection: pw.TextDirection.rtl,
                        style: pw.TextStyle(
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                            font: ttfArabic),
                      ),
                      pw.Container(
                          height: 30,
                          width: 100,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all())),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'اليوم والتاريخ:',
                  style: pw.TextStyle(fontSize: 14, font: ttfArabic),
                  textDirection: pw.TextDirection.rtl,
                ),
              ),
              pw.Divider(),
              pw.Text(
                textAlign: pw.TextAlign.center,
                ' '
                ' يجب اتباع المواد الخاصة بالتسجيل والحذف والاضافة والانسحاب المنصوص عليها بالقواعد العامة في اللائحة الموحدة لبرامج البكالريوس بنظام الساعات المعتمدة - كلية الهندسة - جامعة المنصورة '
                '',
                style: pw.TextStyle(fontSize: 18, font: ttfArabic),
                textDirection: pw.TextDirection.rtl,
              ),
              pw.Divider(),
            ],
          );
        },
      ),
    );

    // Display the PDF
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}

// Custom ScrollBehavior for smooth scrolling
class SmoothScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: Colors.blue,
      child: child,
    );
  }
}
