

import 'package:flutter/material.dart';
import 'package:my_portfolio/components/navbar.dart';
import 'package:my_portfolio/components/social_media_list.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/sections/contact_section.dart';
import 'package:my_portfolio/sections/about_section.dart';
import 'package:my_portfolio/sections/experience_section.dart';
import 'package:my_portfolio/sections/project_section.dart';
import 'package:my_portfolio/theme/colors.dart';
import 'package:my_portfolio/widgets/background_grid.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  Offset mousePos = Offset.zero;
  final ScrollController scrollController = ScrollController();


  final ValueNotifier<int> contactNotifier = ValueNotifier(0);
  final ValueNotifier<int> projectsNotifier = ValueNotifier(0);


  bool _contactTriggered = false;
  bool _contactVisible = false;


  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_checkContactVisibility);
  }

  void scrollTo(String section) {
    final contextMap = {
      'about': aboutKey.currentContext,
      'experience': experienceKey.currentContext,
      'projects': projectKey.currentContext,
      'contact': contactKey.currentContext,
    };

    final context = contextMap[section];
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _checkContactVisibility() {
    final RenderBox? box =
        contactKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && box.attached) {
      final offset = box.localToGlobal(Offset.zero);
      final size = box.size;
      final screenHeight = MediaQuery.of(context).size.height;

      final visibleTop = offset.dy.clamp(0.0, screenHeight);
      final visibleBottom = (offset.dy + size.height).clamp(0.0, screenHeight);
      final visibleHeight = visibleBottom - visibleTop;
      final visibleFraction = visibleHeight / size.height;
      final isVisible = visibleFraction > 0.4;

      if (isVisible && !_contactTriggered && !_contactVisible) {
        _contactTriggered = true;
        _contactVisible = true;
        contactNotifier.value++;
      }
      if (!isVisible && _contactVisible) {
        _contactTriggered = false;
        _contactVisible = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_checkContactVisibility);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      body: MouseRegion(
        onHover: (e) => setState(() => mousePos = e.localPosition),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                const Positioned.fill(child: BackgroundGrid()),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!Responsive.isLargeMobile(context))
                        const SocialMediaIconList(),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 12),
                              Navbar(onNavTap: scrollTo),
                              const SizedBox(height: 100),

                              KeyedSubtree(
                                key: aboutKey,
                                child: AboutSection(),
                              ),
                              const SizedBox(height: 80),

                              KeyedSubtree(
                                key: experienceKey,
                                child: ExperienceSection(),
                              ),
                              const SizedBox(height: 80),

                              KeyedSubtree(
                                key: projectKey,
                                child: ProjectSection(),
                              ),
                              const SizedBox(height: 100),

                              KeyedSubtree(
                                key: contactKey,
                                child: ContactSection(
                                  animationKey: contactNotifier,
                                ),
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                      if (!Responsive.isLargeMobile(context))
                        const SocialMediaTextList(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
