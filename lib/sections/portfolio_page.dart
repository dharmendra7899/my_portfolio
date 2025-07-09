import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/components/navbar.dart';
import 'package:flutter_portfolio_clone/components/social_media_list.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/sections/contact_section.dart';
import 'package:flutter_portfolio_clone/sections/about_section.dart';
import 'package:flutter_portfolio_clone/sections/experience_section.dart';
import 'package:flutter_portfolio_clone/sections/portfolio_section.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/background_grid.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  Offset mousePos = Offset.zero;

  ScrollController scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(String section) {
    final contextMap = {
      'about': aboutKey.currentContext,
      'experience': experienceKey.currentContext,
      'portfolio': portfolioKey.currentContext,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 12,),
                              Navbar(onNavTap: scrollTo),
                              const SizedBox(height: 100),
                              KeyedSubtree(
                                  key: aboutKey, child: AboutSection()),
                              KeyedSubtree(
                                  key: experienceKey,
                                  child: ExperienceSection()),
                              KeyedSubtree(
                                  key: portfolioKey, child: PortfolioSection()),
                              KeyedSubtree(
                                  key: contactKey, child: ContactSection()),
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
