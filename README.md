# 🚀 JobSeeker - Flutter Job Search App

A modern, feature-rich job search application built with Flutter that helps job seekers in South Africa find their dream careers. The app includes personalized recommendations, skill development courses, CV building tools, and an AI-powered career assistant.

## 📱 Features

### Core Functionality
- **Job Search & Discovery**: Browse thousands of job listings with advanced filtering
- **Personalized Recommendations**: AI-powered job matching based on your skills and interests
- **Training & Upskilling**: Access to online courses from top platforms like Udemy, Coursera, and Skillshare
- **CV Builder**: Professional CV generation with multiple templates
- **AI Career Assistant**: Chat with our intelligent assistant for career guidance
- **User Profiles**: Manage your professional information and preferences

### User Experience
- **Modern UI/UX**: Clean, intuitive design following Material Design 3 principles
- **Smooth Animations**: Staggered animations and smooth transitions
- **Dark/Light Mode**: Adaptive theming for comfortable viewing
- **Offline Support**: Core features work without internet connection
- **Real-time Updates**: Instant notifications for new job matches

## 🏗️ Architecture

### Tech Stack
- **Frontend**: Flutter 3.0+ with Dart
- **State Management**: Provider pattern for reactive UI updates
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **UI Components**: Material Design 3 with custom widgets
- **Navigation**: Bottom navigation with floating action button
- **Animations**: flutter_staggered_animations for smooth transitions

### Project Structure
```
lib/
├── constants/          # App-wide constants (colors, themes)
├── models/            # Data models (Job, User, Course)
├── providers/         # State management (JobProvider)
├── screens/           # App screens (Home, Jobs, Profile, etc.)
├── services/          # Business logic (JobService, AuthService)
├── widgets/           # Reusable UI components
└── main.dart         # App entry point
```

### Design Patterns
- **MVVM Architecture**: Clear separation of concerns
- **Provider Pattern**: Centralized state management
- **Repository Pattern**: Data abstraction layer
- **Factory Pattern**: Object creation for different job types

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart 3.0 or higher
- iOS 13.0+ or Android API level 21+
- Xcode 14+ (for iOS development)
- Android Studio or VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/TshedzaDeveloper/jobSearchIOSAPP.git
   cd jobSearchIOSAPP
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **iOS Setup (macOS only)**
   ```bash
   cd ios
   pod install
   cd ..
   ```

4. **Firebase Configuration**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Authentication, Firestore, and Storage
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in `android/app/` and `ios/Runner/` respectively

5. **Run the app**
   ```bash
   flutter run
   ```

## 📖 How to Use

### For Job Seekers

1. **Create Your Profile**
   - Sign up with email/password
   - Complete your professional profile
   - Add skills, interests, and career preferences

2. **Discover Jobs**
   - Browse featured and recommended jobs on the home screen
   - Use the Jobs tab to search with filters (location, salary, type)
   - Bookmark interesting positions for later

3. **Skill Development**
   - Visit the Training tab for courses
   - Filter by difficulty level and category
   - Enroll in free or paid courses to improve your skills

4. **Build Your CV**
   - Use the CV Builder to create professional resumes
   - Add work experience, education, and skills
   - Export as PDF (feature coming soon)

5. **Get Career Guidance**
   - Tap the chat button to talk with our AI assistant
   - Ask about interview tips, salary negotiations, or career paths
   - Get personalized advice based on your profile

### For Developers

#### Adding New Job Listings
```dart
// In JobService.dart
Job newJob = Job(
  id: 'unique_id',
  title: 'Flutter Developer',
  company: 'TechCorp',
  location: 'Cape Town, SA',
  description: 'Join our amazing team...',
  skills: ['Flutter', 'Dart', 'Firebase'],
  // ... other properties
);
```

#### Creating Custom Widgets
```dart
// Example: Custom job card widget
class CustomJobCard extends StatelessWidget {
  final Job job;
  
  const CustomJobCard({required this.job});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(job.title),
        subtitle: Text(job.company),
        // ... custom styling
      ),
    );
  }
}
```

## 🎨 Customization

### Themes and Colors
Modify `lib/constants/app_colors.dart` to change the app's color scheme:

```dart
class AppColors {
  static const primaryBlue = Color(0xFF2196F3);
  static const accentGreen = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  // Add your custom colors here
}
```

### Adding New Features
1. Create the UI in `lib/screens/`
2. Add business logic in `lib/services/`
3. Update state management in `lib/providers/`
4. Connect with navigation in `main.dart`

## 🧪 Testing

Run the test suite to ensure everything works correctly:

```bash
# Unit tests
flutter test

# Integration tests
flutter drive --target=test_driver/app.dart

# Widget tests
flutter test test/widget_test.dart
```

## 📱 Screenshots

| Home Screen | Job Listings | Course Training | CV Builder |
|-------------|--------------|-----------------|------------|
| ![Home](screenshots/home.png) | ![Jobs](screenshots/jobs.png) | ![Training](screenshots/training.png) | ![CV](screenshots/cv.png) |

## 🚀 Deployment

### iOS App Store
1. Archive your app in Xcode
2. Upload to App Store Connect
3. Submit for review

### Google Play Store
```bash
flutter build appbundle --release
```
Upload the generated `app-release.aab` to Google Play Console.

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### Contribution Guidelines
- Follow Flutter/Dart style guidelines
- Write tests for new features
- Update documentation
- Ensure backwards compatibility

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgments

- **Flutter Team** for the amazing framework
- **Firebase** for backend services
- **Material Design** for UI components
- **South African Job Market** for inspiration
- **Open Source Community** for various packages used

## 📞 Support

Need help or have questions?

- 📧 Email: support@jobseekerapp.com
- 💬 Discussions: [GitHub Discussions](https://github.com/TshedzaDeveloper/jobSearchIOSAPP/discussions)
- 🐛 Bug Reports: [GitHub Issues](https://github.com/TshedzaDeveloper/jobSearchIOSAPP/issues)

## 🗺️ Roadmap

### Coming Soon
- [ ] PDF CV export functionality
- [ ] Push notifications for job alerts
- [ ] Video interview preparation
- [ ] Salary insights and trends
- [ ] Company reviews and ratings

### Future Plans
- [ ] Machine learning job matching
- [ ] Integration with LinkedIn
- [ ] Employer dashboard
- [ ] Advanced analytics
- [ ] Multi-language support

---

**Made with ❤️ by Tshedzane Developer for the South African job market**

*Last updated: November 2023*
Update 2
Update 7
Update 12
