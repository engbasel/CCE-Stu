import 'package:cce_app/Futures/Home/widget/CommonNewsSectionItem.dart';
import 'package:cce_app/Futures/Home/widget/NewsDetailsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommonNewsSection extends StatelessWidget {
  const CommonNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference newsCollection =
        FirebaseFirestore.instance.collection('student_activities');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Common News',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // add font ropoto to this section
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  newsCollection.orderBy('date', descending: true).snapshots(),
              builder: (context, snapshot) {
                final isLoading =
                    snapshot.connectionState == ConnectionState.waiting;

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No news available at the moment.',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                final newsList = snapshot.data!.docs;

                return Skeletonizer(
                  enabled: isLoading,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news =
                          newsList[index].data() as Map<String, dynamic>;
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
