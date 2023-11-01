import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/job_provider.dart';
import '../widgets/job_card.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Jobs')),
      body: Consumer<JobProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search jobs...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: provider.updateSearchQuery,
                ),
              ),
              // Filter Options
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildFilterChip(
                      'Remote',
                      provider.selectedJobType == 'Remote',
                      () => provider.updateJobTypeFilter(
                        provider.selectedJobType == 'Remote' ? '' : 'Remote',
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildFilterChip(
                      'Full-time',
                      provider.selectedJobType == 'Full-time',
                      () => provider.updateJobTypeFilter(
                        provider.selectedJobType == 'Full-time'
                            ? ''
                            : 'Full-time',
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildFilterChip(
                      'Entry-level',
                      provider.selectedExperience == 'Entry-level',
                      () => provider.updateExperienceFilter(
                        provider.selectedExperience == 'Entry-level'
                            ? ''
                            : 'Entry-level',
                      ),
                    ),
                  ],
                ),
              ),
              // Job List
              Expanded(
                child:
                    provider.isLoadingJobs
                        ? const Center(child: CircularProgressIndicator())
                        : provider.jobsError != null
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 64,
                                color: AppColors.error,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                provider.jobsError!,
                                style: const TextStyle(
                                  color: AppColors.error,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: provider.loadJobs,
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                        : RefreshIndicator(
                          onRefresh: provider.loadJobs,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: provider.filteredJobs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: JobCard(
                                  job: provider.filteredJobs[index],
                                ),
                              );
                            },
                          ),
                        ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.cardLight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.divider,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textLight : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
