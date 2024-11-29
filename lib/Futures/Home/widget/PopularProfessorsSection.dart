import 'package:cce_app/Futures/Home/widget/ProfessorDetailsScreen.dart';
import 'package:flutter/material.dart';

class PopularProfessorsSection extends StatelessWidget {
  const PopularProfessorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated real data for professors
    final professorsList = [
      {
        'name': 'Dr. Ahmed Saleh',
        'department': 'Computer Engineering',
        'rating': 4.9,
        'bio':
            'Dr. Ahmed Saleh is a renowned professor specializing in Artificial Intelligence and Machine Learning with over 20 years of teaching experience.',
      },
      {
        'name': 'Dr. Sara Ayad',
        'department': 'Electronics and Communications',
        'rating': 4.8,
        'bio':
            'Dr. Sara Ayad focuses on VLSI design and embedded systems. She has published numerous research papers in international journals.',
      },
      {
        'name': 'Dr. Mohamed Fathy',
        'department': 'Computer Engineering',
        'rating': 4.7,
        'bio':
            'Dr. Mohamed Fathy is an expert in Networking and Security. He has contributed significantly to cloud security research.',
      },
      {
        'name': 'Dr. Hala Ebrahim',
        'department': 'Electronics and Communications',
        'rating': 4.6,
        'bio':
            'Dr. Hala Ebrahim has expertise in wireless communication systems and antenna design, with numerous accolades in her field.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Professors',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: professorsList.length,
            itemBuilder: (context, index) {
              final professor = professorsList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfessorDetailsScreen(professor: professor),
                    ),
                  );
                },
                child: Container(
                  width: 220,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.blue.shade100,
                          child: Text(
                            '${professor['name']}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${professor['name']}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${professor['department']!}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey.shade600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              professor['rating'].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
