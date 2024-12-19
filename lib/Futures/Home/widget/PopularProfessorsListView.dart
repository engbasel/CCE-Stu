import 'package:cce_app/Core/widgets/CustomErrorWidget.dart';
import 'package:cce_app/Futures/Home/widget/PopularProfessorsItem.dart';
import 'package:cce_app/Futures/Home/widget/ProfessorDetailsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularProfessorsListView extends StatelessWidget {
  const PopularProfessorsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference professorsRef =
        FirebaseFirestore.instance.collection('PopularProfessors');

    return StreamBuilder<QuerySnapshot>(
      stream: professorsRef.snapshots(),
      builder: (context, snapshot) {
        final _loading = snapshot.connectionState == ConnectionState.waiting;

        if (snapshot.hasError) {
          return CustomErrorWidget(
            errorMessage: 'Error fetching professors',
            onRetry: () {},
          );
        }

        final professorsList = snapshot.data?.docs ?? [];

        if (!_loading && professorsList.isEmpty) {
          return CustomErrorWidget(
            errorMessage: 'No professors available.',
            onRetry: () {},
          );
        }

        return Skeletonizer(
          enabled: _loading,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _loading ? 7 : professorsList.length,
            itemBuilder: (context, index) {
              if (_loading) {
                return Card(
                  child: ListTile(
                    title: Text('Loading item $index'),
                    subtitle: const Text('Loading subtitle'),
                    trailing: const Icon(Icons.ac_unit),
                  ),
                );
              }

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
          ),
        );
      },
    );
  }
}
