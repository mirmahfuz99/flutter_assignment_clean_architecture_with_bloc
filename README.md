# Overview

A flutter project built with flutter bloc and clean architecture have features like authentication and home.
This application utilizes the BLoC (Business Logic Component) pattern and Clean Architecture principles to ensure a scalable and maintainable application.

The application each features is divided into different layers:
- Data Layer - Manages data retrieval and persistence
- Domain Layer - Encapsulates business logic and entities, providing use cases that interact with the presentation layer.
- Presentation Layer - Handles UI components and user interactions, utilizing Flutter widgets and BLoC for state management.

## Features

- Sign In Screen
- Signup Screen
- Profile and Update Profile
- Home Screen with product list
- Proudct filters with criteria like newest, oldest, priceLow, priceHigh, bestSelling


## Package/Dependencies used.
- formz - Provides form representation and validation in Dart.
- equatable - Being able to compare objects in Dart. == returns true if two objects are the same instance.
- flutter_bloc - Makes easy to integrate blocs and cubits into flutter.Basicaly used with bloc package.
- get_it - This is a simple Service Locator for Dart and Flutter
- dio - A powerful HTTP networking package for Dart/Flutter. Supports Global configuration, Interceptors and others.
- pretty_dio_logger - Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy to read format.
- freezed - code generator for data-classes
- freezed_annotation - Annotations for freezed package
- shared_preferences - Flutter plugin for reading and writing simple key-value pairs
- cached_network_image - Flutter library to load and cache network images.
- build_runner - provides a concrete way of generating files using Dart code.


## Setup Requirements
- Android Studio and Android device or emulator


## Getting Started
In order to run this app on your machine, you need to:

1.  Clone this project
2.  Import the project into Android Studio
3.  Connect your Android device with USB or just start your emulator
4.  After the project has finished setting up it stuffs, click the run button 