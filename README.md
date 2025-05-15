## Flutter ToDo App

A Flutter-based ToDo application with Firebase integration, featuring user authentication, task management, and an asynchronous task queue. Built with clean architecture, Bloc for state management, and GoRouter for navigation.

## Queue Logic

The app uses a custom asynchronous queue to handle task uploads to Firebase Firestore efficiently:





Task Addition: When a user adds a task, it’s immediately saved to Firestore with a "queued" status and added to an in-memory queue (using the queue package).



Delayed Processing: Each task waits 5 seconds in the queue before its status is updated to "uploaded" in Firestore, ensuring non-blocking UI performance.



Retry Mechanism: If the Firestore update fails (e.g., due to network issues), the queue retries up to 3 times with increasing delays to ensure reliability.



Real-Time Updates: The app listens to Firestore snapshots, so the UI reflects the status change from "queued" to "uploaded" automatically.

This approach balances responsiveness, reliability, and real-time synchronization.

## Folder Structure

The project follows a clean architecture for maintainability and scalability:





lib/data/: Handles data operations.





models/: Defines the Task model for tasks.



repositories/: Manages data access (e.g., TaskRepository for Firestore operations).



services/: Contains services like AuthService (Firebase authentication) and QueueService (task queue logic).



lib/bloc/: Manages state using Flutter Bloc.





auth/: Handles authentication state (login/logout).



task/: Manages task-related state (adding tasks, loading tasks).



lib/ui/: Contains UI components.





screens/: Includes screens like LoginScreen, DashboardScreen, and TaskCreatorScreen.



widgets/: Reusable widgets like TaskItem for displaying tasks.



lib/router/: Configures navigation using GoRouter (app_router.dart).



lib/main.dart: Entry point, initializing Firebase and setting up providers.

This structure separates concerns, making the codebase modular and easy to extend.
