## Author
1. Patrick Ferrell

## Components
1. Using flutter_riverpod for state management
2. Using auto_route for navigation
3. Using fl_chart for charts
4. Using visibility_detector for visibility detection
5. Using path_provider for file storage
6. Using path for file path manipulation
7. Using intl for localization
8. Using sembast for database storage

## Design
1. Used MVVM pattern for design
2. Created folders to make it easy to find components
3. For employer page, made it so it initially gets data from json file, but once update the fields it will use the database
4. For employer page, made it so edit and view are on same layout
5. The json files are stored in assets folder one for mock_credit_profile and one for employment
6. Made it so you can add more "Credit Factors" and "Open Credit Card Accounts" to the json file and it will render it correctly
   on the page

## Comments
1. Tested code on iOS and Android
2. command to generate routes: flutter pub run build_runner build --delete-conflicting-outputs

## TO DO
1. Improve chart so automatically spans for different credit scores and vertical axis shows correct span of numbers
2. Improve bars on each open card accounts so they cover the correct length for the percentage
3. Work on web since using path_provider for file storage.  New different storage for the web