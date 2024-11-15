import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OpenCourseRequest extends StatelessWidget {
  const OpenCourseRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Course Request'),
        actions: [
          IconButton(
            onPressed: () async {
              // Generate and print the PDF
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
                // Section: Student Information
                const Text(
                  'Student Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                buildTextField('Name'),
                buildTextField('Student ID'),
                buildTextField('Phone Number'),
                buildTextField('Study Level'),
                buildTextField('Program (e.g., CCE)'),
                buildTextField('Academic Year'),
                buildTextField('Semester GPA'),
                buildTextField('Cumulative GPA'),
                buildTextField('Completed Credit Hours'),
                const SizedBox(height: 20),

                // Section: Add Course Requests
                const Text(
                  'Add Course Requests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                buildCourseFields('Add Course'),
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
                  itemCount: 2, // Adjust for the number of deletions
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        buildTextField('Course Code'),
                        buildTextField('Course Name'),
                        buildTextField('Workload Before Deletion'),
                        buildTextField('Workload After Deletion'),
                        const Text('Reason for Deletion'),
                        const SizedBox(height: 5),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: 'Conflict', child: Text('Conflict')),
                            DropdownMenuItem(
                                value: 'Social', child: Text('Social')),
                            DropdownMenuItem(
                                value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 10),
                        buildTextField('If Other, Please Explain'),
                        buildTextField('Academic Supervisor'),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),

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
  Widget buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  // Helper function to build course input fields
  Widget buildCourseFields(String section) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // Adjust for the number of additions
      itemBuilder: (context, index) {
        return Column(
          children: [
            buildTextField('Course Code'),
            buildTextField('Course Name'),
            buildTextField('Credit Hours'),
            buildTextField('Prerequisite Course'),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();

    // Load the custom Arabic font
    final fontArabic = await rootBundle.load("fonts/Amiri-Regular.ttf");
    final ttfArabic = pw.Font.ttf(fontArabic);

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header with Arabic and English text
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Column(
                    children: [
                      // Arabic Header using custom font
                      pw.Text(
                        'جامعة المنصورة',
                        style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            font: ttfArabic),
                        textDirection: pw.TextDirection.rtl,
                      ),
                      pw.Text(
                        'كلية الهندسة',
                        style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            font: ttfArabic),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    children: [
                      // English Header
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
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'نموذج جذف او اضافة اليكتروني',
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      font: ttfArabic),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.SizedBox(height: 20),

              // Student Information Section
              pw.Text('Student Information',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                'Name: [Enter Name]',
                textDirection: pw.TextDirection.rtl,
              ),
              pw.Text(
                'Student ID: [Enter Student ID]',
                textDirection: pw.TextDirection.rtl,
              ),
              pw.Text(
                'Phone Number: [Enter Phone Number]',
                textDirection: pw.TextDirection.rtl,
              ),
              // Add more fields here as needed
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
