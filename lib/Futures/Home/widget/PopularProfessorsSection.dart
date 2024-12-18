import 'package:cce_app/Core/utlis/utilis.dart';
import 'package:cce_app/Core/widgets/CoustomCircularProgressIndicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ProfessorDetailsScreen.dart';

class PopularProfessorsSection extends StatelessWidget {
  final ScreenUtils screenUtils = ScreenUtils();

  @override
  Widget build(BuildContext context) {
    // Fetch professors collection from Firebase
    final CollectionReference professorsRef =
        FirebaseFirestore.instance.collection('PopularProfessors');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Professors',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: StreamBuilder<QuerySnapshot>(
            stream: professorsRef.snapshots(), // Real-time updates
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CoustomCircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error fetching data.'));
              }
              final professorsList = snapshot.data?.docs ?? [];

              if (professorsList.isEmpty) {
                return const Center(child: Text('No professors available.'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: professorsList.length,
                itemBuilder: (context, index) {
                  final professorData =
                      professorsList[index].data() as Map<String, dynamic>;

                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfessorDetailsScreen(
                                professor: professorData),
                          ),
                        );
                      },
                      child: Container(
                        width: 220,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.blue.shade50],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CircleAvatar with initials
                              CircleAvatar(
                                // will repalce this with Prof Image
                                radius: 28,
                                backgroundColor: Colors.blue.shade100,
                                child: Text(
                                  // will replace with photo of prefeser
                                  ScreenUtils.getInitials(
                                      professorData['name']),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Professor Name
                              Text(
                                professorData['name'] ?? 'No Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              // Department
                              Text(
                                professorData['department'] ?? 'No Department',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.grey.shade700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              // Rating
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    professorData['rating'] ??
                                        'No rating Given',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey.shade700),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
