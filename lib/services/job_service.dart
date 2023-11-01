import 'dart:math';
import '../models/job.dart';
import '../models/user_profile.dart';
import '../models/training_course.dart';

class JobService {
  // Mock data for demonstration - in a real app, these would be API calls

  Future<List<Job>> fetchJobs() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Job(
        id: '1',
        title: 'Flutter Developer',
        company: 'TechCorp',
        location: 'Cape Town, South Africa',
        description:
            'We are looking for a skilled Flutter developer to join our mobile development team...',
        salaryRange: 'R45,000 - R65,000',
        jobType: 'Full-time',
        experience: 'Mid-level',
        skills: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
        postedDate: DateTime.now().subtract(const Duration(days: 2)),
        companyLogo: '',
        isRemote: true,
        isFeatured: true,
        applicationUrl: 'https://example.com/apply/1',
      ),
      Job(
        id: '2',
        title: 'Senior Software Engineer',
        company: 'InnovateTech',
        location: 'Johannesburg, South Africa',
        description:
            'Join our team as a Senior Software Engineer working on cutting-edge projects...',
        salaryRange: 'R70,000 - R90,000',
        jobType: 'Full-time',
        experience: 'Senior',
        skills: ['Python', 'Django', 'AWS', 'Docker'],
        postedDate: DateTime.now().subtract(const Duration(days: 1)),
        companyLogo: '',
        isRemote: false,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/2',
      ),
      Job(
        id: '3',
        title: 'UI/UX Designer',
        company: 'DesignStudio',
        location: 'Durban, South Africa',
        description:
            'We need a creative UI/UX designer to enhance our digital products...',
        salaryRange: 'R35,000 - R50,000',
        jobType: 'Contract',
        experience: 'Mid-level',
        skills: ['Figma', 'Adobe XD', 'Sketch', 'Prototyping'],
        postedDate: DateTime.now().subtract(const Duration(days: 3)),
        companyLogo: '',
        isRemote: true,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/3',
      ),
      Job(
        id: '4',
        title: 'Data Scientist',
        company: 'DataCorp',
        location: 'Remote',
        description:
            'Analyze complex datasets and build machine learning models...',
        salaryRange: 'R60,000 - R80,000',
        jobType: 'Full-time',
        experience: 'Senior',
        skills: ['Python', 'Machine Learning', 'SQL', 'TensorFlow'],
        postedDate: DateTime.now().subtract(const Duration(hours: 12)),
        companyLogo: '',
        isRemote: true,
        isFeatured: true,
        applicationUrl: 'https://example.com/apply/4',
      ),
      Job(
        id: '5',
        title: 'Junior Developer',
        company: 'StartupCo',
        location: 'Pretoria, South Africa',
        description:
            'Great opportunity for a junior developer to grow their skills...',
        salaryRange: 'R25,000 - R35,000',
        jobType: 'Full-time',
        experience: 'Entry-level',
        skills: ['JavaScript', 'React', 'Node.js', 'Git'],
        postedDate: DateTime.now().subtract(const Duration(hours: 6)),
        companyLogo: '',
        isRemote: false,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/5',
      ),
      Job(
        id: '6',
        title: 'DevOps Engineer',
        company: 'CloudTech',
        location: 'Remote',
        description:
            'Manage cloud infrastructure and automate deployment processes...',
        salaryRange: 'R55,000 - R75,000',
        jobType: 'Full-time',
        experience: 'Mid-level',
        skills: ['AWS', 'Kubernetes', 'Docker', 'Terraform'],
        postedDate: DateTime.now().subtract(const Duration(hours: 18)),
        companyLogo: '',
        isRemote: true,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/6',
      ),
      Job(
        id: '7',
        title: 'Product Manager',
        company: 'ProductCo',
        location: 'Cape Town, South Africa',
        description:
            'Lead product strategy and work with cross-functional teams...',
        salaryRange: 'R65,000 - R85,000',
        jobType: 'Full-time',
        experience: 'Senior',
        skills: ['Product Strategy', 'Agile', 'Analytics', 'Leadership'],
        postedDate: DateTime.now().subtract(const Duration(days: 1)),
        companyLogo: '',
        isRemote: false,
        isFeatured: true,
        applicationUrl: 'https://example.com/apply/7',
      ),
      Job(
        id: '8',
        title: 'Frontend Developer',
        company: 'WebStudio',
        location: 'Johannesburg, South Africa',
        description:
            'Build responsive web applications using modern technologies...',
        salaryRange: 'R40,000 - R55,000',
        jobType: 'Contract',
        experience: 'Mid-level',
        skills: ['React', 'TypeScript', 'CSS', 'JavaScript'],
        postedDate: DateTime.now().subtract(const Duration(hours: 8)),
        companyLogo: '',
        isRemote: true,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/8',
      ),
      Job(
        id: '9',
        title: 'QA Engineer',
        company: 'QualityFirst',
        location: 'Durban, South Africa',
        description:
            'Ensure software quality through comprehensive testing strategies...',
        salaryRange: 'R35,000 - R50,000',
        jobType: 'Full-time',
        experience: 'Entry-level',
        skills: ['Manual Testing', 'Selenium', 'Test Automation', 'JIRA'],
        postedDate: DateTime.now().subtract(const Duration(days: 4)),
        companyLogo: '',
        isRemote: false,
        isFeatured: false,
        applicationUrl: 'https://example.com/apply/9',
      ),
      Job(
        id: '10',
        title: 'Mobile App Developer',
        company: 'MobileTech',
        location: 'Remote',
        description: 'Develop native and cross-platform mobile applications...',
        salaryRange: 'R50,000 - R70,000',
        jobType: 'Full-time',
        experience: 'Mid-level',
        skills: ['React Native', 'iOS', 'Android', 'Swift'],
        postedDate: DateTime.now().subtract(const Duration(hours: 4)),
        companyLogo: '',
        isRemote: true,
        isFeatured: true,
        applicationUrl: 'https://example.com/apply/10',
      ),
    ];
  }

  Future<List<Job>> fetchRecommendedJobs(UserProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Simple recommendation algorithm based on user skills and interests
    final allJobs = await fetchJobs();
    final random = Random();

    // Filter jobs that match user skills or interests
    final matchingJobs =
        allJobs.where((job) {
          return job.skills.any(
                (skill) => profile.skills.any(
                  (userSkill) =>
                      userSkill.toLowerCase().contains(skill.toLowerCase()) ||
                      skill.toLowerCase().contains(userSkill.toLowerCase()),
                ),
              ) ||
              profile.interests.any(
                (interest) =>
                    job.title.toLowerCase().contains(interest.toLowerCase()) ||
                    job.description.toLowerCase().contains(
                      interest.toLowerCase(),
                    ),
              );
        }).toList();

    // If no matches, return random selection
    if (matchingJobs.isEmpty) {
      allJobs.shuffle(random);
      return allJobs.take(3).toList();
    }

    return matchingJobs.take(3).toList();
  }

  Future<List<TrainingCourse>> fetchCourses() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      TrainingCourse(
        id: '1',
        title: 'Complete Flutter Development Bootcamp',
        description: 'Learn Flutter from scratch and build amazing mobile apps',
        instructor: 'Angela Yu',
        provider: 'Udemy',
        rating: 4.7,
        duration: 32,
        difficulty: 'Beginner',
        skills: ['Flutter', 'Dart', 'Mobile Development'],
        category: 'Programming',
        price: 89.99,
        currency: 'USD',
        thumbnail: '',
        courseUrl: 'https://www.udemy.com/course/flutter-bootcamp-with-dart/',
        isFree: false,
        isCertified: true,
        enrollments: 45000,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      TrainingCourse(
        id: '2',
        title: 'Python for Data Science',
        description:
            'Master Python programming for data analysis and machine learning',
        instructor: 'Jose Portilla',
        provider: 'Coursera',
        rating: 4.8,
        duration: 40,
        difficulty: 'Intermediate',
        skills: ['Python', 'Data Science', 'Machine Learning'],
        category: 'Data Science',
        price: 49.99,
        currency: 'USD',
        thumbnail: '',
        courseUrl: 'https://www.coursera.org/learn/python-data-science',
        isFree: false,
        isCertified: true,
        enrollments: 62000,
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
      ),
      TrainingCourse(
        id: '3',
        title: 'UI/UX Design Fundamentals',
        description:
            'Learn the principles of user interface and user experience design',
        instructor: 'Gary Simon',
        provider: 'Skillshare',
        rating: 4.6,
        duration: 24,
        difficulty: 'Beginner',
        skills: ['UI Design', 'UX Design', 'Figma', 'Prototyping'],
        category: 'Design',
        price: 0.0,
        currency: 'USD',
        thumbnail: '',
        courseUrl:
            'https://www.skillshare.com/classes/UI-UX-Design-Fundamentals',
        isFree: true,
        isCertified: false,
        enrollments: 28000,
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
      ),
    ];
  }

  Future<List<TrainingCourse>> fetchRecommendedCourses(
    UserProfile profile,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final allCourses = await fetchCourses();
    final random = Random();

    // Filter courses that match user skills or interests
    final matchingCourses =
        allCourses.where((course) {
          return course.skills.any(
                (skill) => profile.skills.any(
                  (userSkill) =>
                      userSkill.toLowerCase().contains(skill.toLowerCase()) ||
                      skill.toLowerCase().contains(userSkill.toLowerCase()),
                ),
              ) ||
              profile.interests.any(
                (interest) =>
                    course.title.toLowerCase().contains(
                      interest.toLowerCase(),
                    ) ||
                    course.description.toLowerCase().contains(
                      interest.toLowerCase(),
                    ) ||
                    course.category.toLowerCase().contains(
                      interest.toLowerCase(),
                    ),
              );
        }).toList();

    // If no matches, return random selection
    if (matchingCourses.isEmpty) {
      allCourses.shuffle(random);
      return allCourses.take(2).toList();
    }

    return matchingCourses.take(2).toList();
  }

  Future<UserProfile?> fetchUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock user profile - in a real app, this would be fetched from secure storage or API
    return UserProfile(
      id: 'user_1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+27 12 345 6789',
      location: 'Cape Town, South Africa',
      currentTitle: 'Software Developer',
      bio:
          'Passionate software developer with experience in mobile and web development.',
      skills: ['Flutter', 'Dart', 'JavaScript', 'Python'],
      interests: ['Mobile Development', 'AI', 'Fintech'],
      experienceLevel: 'Mid-level',
      preferredJobTypes: ['Full-time', 'Remote'],
      salaryExpectation: 'R50,000 - R70,000',
      profilePicture: '',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)),
    );
  }

  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // In a real app, this would make an API call to update the profile
    return profile.copyWith(updatedAt: DateTime.now());
  }
}
