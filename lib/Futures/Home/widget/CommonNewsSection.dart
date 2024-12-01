import 'package:flutter/material.dart';

class CommonNewsSection extends StatelessWidget {
  const CommonNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated mock data for Mansoura University Faculty of Engineering
    final newsList = [
      {
        'title': 'AI Workshop Announcement',
        'date': '2024-12-05',
        'content':
            'Attend the AI workshop conducted by Dr. Ahmed Saleh in Hall A.',
        'details':
            'The Faculty of Engineering invites students and faculty members to an AI workshop on December 5th, 2024, in Hall A. Topics covered include AI fundamentals, applications, and hands-on practice. Don’t miss it!',
      },
      {
        'title': 'New Course: Advanced Flutter',
        'date': '2024-11-28',
        'content':
            'Enroll in the Advanced Flutter course starting this December.',
        'details':
            'The Computer Engineering department is excited to announce a new Advanced Flutter course. The course starts in December and covers advanced mobile app development techniques. Registration is open now.',
      },
      {
        'title': 'Winter Break Notice',
        'date': '2024-12-15',
        'content':
            'The university will be closed for winter break starting December 15.',
        'details':
            'The Faculty of Engineering will be on winter break starting December 15th, 2024. All lectures and exams scheduled for this period are postponed. The university will resume activities on January 2nd, 2025.',
      },
      {
        'title': 'New Course: Advanced Flutter',
        'date': '2024-11-28',
        'content':
            'Enroll in the Advanced Flutter course starting this December.',
        'details':
            'The Computer Engineering department is excited to announce a new Advanced Flutter course. The course starts in December and covers advanced mobile app development techniques. Registration is open now.',
      },
      {
        'title': 'New Course: Advanced Flutter',
        'date': '2024-11-28',
        'content':
            'Enroll in the Advanced Flutter course starting this December.',
        'details':
            'The Computer Engineering department is excited to announce a new Advanced Flutter course. The course starts in December and covers advanced mobile app development techniques. Registration is open now.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Common News',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(news: news),
                    ),
                  );
                },
                child: Container(
                  width: 250,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          news['content']!,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          news['date']!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey),
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

class NewsDetailsScreen extends StatelessWidget {
  final Map<String, String> news;

  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news['title']!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${news['date']}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Details:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              news['details']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
