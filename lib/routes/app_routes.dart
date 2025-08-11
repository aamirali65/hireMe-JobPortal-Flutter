import 'package:go_router/go_router.dart';
import 'package:hiremee/features/auth/screens/login_screen.dart';
import 'package:hiremee/features/auth/screens/login_with_email.dart';
import 'package:hiremee/features/auth/screens/register_screen.dart';
import 'package:hiremee/features/jobs/screens/job_list_screen.dart';
import 'package:hiremee/features/onboarding/screens/onboarding.dart';
import 'package:hiremee/features/profile/screens/profile_screen.dart';
import 'package:hiremee/features/splash/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/loginGoogle',
      builder: (context, state) => const LoginWithGoogle(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
      // builder: (context, state) => const JobListScreen(),
    ),
    GoRoute(
      path: '/jobs',
      builder: (context, state) => const JobListScreen(),
      // builder: (context, state) => const JobListScreen(),
    ),
    GoRoute(
      path: '/jobs/:id',
      builder: (context, state) {
        final jobId = state.pathParameters['id']!;
        return LoginScreen();
        // return JobDetailScreen(jobId: jobId);
      },
    ),
    GoRoute(
      path: '/jobs/post',
      builder: (context, state) => const RegisterScreen(),
      // builder: (context, state) => const PostJobScreen(),
    ),
    GoRoute(
      path: '/jobs/:id/apply',
      builder: (context, state) {
        final jobId = state.pathParameters['id']!;
        // return ApplyScreen(jobId: jobId);
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/applications',
      builder: (context, state) => const RegisterScreen(),
      // builder: (context, state) => const ApplicationListScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
      // builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) => const RegisterScreen(),
      // builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);
