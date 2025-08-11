import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? selectedOption; // "jobSeeker" or "employer"

  void _onSelect(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void _onContinue() {
    if (selectedOption == "jobSeeker") {
      context.go('/jobs');
    } else if (selectedOption == "employer") {
      context.go('/jobs');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    final cardPadding = screenWidth * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: screenHeight * 0.01,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset(
                "assets/images/logo.png",
                width: screenWidth * 0.25,
              ),
              MyText(
                text: "HireMe",
                color: Colors.black87,
                fontSize: screenWidth * 0.1,
                fontWeight: FontWeight.w600,
              ),
              MyText(
                text: "Select a Job Category",
                color: Colors.grey.shade800,
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                child: Text(
                  "Select whether you're seeking employment opportunities or your organization requires talented individuals.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onSelect("jobSeeker"),
                      child: SizedBox(
                        height: screenHeight * 0.28,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.03,
                            horizontal: cardPadding,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedOption == "jobSeeker"
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.briefcase,
                                  color: Colors.white,
                                  size: screenWidth * 0.07,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              MyText(
                                text: "Find a Job",
                                color: Colors.black87,
                                fontSize: screenWidth * 0.050,
                                fontWeight: FontWeight.w700,
                              ),
                              MyText(
                                text: "I want to find a job",
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onSelect("employer"),
                      child: SizedBox(
                        height: screenHeight * 0.28,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.03,
                            horizontal: cardPadding,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedOption == "employer"
                                  ? Colors.deepOrangeAccent
                                  : Colors.grey.shade400,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrangeAccent,
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.person,
                                  color: Colors.white,
                                  size: screenWidth * 0.07,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              MyText(
                                text: "Find an\nEmployee",
                                color: Colors.black87,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.center,
                              ),
                              MyText(
                                text: "I want to find employee",
                                color: Colors.grey.shade800,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),

              // Continue button - visible only when selection is made
              if (selectedOption != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: selectedOption == "jobSeeker"
                          ? Colors.blue
                          : Colors.deepOrangeAccent,
                    ),
                    onPressed: _onContinue,
                    child: MyText(
                      text: "Continue",
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
