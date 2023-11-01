import 'package:flutter/foundation.dart';
import '../models/job.dart';
import '../models/user_profile.dart';
import '../models/training_course.dart';
import '../services/job_service.dart';

class JobProvider with ChangeNotifier {
  final JobService _jobService = JobService();

  // Jobs state
  List<Job> _jobs = [];
  List<Job> _recommendedJobs = [];
  final List<Job> _savedJobs = [];
  bool _isLoadingJobs = false;
  String? _jobsError;

  // Training courses state
  List<TrainingCourse> _courses = [];
  List<TrainingCourse> _recommendedCourses = [];
  bool _isLoadingCourses = false;
  String? _coursesError;

  // User profile state
  UserProfile? _userProfile;
  bool _isLoadingProfile = false;
  String? _profileError;

  // Search and filter state
  String _searchQuery = '';
  String _selectedLocation = '';
  String _selectedJobType = '';
  String _selectedExperience = '';

  // Getters
  List<Job> get jobs => _jobs;
  List<Job> get recommendedJobs => _recommendedJobs;
  List<Job> get savedJobs => _savedJobs;
  bool get isLoadingJobs => _isLoadingJobs;
  String? get jobsError => _jobsError;

  List<TrainingCourse> get courses => _courses;
  List<TrainingCourse> get recommendedCourses => _recommendedCourses;
  bool get isLoadingCourses => _isLoadingCourses;
  String? get coursesError => _coursesError;

  UserProfile? get userProfile => _userProfile;
  bool get isLoadingProfile => _isLoadingProfile;
  String? get profileError => _profileError;

  String get searchQuery => _searchQuery;
  String get selectedLocation => _selectedLocation;
  String get selectedJobType => _selectedJobType;
  String get selectedExperience => _selectedExperience;

  // Job methods
  Future<void> loadJobs() async {
    _isLoadingJobs = true;
    _jobsError = null;
    notifyListeners();

    try {
      _jobs = await _jobService.fetchJobs();
    } catch (e) {
      _jobsError = e.toString();
    } finally {
      _isLoadingJobs = false;
      notifyListeners();
    }
  }

  Future<void> loadRecommendedJobs() async {
    if (_userProfile == null) return;

    try {
      _recommendedJobs = await _jobService.fetchRecommendedJobs(_userProfile!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading recommended jobs: $e');
    }
  }

  void toggleSaveJob(Job job) {
    if (_savedJobs.any((savedJob) => savedJob.id == job.id)) {
      _savedJobs.removeWhere((savedJob) => savedJob.id == job.id);
    } else {
      _savedJobs.add(job);
    }
    notifyListeners();
  }

  bool isJobSaved(Job job) {
    return _savedJobs.any((savedJob) => savedJob.id == job.id);
  }

  // Training courses methods
  Future<void> loadCourses() async {
    _isLoadingCourses = true;
    _coursesError = null;
    notifyListeners();

    try {
      _courses = await _jobService.fetchCourses();
    } catch (e) {
      _coursesError = e.toString();
    } finally {
      _isLoadingCourses = false;
      notifyListeners();
    }
  }

  Future<void> loadRecommendedCourses() async {
    if (_userProfile == null) return;

    try {
      _recommendedCourses = await _jobService.fetchRecommendedCourses(
        _userProfile!,
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading recommended courses: $e');
    }
  }

  // User profile methods
  Future<void> loadUserProfile() async {
    _isLoadingProfile = true;
    _profileError = null;
    notifyListeners();

    try {
      _userProfile = await _jobService.fetchUserProfile();
      if (_userProfile != null) {
        loadRecommendedJobs();
        loadRecommendedCourses();
      }
    } catch (e) {
      _profileError = e.toString();
    } finally {
      _isLoadingProfile = false;
      notifyListeners();
    }
  }

  Future<void> updateUserProfile(UserProfile profile) async {
    try {
      _userProfile = await _jobService.updateUserProfile(profile);
      loadRecommendedJobs();
      loadRecommendedCourses();
      notifyListeners();
    } catch (e) {
      debugPrint('Error updating user profile: $e');
    }
  }

  // Search and filter methods
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void updateLocationFilter(String location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void updateJobTypeFilter(String jobType) {
    _selectedJobType = jobType;
    notifyListeners();
  }

  void updateExperienceFilter(String experience) {
    _selectedExperience = experience;
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedLocation = '';
    _selectedJobType = '';
    _selectedExperience = '';
    notifyListeners();
  }

  List<Job> get filteredJobs {
    List<Job> filtered = List.from(_jobs);

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered =
          filtered.where((job) {
            return job.title.toLowerCase().contains(query) ||
                job.company.toLowerCase().contains(query) ||
                job.location.toLowerCase().contains(query) ||
                job.description.toLowerCase().contains(query) ||
                job.skills.any((skill) => skill.toLowerCase().contains(query));
          }).toList();
    }

    // Apply location filter
    if (_selectedLocation.isNotEmpty) {
      filtered =
          filtered
              .where(
                (job) => job.location.toLowerCase().contains(
                  _selectedLocation.toLowerCase(),
                ),
              )
              .toList();
    }

    // Apply job type filter
    if (_selectedJobType.isNotEmpty) {
      filtered =
          filtered
              .where(
                (job) =>
                    job.jobType.toLowerCase() == _selectedJobType.toLowerCase(),
              )
              .toList();
    }

    // Apply experience level filter
    if (_selectedExperience.isNotEmpty) {
      filtered =
          filtered
              .where(
                (job) =>
                    job.experience.toLowerCase() ==
                    _selectedExperience.toLowerCase(),
              )
              .toList();
    }

    return filtered;
  }
}
