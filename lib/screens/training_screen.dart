import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
import '../widgets/course_card.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training & Courses')),
      body: Consumer<JobProvider>(
        builder: (context, provider, child) {
          return provider.isLoadingCourses
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: provider.loadCourses,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: provider.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CourseCard(course: provider.courses[index]),
                    );
                  },
                ),
              );
        },
      ),
    );
  }
}
