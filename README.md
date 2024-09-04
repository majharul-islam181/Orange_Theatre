# Orange Theatre


```Introduction: Project Overview```
This project is a Flutter-based mobile application designed to provide users with a comprehensive and interactive platform for exploring movies. The application leverages the BLoC (Business Logic Component) architecture to manage state effectively and ensure a smooth user experience.
```    ```
* * *

## Key Features

- **Movie Exploration**: Users can browse through trending movies, upcoming releases, and different genres.
- **Movie Details**: Detailed information about each movie, including genres, release dates, and reviews.
- **User Favorites**: Users can save movies to their favorites for quick access later.
- **Nearby Movie Theatre**: User can easily search and find their perfect place to watch movies.
- **Responsive UI**: A visually appealing interface that adapts to different screen sizes, providing a seamless experience across devices.

``` ```


![Group 1 (2)](https://github.com/user-attachments/assets/3baa13f7-6c2c-4de9-80b6-25e2593bf1c8)

## Project Structure: 
```

lib/
├── bloc/
│   └── bloc.dart
├── config/
│   ├── colors/
│   ├── components/
│   ├── routes/
│   └── app_url.dart
│---models/
│   │   └── models.dart
│───repository/
│   │   └── repository.dart
│───services/
│   │   ├── favourite_services/
│   │   ├── session_manager/
│   │   ├── splash/
│   │   └── storage/
│───data/
│       ├── exceptions/
│       ├── hive/
│       ├── network/
├── theme/
│   ├── constant.dart
│   ├── data.dart
│   ├── enums.dart
│   ├── flash_bar_helper.dart
│   ├── validations.dart
├── utils/
│   ├── validations.dart
│   ├── constant.dart
├── views/
│   ├── widgets/
│   │   ├── views.dart
│   │   ├── widgets.dart
│   └── views.dart
└── main.dart

```

## Key components

Here's a brief overview of the project's directory structure:

- **lib/**: The main directory for the Flutter app source code.
  
  - **data/**: Contains everything related to data handling, including models, repositories, and services.
    - **models/**: Defines data structures used in the app, such as `MovieModel` and `GenreModel`.
    - **repositories/**: Classes responsible for handling data fetching and storage logic, e.g., `MovieRepository` and `GenreRepository`.
    - **services/**: Provides services for API calls and local storage.
      - `ApiService`: Handles communication with the TMDB API.
      - `LocalStorageService`: Manages data persistence using SQLite, Hive, etc.

  - **ui/**: Contains all UI-related components, including screens and widgets.
    - **screens/**: Houses the different screens of the app, such as `HomeScreen`, `MovieDetailsScreen`, `FavoritesScreen`, and `SettingsScreen`.
    - **widgets/**: Includes reusable UI components, such as `MovieCard` and `GenreSelector`.

  - **state/**: Dedicated to state management using the ``` BLoC (Business Logic Component) ``` pattern.
    - `movie_bloc.dart`, `genre_bloc.dart`, and `favorites_bloc.dart`: Manage the state for movies, genres, and favorites, respectively.

  - **utils/**: Contains utility classes and constants.
    - `constants.dart`: Defines app-wide constants, such as API keys and URLs.

- **main.dart**: The entry point of the application, where the app is initialized and the home screen is loaded.

theme.dart manages the app's theming, including light and dark modes.
main.dart: The entry point of the application, where the app is initialized and the home screen is loaded.



## Setting Up and Running the Project Locally

To set up and run the project locally, follow the steps below:

### 1. Prerequisites

Ensure that you have the following software installed on your machine:

- **Flutter SDK**: Download and install Flutter from the [official Flutter website](https://flutter.dev/docs/get-started/install). Ensure that your PATH environment variable is set correctly.
- **Dart SDK**: Comes bundled with Flutter.
- **Android Studio**: For Android development, including the Android SDK. You can download it from the [Android Studio website](https://developer.android.com/studio).
- **Xcode**: For iOS development (macOS only). Download from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835).
- **VS Code** or **Android Studio**: Preferred code editors. Install VS Code from the [official website](https://code.visualstudio.com/) or Android Studio from the [Android Studio website](https://developer.android.com/studio).

### 2. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/majharul-islam181/Orange_Theatre
```

### 3. Navigate to the Project Directory

Move into the project directory:

```bash
cd orange_theatre
```

### 4. Install Dependencies
Install the necessary Flutter dependencies by running the following command:
```
flutter pub get
```

### 5. Run the Project
To run the project on the selected device or emulator, use the following command::
```
flutter run
```



