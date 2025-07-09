import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/theme/colors.dart';
import 'package:my_portfolio/widgets/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatefulWidget {
  PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> with TickerProviderStateMixin{
  final List<Map<String, dynamic>> projects = [
    {
      "image": 'assets/images/chat.png',
      "title": 'OneVasco',
      "subtitle": 'Visa Assistance App',
      "description":
          'OneVasco is a travel and visa assistance app trusted by 4M+ users. It features smart form filling, secure document vault, reminders, and support for 100+ countries. Available on Android and iOS.',
      "tech": [
        'Flutter',
        'Dart'
            'Android',
        'iOS',
        'Firebase',
        'REST API',
      ],
      "link":
          "https://play.google.com/store/apps/details?id=com.onevasco&hl=en_IN",
    },

    {
      "image": 'assets/images/chat.png',
      "title": 'Mechmiles',
      "subtitle": 'Highway Vehicle Service Network',
      "description":
          'Mechmiles is India\'s first highway service point network app for all vehicle types—2W, 3W, cars, trucks, farm, and commercial. With 250+ service centers across major cities, it offers on-the-go vehicle servicing, accessories, and roadside assistance trusted by corporates and fleet operators.',
      "tech": [
        'Flutter',
        'Dart',
        'Android',
        'iOS',
        'Google Maps API',
        'REST API',
      ],
      "link":
          "https://play.google.com/store/search?q=mechmiles&c=apps&hl=en_IN",
    },

    {
      "image": 'assets/images/chat.png',
      "title": 'Policy Vault',
      "subtitle": 'Insurance Policy Organizer',
      "description":
          'Policy Vault simplifies insurance management by allowing users to digitize physical policies, store them securely, and access them anywhere. It creates digital policy cards and enables seamless sharing with family members. Perfect for health, life, and vehicle policies.',
      "tech": ['Flutter', 'Dart', 'Android', 'iOS', 'REST API'],
      "link":
          "https://play.google.com/store/apps/details?id=com.proj.policyvault&hl=en_IN",
    },

    {
      "image": 'assets/images/chat.png',
      "title": 'Poca Healthcare',
      "subtitle": 'Healthcare chatbot',
      "description":
          'AI-powered chatbot to assist patients with appointment booking, symptom tracking, and medication reminders.',
      "tech": ['Dart', 'Android', 'iOS'],
    },
    {
      "image": 'assets/images/chat.png',
      "title": 'Schooling Pro',
      "subtitle": 'All-in-One Education Platform',
      "description":
          'Schooling Pro is a comprehensive school management app for students and teachers. It offers homework tracking, secure online exams, Zoom-integrated virtual classes, and efficient attendance management—making academic administration seamless and digital-first.',
      "tech": ['Android', 'Java', 'Volley', 'Zoom SDK', 'REST API'],
      "link":
          "https://play.google.com/store/apps/details?id=com.qdocs.smartschools&hl=en_IN",
    },
    {
      "image": 'assets/images/chat.png',
      "title": 'Mister Mock',
      "subtitle": 'Interactive Quiz & Mock Test App',
      "description":
          'Mister Mock is a dynamic quiz app that helps users test and improve their knowledge. With secure login, category/chapter selection, paid access, and tiered difficulty levels, it offers an engaging learning experience. Review answers, explore detailed solutions, and report questions for better clarity.',
      "tech": [
        'Flutter',
        'Dart'
            'Android',
        'iOS',
        'Firebase',
        'Payment Gateway',
        'REST API',
      ],
      "link":
          "https://play.google.com/store/apps/details?id=com.mistermock.quiz&hl=en_IN",
    },
    {
      "image": 'assets/images/chat.png',
      "title": 'Gigz User App',
      "subtitle": 'Job Matching & Staffing Platform',
      "description":
          'Gigz connects job seekers with top employers through a seamless staffing platform. Whether it’s for temporary, contract, or permanent roles, users can explore personalized opportunities, apply instantly, and manage their job journey—all from one app.',
      "tech": [
        'Flutter',
        'Dart'
            'Android',
        'iOS',
        'Firebase',
        'REST API',
        'Payment Gateway',
      ],
      "link":
          "https://play.google.com/store/apps/details?id=com.gigsam.user.services&hl=en_IN",
    },
  ];

  late final AnimationController _controller;
  late final List<Animation<Offset>> _slideAnimations;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideAnimations = List.generate(projects.length, (index) {
      final start = index * 0.1;
      final end = start + 0.4;
      return Tween<Offset>(
        begin: const Offset(-0.5, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Text(
                "Some Things I've Built",
                style: context.textTheme.headlineLarge?.copyWith(
                  color: appColors.appWhite,
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 0.5,
                width: size.width * 0.3,
                color: appColors.headingColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: projects.length,
          padding: EdgeInsets.zero,
          itemBuilder:
              (context, index) =>
                  SlideTransition(
                      position: _slideAnimations[index],
                      child: ProjectCard(index: index, data: projects[index])),
          separatorBuilder: (_, __) => const SizedBox(height: 14),
        ),
      ],
    );
  }
}








class ProjectCard extends StatefulWidget {
  final int index;
  final Map<String, dynamic> data;

  const ProjectCard({super.key, required this.index, required this.data});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isImageLeft = widget.index % 2 == 0;
    final size = MediaQuery.sizeOf(context);
    final data = widget.data;

    final imageWidget = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _isHovered ? const Offset(0, -0.03) : Offset.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            data['image'],
            fit: BoxFit.contain,
            height: 240,
            width: isMobile ? size.width * 0.8 : 300,
          ),
        ),
      ),
    );

    final contentWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['subtitle'],
            style: context.textTheme.titleMedium?.copyWith(
              color: appColors.barColor,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['title'],
            style: context.textTheme.titleLarge?.copyWith(
              color: appColors.appWhite,
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              maxWidth: isMobile ? size.width * 0.9 : size.width * 0.3,
            ),
            child: Text(
              data['description'],
              style: context.textTheme.bodySmall?.copyWith(
                color: appColors.headingColor,
                fontSize: isMobile ? 13 : 14,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children:
                (data['tech'] as List<dynamic>)
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          e,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: appColors.headingColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 12),
          IconButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            onPressed: () => launchUrl(Uri.parse(data['link'])),
            icon: Icon(Icons.link, color: appColors.barColor),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child:
          Responsive.isLargeMobile(context)
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageWidget,
                  const SizedBox(height: 20),
                  contentWidget,
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    isImageLeft
                        ? [
                          imageWidget,
                          const SizedBox(width: 40),
                          contentWidget,
                        ]
                        : [
                          contentWidget,
                          const SizedBox(width: 40),
                          imageWidget,
                        ],
              ),
    );
  }
}
