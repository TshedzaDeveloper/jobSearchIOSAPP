class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String description;
  final String salaryRange;
  final String jobType; // Full-time, Part-time, Contract, Remote
  final String experience; // Entry-level, Mid-level, Senior
  final List<String> skills;
  final DateTime postedDate;
  final String companyLogo;
  final bool isRemote;
  final bool isFeatured;
  final String applicationUrl;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.salaryRange,
    required this.jobType,
    required this.experience,
    required this.skills,
    required this.postedDate,
    this.companyLogo = '',
    this.isRemote = false,
    this.isFeatured = false,
    this.applicationUrl = '',
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      salaryRange: json['salaryRange'] ?? '',
      jobType: json['jobType'] ?? '',
      experience: json['experience'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      postedDate: DateTime.tryParse(json['postedDate'] ?? '') ?? DateTime.now(),
      companyLogo: json['companyLogo'] ?? '',
      isRemote: json['isRemote'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      applicationUrl: json['applicationUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'description': description,
      'salaryRange': salaryRange,
      'jobType': jobType,
      'experience': experience,
      'skills': skills,
      'postedDate': postedDate.toIso8601String(),
      'companyLogo': companyLogo,
      'isRemote': isRemote,
      'isFeatured': isFeatured,
      'applicationUrl': applicationUrl,
    };
  }
}
