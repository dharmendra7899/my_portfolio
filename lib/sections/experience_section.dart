import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final ScrollController _scrollController = ScrollController();
  final double cardWidth = 420;
  int _currentIndex = 0;

  final experiences = [
    {
      "company_name": "Skyview Smart Solution",
      "title": "Android Developer",
      "date": "Mar 2021 – June 2022",
      "desc":
          "Started as an Android Intern and was promoted to Junior Android Developer within 3 months. Gained hands-on experience with Java and Kotlin, and worked on two live projects using Volley and Retrofit. Focused on quality code and collaborated closely with designers and senior developers.",
    },
    {
      "company_name": "Softfix Technology OPC Pvt. Ltd",
      "title": "Mobile App Developer",
      "date": "July 2022 – March 2025",
      "desc":
          "Joined as an Android Developer and later transitioned to Flutter. Contributed to multiple cross-platform apps using both Flutter and native Android. Led several full-cycle projects from development to deployment, individually publishing 5–6 apps to the Play Store and App Store. Proficient in state management (GetX, Provider, BLoC), Firebase integration, payment gateway setup, and push notifications.",
    },
    {
      "company_name": "E-Profit Booster",
      "title": "Mobile App Developer",
      "date": "April 2025 – Present",
      "desc":
          "Currently working on 'Policy Vault' — a feature-rich insurance application built with Flutter. Responsible for core architecture, clean code practices, UI/UX implementation, and backend integrations.",
    },
  ];

  void _onScroll() {
    final offset = _scrollController.offset;
    final index = (offset / cardWidth).round();
    setState(() {
      _currentIndex = index.clamp(0, experiences.length - 1);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 150,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Text(
                "Where I've Worked",
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
        Center(
          child: SizedBox(
            height: 350,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                return AnimatedContainer(decoration: BoxDecoration(color: appColors.secondary,borderRadius: BorderRadius.circular(12)),
                  duration: const Duration(milliseconds: 300),
                  width:Responsive.isLargeMobile(context)?size.width:size.width * 0.29,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.all(16),
                  child: _buildExperienceCard(exp, context),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(experiences.length, (index) {
            final isActive = index == _currentIndex;
            return GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  index * cardWidth,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.greenAccent : Colors.white30,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildExperienceCard(Map<String, String> exp, BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exp['title']!,
          style: context.textTheme.bodyLarge?.copyWith(
            color: appColors.barColor,
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 16 : 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          exp['company_name']!,
          style: context.textTheme.bodyMedium?.copyWith(
            color: appColors.headingColor,
            fontSize: isMobile ? 12 : 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          exp['date']!,
          style: context.textTheme.bodySmall?.copyWith(
            color: appColors.headingColor.withValues(alpha: 0.7),
            fontSize: isMobile ? 10 : 12,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          exp['desc']!,
          style: context.textTheme.titleSmall?.copyWith(
            color: appColors.headingColor,
            fontWeight: FontWeight.w300,
            fontSize: isMobile ? 12 : 14,
          ),
        ),
      ],
    );
  }
}
