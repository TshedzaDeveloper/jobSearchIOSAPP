import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/job_provider.dart';

class CVBuilderScreen extends StatefulWidget {
  const CVBuilderScreen({super.key});

  @override
  State<CVBuilderScreen> createState() => _CVBuilderScreenState();
}

class _CVBuilderScreenState extends State<CVBuilderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _summaryController = TextEditingController();

  final List<WorkExperience> _workExperiences = [];
  final List<Education> _educations = [];
  final List<String> _skills = [];
  final TextEditingController _skillController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final provider = Provider.of<JobProvider>(context, listen: false);
    final profile = provider.userProfile;
    if (profile != null) {
      _nameController.text = profile.name;
      _emailController.text = profile.email;
      _locationController.text = profile.location;
      _skills.addAll(profile.skills);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Builder'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _generateCV,
            icon: const Icon(Icons.download),
            tooltip: 'Generate CV',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Personal Information', Icons.person),
              _buildPersonalInfoSection(),
              const SizedBox(height: 24),

              _buildSectionHeader('Professional Summary', Icons.description),
              _buildSummarySection(),
              const SizedBox(height: 24),

              _buildSectionHeader('Work Experience', Icons.work),
              _buildWorkExperienceSection(),
              const SizedBox(height: 24),

              _buildSectionHeader('Education', Icons.school),
              _buildEducationSection(),
              const SizedBox(height: 24),

              _buildSectionHeader('Skills', Icons.star),
              _buildSkillsSection(),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _generateCV,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Generate CV',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: _summaryController,
          decoration: const InputDecoration(
            labelText: 'Professional Summary',
            hintText:
                'Write a brief summary of your professional background and goals...',
            border: InputBorder.none,
          ),
          maxLines: 4,
        ),
      ),
    );
  }

  Widget _buildWorkExperienceSection() {
    return Column(
      children: [
        ..._workExperiences.map((exp) => _buildWorkExperienceCard(exp)),
        Card(
          child: ListTile(
            leading: const Icon(Icons.add, color: AppColors.primaryBlue),
            title: const Text('Add Work Experience'),
            onTap: _addWorkExperience,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkExperienceCard(WorkExperience experience) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    experience.jobTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _removeWorkExperience(experience),
                  icon: const Icon(Icons.delete, color: AppColors.error),
                ),
              ],
            ),
            Text(
              experience.company,
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${experience.startDate} - ${experience.endDate}',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
            if (experience.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(experience.description),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEducationSection() {
    return Column(
      children: [
        ..._educations.map((edu) => _buildEducationCard(edu)),
        Card(
          child: ListTile(
            leading: const Icon(Icons.add, color: AppColors.primaryBlue),
            title: const Text('Add Education'),
            onTap: _addEducation,
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard(Education education) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    education.degree,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _removeEducation(education),
                  icon: const Icon(Icons.delete, color: AppColors.error),
                ),
              ],
            ),
            Text(
              education.institution,
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              education.year,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _skillController,
                    decoration: const InputDecoration(
                      labelText: 'Add Skill',
                      hintText: 'e.g., Flutter, Python, Project Management',
                    ),
                    onSubmitted: _addSkill,
                  ),
                ),
                IconButton(
                  onPressed: () => _addSkill(_skillController.text),
                  icon: const Icon(Icons.add, color: AppColors.primaryBlue),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _skills.map((skill) => _buildSkillChip(skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
      deleteIcon: const Icon(Icons.close, size: 16),
      onDeleted: () => _removeSkill(skill),
    );
  }

  void _addWorkExperience() {
    showDialog(
      context: context,
      builder:
          (context) => _WorkExperienceDialog(
            onSave: (experience) {
              setState(() {
                _workExperiences.add(experience);
              });
            },
          ),
    );
  }

  void _removeWorkExperience(WorkExperience experience) {
    setState(() {
      _workExperiences.remove(experience);
    });
  }

  void _addEducation() {
    showDialog(
      context: context,
      builder:
          (context) => _EducationDialog(
            onSave: (education) {
              setState(() {
                _educations.add(education);
              });
            },
          ),
    );
  }

  void _removeEducation(Education education) {
    setState(() {
      _educations.remove(education);
    });
  }

  void _addSkill(String skill) {
    if (skill.trim().isNotEmpty && !_skills.contains(skill.trim())) {
      setState(() {
        _skills.add(skill.trim());
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  void _generateCV() {
    if (_formKey.currentState?.validate() != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('CV Generated Successfully!'),
            content: const Text(
              'Your CV has been generated. In a real app, this would download a PDF file or open a preview.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _summaryController.dispose();
    _skillController.dispose();
    super.dispose();
  }
}

class WorkExperience {
  final String jobTitle;
  final String company;
  final String startDate;
  final String endDate;
  final String description;

  WorkExperience({
    required this.jobTitle,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Education {
  final String degree;
  final String institution;
  final String year;

  Education({
    required this.degree,
    required this.institution,
    required this.year,
  });
}

class _WorkExperienceDialog extends StatefulWidget {
  final Function(WorkExperience) onSave;

  const _WorkExperienceDialog({required this.onSave});

  @override
  State<_WorkExperienceDialog> createState() => _WorkExperienceDialogState();
}

class _WorkExperienceDialogState extends State<_WorkExperienceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _jobTitleController = TextEditingController();
  final _companyController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Work Experience'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _jobTitleController,
                decoration: const InputDecoration(labelText: 'Job Title'),
                validator:
                    (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              TextFormField(
                controller: _companyController,
                decoration: const InputDecoration(labelText: 'Company'),
                validator:
                    (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(labelText: 'Start Date'),
                validator:
                    (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              TextFormField(
                controller: _endDateController,
                decoration: const InputDecoration(labelText: 'End Date'),
                validator:
                    (value) => value?.isEmpty == true ? 'Required' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              widget.onSave(
                WorkExperience(
                  jobTitle: _jobTitleController.text,
                  company: _companyController.text,
                  startDate: _startDateController.text,
                  endDate: _endDateController.text,
                  description: _descriptionController.text,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _EducationDialog extends StatefulWidget {
  final Function(Education) onSave;

  const _EducationDialog({required this.onSave});

  @override
  State<_EducationDialog> createState() => _EducationDialogState();
}

class _EducationDialogState extends State<_EducationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _degreeController = TextEditingController();
  final _institutionController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Education'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _degreeController,
              decoration: const InputDecoration(labelText: 'Degree'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            TextFormField(
              controller: _institutionController,
              decoration: const InputDecoration(labelText: 'Institution'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
            TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(labelText: 'Year'),
              validator: (value) => value?.isEmpty == true ? 'Required' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              widget.onSave(
                Education(
                  degree: _degreeController.text,
                  institution: _institutionController.text,
                  year: _yearController.text,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
