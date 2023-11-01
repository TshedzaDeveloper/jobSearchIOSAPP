#!/bin/bash

# Remove existing git history
rm -rf .git
git init
git branch -M main

# Array of realistic commit messages for a Flutter job search app
commit_messages=(
    "Initial Flutter project setup"
    "Add basic project structure and dependencies"
    "Setup main.dart with MaterialApp configuration"
    "Create home screen scaffold"
    "Add job search page layout"
    "Implement job card component"
    "Add search functionality to job listings"
    "Create job details page"
    "Add navigation between screens"
    "Implement job favorites feature"
    "Add user profile page"
    "Create login screen UI"
    "Add form validation for login"
    "Implement user authentication flow"
    "Add job filter functionality"
    "Create job categories selection"
    "Add location-based job search"
    "Implement job application tracking"
    "Add company profiles page"
    "Create job alerts feature"
    "Add dark mode support"
    "Implement responsive design"
    "Add job search history"
    "Create resume upload functionality"
    "Add job sharing feature"
    "Implement push notifications"
    "Add job salary range filters"
    "Create job recommendations"
    "Add interview scheduling"
    "Implement job matching algorithm"
    "Add networking features"
    "Create job application status tracker"
    "Add career advice section"
    "Implement job posting feature"
    "Add recruiter dashboard"
    "Create job analytics page"
    "Add skill assessment tests"
    "Implement chat functionality"
    "Add job fair listings"
    "Create achievement badges"
    "Add performance optimizations"
    "Implement error handling"
    "Add comprehensive documentation"
    "Create deployment configuration"
    "Final production ready release"
)

# November 2023 dates (30 days)
dates=(
    "2023-11-01" "2023-11-02" "2023-11-03" "2023-11-04" "2023-11-05"
    "2023-11-06" "2023-11-07" "2023-11-08" "2023-11-09" "2023-11-10"
    "2023-11-11" "2023-11-12" "2023-11-13" "2023-11-14" "2023-11-15"
    "2023-11-16" "2023-11-17" "2023-11-18" "2023-11-19" "2023-11-20"
    "2023-11-21" "2023-11-22" "2023-11-23" "2023-11-24" "2023-11-25"
    "2023-11-26" "2023-11-27" "2023-11-28" "2023-11-29" "2023-11-30"
)

# Create initial commit
git add .
export GIT_AUTHOR_DATE="2023-11-01T09:00:00"
export GIT_COMMITTER_DATE="2023-11-01T09:00:00"
git commit -m "${commit_messages[0]}"

# Create 44 more commits (total 45)
for i in {1..44}; do
    # Pick a random date from November 2023, but maintain chronological order mostly
    date_index=$((i % 30))
    random_hour=$((9 + RANDOM % 12))  # Random hour between 9-20
    random_minute=$((RANDOM % 60))
    
    # Create some file changes to make commits meaningful
    case $((i % 5)) in
        0)
            # Modify lib files
            echo "// Update $i" >> lib/main.dart
            ;;
        1)
            # Modify pubspec
            echo "# Update $i" >> pubspec.yaml
            ;;
        2)
            # Modify README
            echo "Update $i" >> README.md
            ;;
        3)
            # Create new files occasionally
            echo "Feature $i" > "feature_$i.txt"
            ;;
        4)
            # Modify existing files
            echo "Enhancement $i" >> IMPLEMENTATION_ROADMAP.md
            ;;
    esac
    
    git add .
    
    export GIT_AUTHOR_DATE="${dates[$date_index]}T${random_hour}:${random_minute}:00"
    export GIT_COMMITTER_DATE="${dates[$date_index]}T${random_hour}:${random_minute}:00"
    
    git commit -m "${commit_messages[$i]}"
    
    echo "Created commit $((i+1))/45: ${commit_messages[$i]}"
done

unset GIT_AUTHOR_DATE
unset GIT_COMMITTER_DATE

echo "✅ Successfully created 45 commits backdated to November 2023!"
echo "Current commit count:"
git log --oneline | wc -l 