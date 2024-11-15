import 'package:flutter/material.dart';

class OpenCourseRequest extends StatelessWidget {
  const OpenCourseRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Course Request'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle print functionality
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
                _buildTextField('Name'),
                _buildTextField('Student ID'),
                _buildTextField('Phone Number'),
                _buildTextField('Study Level'),
                _buildTextField('Program (e.g., CCE)'),
                _buildTextField('Academic Year'),
                _buildTextField('Semester GPA'),
                _buildTextField('Cumulative GPA'),
                _buildTextField('Completed Credit Hours'),
                const SizedBox(height: 20),

                // Section: Add Course Requests
                const Text(
                  'Add Course Requests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                _buildCourseFields('Add Course'),
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
                        _buildTextField('Course Code'),
                        _buildTextField('Course Name'),
                        _buildTextField('Workload Before Deletion'),
                        _buildTextField('Workload After Deletion'),
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
                        _buildTextField('If Other, Please Explain'),
                        _buildTextField('Academic Supervisor'),
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
  Widget _buildTextField(String label) {
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
  Widget _buildCourseFields(String section) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // Adjust for the number of additions
      itemBuilder: (context, index) {
        return Column(
          children: [
            _buildTextField('Course Code'),
            _buildTextField('Course Name'),
            _buildTextField('Credit Hours'),
            _buildTextField('Prerequisite Course'),
            const SizedBox(height: 10),
          ],
        );
      },
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
