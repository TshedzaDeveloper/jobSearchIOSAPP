class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String currentTitle;
  final String bio;
  final List<String> skills;
  final List<String> interests;
  final String experienceLevel;
  final List<String> preferredJobTypes;
  final String salaryExpectation;
  final String profilePicture;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.location = '',
    this.currentTitle = '',
    this.bio = '',
    this.skills = const [],
    this.interests = const [],
    this.experienceLevel = 'Entry-level',
    this.preferredJobTypes = const [],
    this.salaryExpectation = '',
    this.profilePicture = '',
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      currentTitle: json['currentTitle'] ?? '',
      bio: json['bio'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      interests: List<String>.from(json['interests'] ?? []),
      experienceLevel: json['experienceLevel'] ?? 'Entry-level',
      preferredJobTypes: List<String>.from(json['preferredJobTypes'] ?? []),
      salaryExpectation: json['salaryExpectation'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'currentTitle': currentTitle,
      'bio': bio,
      'skills': skills,
      'interests': interests,
      'experienceLevel': experienceLevel,
      'preferredJobTypes': preferredJobTypes,
      'salaryExpectation': salaryExpectation,
      'profilePicture': profilePicture,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? currentTitle,
    String? bio,
    List<String>? skills,
    List<String>? interests,
    String? experienceLevel,
    List<String>? preferredJobTypes,
    String? salaryExpectation,
    String? profilePicture,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      currentTitle: currentTitle ?? this.currentTitle,
      bio: bio ?? this.bio,
      skills: skills ?? this.skills,
      interests: interests ?? this.interests,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      preferredJobTypes: preferredJobTypes ?? this.preferredJobTypes,
      salaryExpectation: salaryExpectation ?? this.salaryExpectation,
      profilePicture: profilePicture ?? this.profilePicture,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
