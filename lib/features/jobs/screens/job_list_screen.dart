import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyJobs = [
      {
        'title': 'Flutter Developer',
        'company': 'TechCorp',
        'location': 'Karachi',
      },
      {
        'title': 'Backend Engineer',
        'company': 'CloudWorks',
        'location': 'Lahore',
      },
      {
        'title': 'UI/UX Designer',
        'company': 'PixelPerfect',
        'location': 'Islamabad',
      },
      {
        'title': 'Data Analyst',
        'company': 'Insight Ltd.',
        'location': 'Remote',
      },
      {'title': 'QA Tester', 'company': 'BugBusters', 'location': 'Karachi'},
    ];
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: 10,
        title: Row(
          children: [
            // Profile Image
            GestureDetector(
              onTap: (){
                context.push('/profile');
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(width: 10),
            // Welcome text + username
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  'Welcome back',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Ali Ahmed', // Replace with dynamic username
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: ThemeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(
                  color: Colors.grey
                )
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.notifications_none, color: ThemeColor,),
                  onPressed: () {
                    // Handle notifications
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white54, // whole body background (slightly transparent white)
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white, // fully white for crisp contrast
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_outlined),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              MyText(
                text: "Recent Jobs",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Loop through jobs
              Column(
                children: dummyJobs.map((job) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white, // fully white for cards
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: job['title']!,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Icon(Icons.verified_user, color: Colors.grey.shade800, size: 20),
                              const SizedBox(width: 8),
                              MyText(
                                text: job['company']!,
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Colors.grey.shade800, size: 20),
                              const SizedBox(width: 8),
                              MyText(
                                text: job['location']!,
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.monetization_on_outlined, color: Colors.grey.shade800, size: 20),
                              const SizedBox(width: 8),
                              MyText(
                                text: "PKR 80,000 - 1,000,00",
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          MyText(
                            text: "Remote • Full-time • 1-2 years of experience",
                            color: Colors.grey.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ThemeColor,
                              ),
                              child: MyText(
                                text: "Apply Now",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
