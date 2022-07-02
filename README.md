# ny_times


**Used patterns**:
- BLoC.
- Clean Architecture Layers (TDD).



## Main Dependencies:
1. **Flutter BLoC** for State Management.
2. **Get It** (Service Locator and Dependencies container).
4. **Http Package** (Http Client).
5. **BLoC Test**.
6. **mockito & bloc_test** for testing.

### Project structure:

```
ny_times
├─ lib
│  ├─ features
│  │  └─ most_popular_articles
│  │     ├─ data
│  │     │  ├─ data_source
│  │     │  ├─ models
│  │     │  └─ repository
│  │     ├─ domain
│  │     │  ├─ repository
│  │     │  └─ use_case
│  │     └─ presentation
│  │        ├─ bloc
│  │        ├─ screens
│  ├─ injection.dart
│  └─ main.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
└─ test
   └─ features
      └─ most_popular_articles
         └─ presentation
            └─ bloc

```


for test Code Coverage HTML Reports

first run in project terminal: Coverage HTML Reports
then run: flutter test --coverage
then run: genhtml ./coverage/lcov.info -o coverage
