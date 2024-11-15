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
          prerequisite: 'No Prerequisite  '),
      Course(
          code: 'BAS021',
          name: 'Physics (1)',
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'No Prerequisite'),
      Course(
          code: 'BAS031',
          name: 'Chemistry',
          creditHours: 2,
          professor: 'Dr. Amina',
          prerequisite: 'No Prerequisite'),
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
        prerequisite: 'No Prerequisite',
      ),
      Course(
          code: 'UNR061',
          name: 'Arabic Language',
          creditHours: 2,
          professor: 'Dr. Hisham',
          prerequisite: 'No Prerequisite'),
    ],
    'Semester 2': [
      Course(
          code: 'BAS012',
          name: 'رياضيات (2)', // Mathematics (2)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'Mathematics (1)'),
      Course(
          code: 'BAS022',
          name: 'ميكانيكا (2)', // Mechanics (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'ميكانيكا (1)'),
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
          prerequisite: 'لغة إنجليزية (1)')
    ]
  },
  'Level 100': {
    'Semester 1': [
      Course(
          code: 'BAS 012',
          name: 'رياضيات (3)', // Mathematics (2)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'رياضيات (2)'),
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
          prerequisite: 'فيزياء (2)'),
      Course(
          code: 'CSE 042',
          name: 'تصميم رقمي (1)', // Digital Design (1)
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'مقدمة في نظم الحاسب'),
      Course(
          code: 'BAS 031',
          name: 'الكترونيات الجوامد', // Solid State Electronics
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: 'فيزياء ( 2)')
    ],
    'Semester 2': [
      Course(
          code: 'BAS 114',
          name: 'رياضيات (4)', // Mathematics (4)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'رياضيات (3)'),
      Course(
          code: 'BAS 115',
          name:
              'نظرية الاحتمالات والإحصاء', // Probability and Statistics Theory
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'رياضيات (2)'),
      Course(
          code: 'CSE 112',
          name: 'خوارزميات و هياكل بيانات', // Algorithms and Data Structures
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: 'مقدمة في نظم الحاسب'),
      Course(
          code: 'ECE 131',
          name: 'إشارات ومنظومات', // Signals and Systems
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'رياضيات (3)'),
      Course(
          code: 'ECE 123',
          name: 'قوى والات كهربية', // Electrical Power and Machines
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'دوائر كهربية'),
      Course(
          code: 'ELE 151',
          name: ' اساسيات إلكترونية  ', // Digital Electronic Circuits
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: ' اليكترونيات الجوامد - دوائر كهربية')
    ]
  },
  'Level 200': {
    'Semester 1': [
      Course(
          code: 'BAS 113',
          name: 'رياضيات (5)', // Mathematics (5)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'رياضيات 3'),
      Course(
          code: 'CSE 141',
          name: 'تصميم رقمي (2)', // Digital Design (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'تصميم رقمي (1)'),
      Course(
          code: 'CSE 112',
          name: 'أنظمة قواعد البيانات', // Database Systems
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ' مقدمة لنظم الحاسب الالي - خورازميات وهياكل بيانات'),
      Course(
          code: 'ECE 131',
          name: 'معالجة الإشارات الرقمية', // Digital Signal Processing
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'اشارات ومنظومات'),
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
          name: 'نظم الاتصالات التماثلية', // Computer Architecture Design (1)
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'اشارات ومنظومات'),
      Course(
          code: 'CSE 213',
          name: 'معمارية الحاسب', // Computer Architecture
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'تصميم رقمي 2'),
      Course(
          code: 'ECE 232',
          name: ' تحكم', // Quantum Mechanics
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: 'رياضيات 3'),
      Course(
          code: 'ECE 221',
          name: 'دوائر اليكترونية ', // Digital Logic Circuits
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'اساسيات اليكترونية'),
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
          prerequisite: 'تصميم رقمي 2'),
      Course(
          code: 'ECE 331',
          name: 'نظم الاتصالات الرقمية', // Digital Communication Systems
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: 'نظم الاتصالات التماثلية'),
      Course(
          code: 'CSE 313',
          name: ' معالجات الدقيقة', // Microprocessor Architectures
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: 'معمار الحاسب '),
      Course(
          code: 'ECE 341',
          name: 'مجالات كهرومغناطيسية', // Electromagnetic Fields
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'رياضيات 3- دوائر كهربية'),
      Course(
          code: 'CSE 312',
          name: ' شبكات الحاسب', // Databases
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'مقدمة لنظم الحاسب')
    ],
    'Semester 2': [
      Course(
          code: 'ECE 342',
          name: 'المرشدات الهوائيات', // Waves and Circuits
          creditHours: 3,
          professor: 'Dr. Ahmed',
          prerequisite: 'مجالات كهرومغناطيسية'),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (1)', // Elective Course (2)
          creditHours: 3,
          professor: 'Dr. Sara',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (2)', // Elective Course (3)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'CSE 315',
          name: 'الانظمة المتضمنة', // Probability Theory
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'معمار الحاسب'),
      Course(
          code: 'CSE 314',
          name: 'رسوم بالحاسب', // Computer Graphics
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'مقدمة لنظم الحاسب'),
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
          prerequisite: 'نظم الاتصالات الرقمية'),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (3)', // Elective Course (7)
          creditHours: 3,
          professor: 'Dr. Amina',
          prerequisite: ''),
      Course(
          code: 'Elective',
          name: 'مقرر اختياري (4)', // Elective Course (8)
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: ''),
      Course(
          code: 'CSE 411',
          name: 'تقنيات البرمجة المتقدمة', // Advanced Programming Techniques
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'مقدمة في نظم الحاسب'),
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
          name: ' التحكم المنطقي المبرمج', // Computer Networks
          creditHours: 3,
          professor: 'Dr. Khalid',
          prerequisite: 'تحكم 1'),
      Course(
          code: 'CSE 422',
          name: ' الذكاء الاصطناعي', // Intelligent Systems
          creditHours: 3,
          professor: 'Dr. Mona',
          prerequisite: 'خوارزمية  وهياكل البيانات'),
      Course(
          code: 'UNR 471',
          name: 'التسويق', // Intellectual Property Law
          creditHours: 3,
          professor: 'Dr. Hisham',
          prerequisite: '')
    ]
  },
};
