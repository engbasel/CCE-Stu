import 'package:cce_app/Core/utlis/utilis.dart';
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
                return const Center(child: CircularProgressIndicator());
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

class CommonNewsSectionItem extends StatelessWidget {
  const CommonNewsSectionItem({
    super.key,
    required this.title,
    required this.content,
    required this.formattedDate,
  });

  final String title;
  final String content;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/splash/CCE.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ScreenUtils.formatText(title, 2),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  ScreenUtils.formatText(
                    content,
                    10,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  ScreenUtils.formatText(
                    formattedDate,
                    2,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
