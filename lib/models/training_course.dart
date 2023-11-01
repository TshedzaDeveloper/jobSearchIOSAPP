class TrainingCourse {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String provider;
  final double rating;
  final int duration; // in hours
  final String difficulty; // Beginner, Intermediate, Advanced
  final List<String> skills;
  final String category;
  final double price;
  final String currency;
  final String thumbnail;
  final String courseUrl;
  final bool isFree;
  final bool isCertified;
  final int enrollments;
  final DateTime createdAt;

  TrainingCourse({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.provider,
    this.rating = 0.0,
    this.duration = 0,
    this.difficulty = 'Beginner',
    this.skills = const [],
    required this.category,
    this.price = 0.0,
    this.currency = 'USD',
    this.thumbnail = '',
    this.courseUrl = '',
    this.isFree = false,
    this.isCertified = false,
    this.enrollments = 0,
    required this.createdAt,
  });

  factory TrainingCourse.fromJson(Map<String, dynamic> json) {
    return TrainingCourse(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      instructor: json['instructor'] ?? '',
      provider: json['provider'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      duration: json['duration'] ?? 0,
      difficulty: json['difficulty'] ?? 'Beginner',
      skills: List<String>.from(json['skills'] ?? []),
      category: json['category'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'USD',
      thumbnail: json['thumbnail'] ?? '',
      courseUrl: json['courseUrl'] ?? '',
      isFree: json['isFree'] ?? false,
      isCertified: json['isCertified'] ?? false,
      enrollments: json['enrollments'] ?? 0,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'instructor': instructor,
      'provider': provider,
      'rating': rating,
      'duration': duration,
      'difficulty': difficulty,
      'skills': skills,
      'category': category,
      'price': price,
      'currency': currency,
      'thumbnail': thumbnail,
      'courseUrl': courseUrl,
      'isFree': isFree,
      'isCertified': isCertified,
      'enrollments': enrollments,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
