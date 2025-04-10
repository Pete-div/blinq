# bliqtest

During the development of this project, I followed a MVVM (Model-View-ViewModel) architecture to ensure a clean separation of concerns and enhance testability and scalability.

✅ State Management
I used Riverpod, a robust and scalable state management solution in Flutter, which helped:

Manage application state across views and services efficiently.

Simplify rebuilding of widgets only when necessary.

Keep the UI reactive and modular.

🧩 Widget Design
To maintain readability and modularity, I broke the UI into small reusable widgets. Each logical section of the app (like avatar, post media, headers, etc.) has its own self-contained widget to:

Improve maintainability.

Enhance reusability.

Allow isolated testing and styling.

🔥 Firebase Firestore Integration
I connected to Firebase Firestore to fetch both user and post data. I implemented logic to:

Display a clean and helpful UI when the data list is empty (both for users and posts).

Dynamically decide what widget to show for each post based on its metadata (noMedia, isVideo, isImage, etc.).

Ensure that the app doesn't break if some fields are missing or null.

🔁 Refresh Logic
A pull-to-refresh (dropdown refresh) mechanism was added to:

Let users manually fetch and update the feed.

Improve UX by always giving a sense of real-time content.


