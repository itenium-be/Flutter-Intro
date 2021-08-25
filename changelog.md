1. Data Model
* Add initial data model "ZwaarsteLijst" (hardcoded)
* Basic ListView setup.

2. Stateful Widget
* Add extra fields on ListView items.
* Add favourite toggle state.

3. JSON source + List population
3.1 Async call + initState
* Add manual JSON mapping
* Load JSON file + populate list

3.2 Pull-to-refresh

3.3 FutureBuilder
* Use FutureBuilder to build up TableView
* TableView is no longer stateful (FutureBuilder handles state and boilerplate code)
* Error-handling and loading state

4. Assets and images
* Add band icons
* Refactor favourite display: Add box shadow