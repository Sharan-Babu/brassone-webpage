import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildDescription(context),
            _buildUseCases(context),
            _buildHowItWorks(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.extension, size: 80, color: Colors.white)
                .animate()
                .fade(duration: 600.ms)
                .scale(delay: 300.ms),
            const SizedBox(height: 20),
            Text(
              'Web Automator',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fade(duration: 1000.ms).slide(begin: Offset(0, 50), delay: 300.ms),
            const SizedBox(height: 10),
            Text(
              'Supercharge your browsing experience',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ).animate().fade(duration: 600.ms).slide(begin: Offset(0, 50), delay: 450.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Web Automator',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Web Automator is a powerful Chrome extension that brings custom automations to your browsing experience. Create rules, automate tasks, and transform the way you interact with websites.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ).animate().fade(duration: 600.ms).slide(begin: Offset(0, 50));
  }

  Widget _buildUseCases(BuildContext context) {
    final useCases = [
      {'icon': Icons.speed, 'text': 'Adjust video playback speed automatically'},
      {'icon': Icons.summarize, 'text': 'Get instant article summaries'},
      {'icon': Icons.color_lens, 'text': 'Dynamic webpage theming based on content'},
      {'icon': Icons.timer, 'text': 'Estimate reading time for articles'},
      {'icon': Icons.notifications_active, 'text': 'Smart browsing time alerts'},
    ];

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What You Can Do',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: useCases.map((useCase) {
                  return SizedBox(
                    width: constraints.maxWidth > 600 ? (constraints.maxWidth - 40) / 3 : constraints.maxWidth,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(useCase['icon'] as IconData, size: 40, color: Colors.blue),
                            const SizedBox(height: 12),
                            Text(
                              useCase['text'] as String,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().scale(delay: (100 * useCases.indexOf(useCase)).ms, duration: 400.ms);
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks(BuildContext context) {
    final steps = [
      'Create custom automation rules',
      'AI processes and stores your rules',
      'Extension monitors your browsing',
      'Matching rules are identified',
      'AI generates automation code',
      'Your custom automations run seamlessly',
    ];

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How It Works',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(steps[index]),
              ).animate().fade(delay: (200 * index).ms).slide(begin: Offset(50, 0));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue[800],
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Text(
            'Ready to transform your browsing experience?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Add link to your Chrome extension
              launchUrl(Uri.parse('https://chrome.google.com/webstore'));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Get Web Automator',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue[800]),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ).animate().scale(delay: 600.ms),
        ],
      ),
    );
  }
}