class Course {
  final String code;
  final String name;
  final int creditHours;
  final String professor;
  final String prerequisite;

  Course({
    required this.code,
    required this.name,
    required this.creditHours,
    required this.professor,
    required this.prerequisite,
  });
}

final Map<String, Map<String, List<Course>>> AcadimicCousresData = {
  'Level 000': {
    'Semester 1': [
      Course(
          code: 'BAS011',
          name: 'Mathematics (1)',
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'BAS021',
          name: 'Physics (1)',
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'BAS031',
          name: 'Chemistry',
          creditHours: 2,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'BAS041',
          name: 'English (1)',
          creditHours: 2,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
        code: 'PDE052',
        name: 'Engineering Drawing',
        creditHours: 2,
        professor: 'Dr. Mona',
        prerequisite: '',
      ),
      Course(
          code: 'UNR061',
          name: 'Arabic Language',
          creditHours: 2,
          professor: 'Dr. Hisham',
          prerequisite: ''),
    ],
    'Semester 2': [
      Course(
          code: 'BAS012',
          name: 'رياضيات (2)', // Mathematics (2)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'BAS022',
          name: 'ميكانيكا (2)', // Mechanics (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'BAS032',
          name: 'فيزياء (2)', // Physics (2)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'CSE042',
          name: 'مقدمة لنظم الحاسب', // Introduction to Computer Systems
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'PDE051',
          name:
              'مبادئ هندسة التصنيع', // Principles of Manufacturing Engineering
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'UNR062',
          name: 'لغة إنجليزية (2)', // English Language (2)
          creditHours: 2,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
  'Level 100': {
    'Semester 1': [
      Course(
          code: 'BAS 012',
          name: 'رياضيات (3)', // Mathematics (2)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'UNR 061',
          name: 'كتابة التقارير الفنية', // Technical Report Writing
          creditHours: 2,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'UNR 171',
          name:
              'تاريخ الهندسة والتكنولوجيا', // History of Engineering and Technology
          creditHours: 1,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'BAS 032',
          name: 'دوائر كهربية', // Electric Circuits
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 042',
          name: 'تصميم رقمي (1)', // Digital Design (1)
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'BAS 031',
          name: 'الكترونيات الجوامد', // Solid State Electronics
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ],
    'Semester 2': [
      Course(
          code: 'BAS 114',
          name: 'رياضيات (4)', // Mathematics (4)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'BAS 115',
          name:
              'نظرية الاحتمالات والإحصاء', // Probability and Statistics Theory
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'CSE 112',
          name: 'خوارزميات و هياكل بيانات', // Algorithms and Data Structures
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'ECE 131',
          name: 'إشارات ومنظومات', // Signals and Systems
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'ECE 123',
          name: 'قوى والات كهربية', // Electrical Power and Machines
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'ELE 151',
          name: 'دوائر إلكترونية رقمية', // Digital Electronic Circuits
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
  'Level 200': {
    'Semester 1': [
      Course(
          code: 'BAS 113',
          name: 'رياضيات (5)', // Mathematics (5)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'CSE 141',
          name: 'تصميم رقمي (2)', // Digital Design (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'CSE 112',
          name: 'أنظمة قواعد البيانات', // Database Systems
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'ECE 131',
          name: 'معالجة الإشارات الرقمية', // Digital Signal Processing
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'UNR 241',
          name:
              'مهارات الاتصال والعرض', // Communication and Presentation Skills
          creditHours: 2,
          professor: 'Dr. Mona',
          prerequisite: '')
    ],
    'Semester 2': [
      Course(
          code: 'CSE 221',
          name: 'تصميم معماري للحاسب (1)', // Computer Architecture Design (1)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'CSE 213',
          name: 'معمارية الحاسب', // Computer Architecture
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'ECE 232',
          name: 'ميكانيكا الكم', // Quantum Mechanics
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'ECE 221',
          name: 'دوائر منطقية رقمية', // Digital Logic Circuits
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'UNR 281',
          name: 'القانون وحقوق الإنسان', // Law and Human Rights
          creditHours: 2,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'CCE 271',
          name: 'التدريب الميداني (1)', // Field Training (1)
          creditHours: 1,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
  'Level 300': {
    'Semester 1': [
      Course(
          code: 'CSE 311',
          name: 'نظم التشغيل', // Operating Systems
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'ECE 331',
          name: 'نظم الاتصالات الرقمية', // Digital Communication Systems
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'CSE 313',
          name: 'معماريات الحاسب الدقيقة', // Microprocessor Architectures
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'ECE 341',
          name: 'مجالات كهرومغناطيسية', // Electromagnetic Fields
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 312',
          name: 'قواعد البيانات', // Databases
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: '')
    ],
    'Semester 2': [
      Course(
          code: 'ECE 342',
          name: 'الموجات والدوائر', // Waves and Circuits
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (2)', // Elective Course (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (3)', // Elective Course (3)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'CSE 315',
          name: 'النظريات الاحتمالية', // Probability Theory
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 314',
          name: 'رسوم بالحاسب', // Computer Graphics
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'CCE 371',
          name: 'التدريب الميداني (2)', // Field Training (2)
          creditHours: 1,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
  'Level 400': {
    'Semester 1': [
      Course(
          code: 'CCE 481',
          name: 'مشروع تخرج (1)', // Graduation Project (1)
          creditHours: 9,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'ECE 431',
          name: 'اتصالات المحمول', // Mobile Communications
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (7)', // Elective Course (7)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (8)', // Elective Course (8)
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 411',
          name: 'تقنيات البرمجة المتقدمة', // Advanced Programming Techniques
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'UNR 461',
          name: 'آداب واخلاقيات المهنة', // Ethics and Professionalism
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: ''),
      Course(
          code: 'ENG 412',
          name: 'إدارة مشروعات', // Project Management
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: '')
    ],
    'Semester 2': [
      Course(
          code: 'CCE 482',
          name: 'مشروع تخرج (2)', // Graduation Project (2)
          creditHours: 9,
          professor: 'Dr. Ahmed',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (5)', // Elective Course (5)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (6)', // Elective Course (6)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'CSE 421',
          name: 'الشبكات الحاسوبية', // Computer Networks
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 422',
          name: 'الأنظمة الذكية', // Intelligent Systems
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: ''),
      Course(
          code: 'UNR 471',
          name: 'القانون وحقوق الملكية الفكرية', // Intellectual Property Law
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
};
