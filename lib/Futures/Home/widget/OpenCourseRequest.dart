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

  // Controllers for course deletion fields
  final List<TextEditingController> courseCodeControllers = [];
  final List<TextEditingController> courseNameControllers = [];
  final List<TextEditingController> workloadBeforeDeletionControllers = [];
  final List<TextEditingController> workloadAfterDeletionControllers = [];
  final List<TextEditingController> reasonForDeletionControllers = [];
  final List<TextEditingController> otherReasonControllers = [];
  final List<TextEditingController> academicSupervisorControllers = [];

  // Sample count of deletion requests
  final int deletionRequestCount = 2;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each deletion request
    for (int i = 0; i < deletionRequestCount; i++) {
      courseCodeControllers.add(TextEditingController());
      courseNameControllers.add(TextEditingController());
      workloadBeforeDeletionControllers.add(TextEditingController());
      workloadAfterDeletionControllers.add(TextEditingController());
      reasonForDeletionControllers.add(TextEditingController());
      otherReasonControllers.add(TextEditingController());
      academicSupervisorControllers.add(TextEditingController());
    }
  }

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

                // Section: Delete Course Requests
                const Text(
                  'Delete Course Requests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deletionRequestCount,
                  itemBuilder: (context, index) {
                    return buildCourseDeletionFields(index);
                  },
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

  // Helper function to build deletion fields for each course
  Widget buildCourseDeletionFields(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField('Course Code', courseCodeControllers[index]),
        buildTextField('Course Name', courseNameControllers[index]),
        buildTextField('Workload Before Deletion',
            workloadBeforeDeletionControllers[index]),
        buildTextField(
            'Workload After Deletion', workloadAfterDeletionControllers[index]),
        const Text('Reason for Deletion'),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'Conflict', child: Text('Conflict')),
            DropdownMenuItem(value: 'Social', child: Text('Social')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
          onChanged: (value) {
            reasonForDeletionControllers[index].text = value ?? '';
          },
        ),
        const SizedBox(height: 10),
        buildTextField(
            'If Other, Please Explain', otherReasonControllers[index]),
        buildTextField(
            'Academic Supervisor', academicSupervisorControllers[index]),
        const SizedBox(height: 20),
      ],
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
              pw.Divider(
                indent: 20,
                endIndent: 50,
                thickness: 2,
                height: 2,
              ),

              pw.Text(
                'المواد سوف يتم حذفها ',
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic),
              ),
              pw.Divider(
                indent: 20,
                endIndent: 50,
                thickness: 2,
                height: 2,
              ),

              pw.Text(
                'المواد سوف يتم اضافتها ',
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    font: ttfArabic),
              ),
              pw.Divider(
                indent: 20,
                endIndent: 50,
                thickness: 2,
                height: 2,
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
