import 'package:cce_app/Core/widgets/CoustomCircularProgressIndicator.dart';
import 'package:cce_app/Futures/Home/widget/CommonNewsSectionItem.dart';
import 'package:cce_app/Futures/Home/widget/NewsDetailsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommonNewsSection extends StatelessWidget {
  const CommonNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference newsCollection =
        FirebaseFirestore.instance.collection('student_activities');

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
          height: 180,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                newsCollection.orderBy('date', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CoustomCircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'No news available at the moment.',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              final newsList = snapshot.data!.docs;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index].data() as Map<String, dynamic>;
                  final String title = news['title'] ?? 'No Title';
                  final String content =
                      news['description'] ?? 'No description';

                  // Fix for Timestamp conversion
                  final Timestamp timestamp = news['date'] as Timestamp;
                  final DateTime dateTime = timestamp.toDate();
                  final String formattedDate =
                      '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            news: news,
                          ),
                        ),
                      );
                    },
                    child: CommonNewsSectionItem(
                      title: title,
                      content: content,
                      formattedDate: formattedDate,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
