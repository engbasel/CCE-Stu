import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/widgets/CoustomCircularProgressIndicator.dart';
import 'package:cce_app/Futures/Home/widget/EventDetailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsandDeadlinesSection extends StatelessWidget {
  const EventsandDeadlinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference deadlinesCollection =
        FirebaseFirestore.instance.collection('events');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Upcoming Deadlines & Events:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        StreamBuilder<QuerySnapshot>(
          stream: deadlinesCollection
              .orderBy('date', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CoustomCircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No upcoming deadlines or events.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            final deadlines = snapshot.data!.docs;

            return ListOfCommingUpEventsandDeadlinesSection(
                deadlines: deadlines);
          },
        ),
      ],
    );
  }
}

class ListOfCommingUpEventsandDeadlinesSection extends StatelessWidget {
  const ListOfCommingUpEventsandDeadlinesSection({
    super.key,
    required this.deadlines,
  });

  final List<QueryDocumentSnapshot<Object?>> deadlines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: deadlines.length,
      itemBuilder: (context, index) {
        final deadline = deadlines[index].data() as Map<String, dynamic>;
        final String id = deadlines[index].id;
        final String title = deadline['title'] ?? 'No Title';
        final DateTime date = (deadline['date'] as Timestamp).toDate();
        final String formattedDate =
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          elevation: 2,
          child: ItemOfUpCommingList(
              title: title, formattedDate: formattedDate, id: id),
        );
      },
    );
  }
}

class ItemOfUpCommingList extends StatelessWidget {
  const ItemOfUpCommingList({
    super.key,
    required this.title,
    required this.formattedDate,
    required this.id,
  });

  final String title;
  final String formattedDate;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.event,
        color: ColorsManager.billIconColor,
      ),
      title: Text(
        title,
        style: TextStyle(color: Color(0xff808080)),
      ),
      subtitle: Text(
        formattedDate,
        style: TextStyle(color: Color(0xff808080)),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(eventId: id),
          ),
        );
      },
    );
  }
}
