import 'package:cce_app/Core/widgets/CoustomCircularProgressIndicator.dart';
import 'package:cce_app/Core/widgets/CustomErrorWidget.dart';
import 'package:cce_app/Futures/Home/widget/PopularProfessorsItem.dart';
import 'package:cce_app/Futures/Home/widget/ProfessorDetailsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopularProfessorsListView extends StatelessWidget {
  const PopularProfessorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference professorsRef =
        FirebaseFirestore.instance.collection('PopularProfessors');

    return StreamBuilder<QuerySnapshot>(
      stream: professorsRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CoustomCircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return CustomErrorWidget(
            errorMessage: 'Error To Feach professors',
            onRetry: () {},
          );
        }

        final professorsList = snapshot.data?.docs ?? [];

        if (professorsList.isEmpty) {
          return CustomErrorWidget(
            errorMessage: 'No professors available.',
            onRetry: () {},
          );
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
                    builder: (context) =>
                        ProfessorDetailsScreen(professor: professorData),
                  ),
                );
              },
              child: PopularProfessorsItem(professorData: professorData),
            );
          },
        );
      },
    );
  }
}
