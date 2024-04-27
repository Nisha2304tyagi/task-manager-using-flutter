# task_manager 

. **App Structure**: The app is structured with two main classes: `TaskManagerApp` (the main app widget) and `TaskListScreen` (the screen containing the task lists).

2. **Task Model**: The `Task` class defines a basic model for tasks, with properties for the task name (`name`) and whether it's completed (`isCompleted`).

3. **TaskManagerApp**: This is the root widget of the app. It sets up the `MaterialApp` with a title, theme, and debug banner configuration. The `home` property is set to `TaskListScreen`, which will be the initial screen of the app.

4. **TaskListScreen**: This is a `StatefulWidget` representing the task list screen. It manages the tab controller (`_tabController`) for switching between personal, work, and other tasks.

5. **Initialization and Disposal**: In the `initState` method, the `_tabController` is initialized with a length of 3 (for 3 tabs) and `SingleTickerProviderStateMixin` for animation support. The listener on the tab controller updates the UI when the tab index changes.

6. **Task Management Methods**: 
   - `_addTask(String taskName)`: Adds a new task to the appropriate list based on the current tab index.
   - `_toggleTaskCompletion(List<Task> tasks, int index)`: Toggles the completion status of a task in the specified list.
   - `_deleteTask(List<Task> tasks, int index)`: Deletes a task from the specified list.

7. **Build Method**: 
   - The `Scaffold` widget provides the basic app structure with an `AppBar` containing the app title and a `TabBar` for tab navigation.
   - The `Drawer` widget provides a side drawer with a header (showing the user's name) and items for profile, calendar, and clock.
   - The `body` contains a `Stack` widget to overlay the background image based on the selected tab index, and a `TabBarView` to display the task lists.
   - The `floatingActionButton` is used to add new tasks. It opens a dialog where the user can enter the task name.

8. **Task List Building**: The `_buildTaskList` method creates a `ListView.builder` for displaying the list of tasks. Each task is displayed as a `ListTile` with a title (task name) and trailing widgets for deleting the task and toggling its completion status.

9. **Styling**: 
   - The `TextStyle` for the task names is set to have a larger font size (27) to make them more prominent.
   - Background images for each tab are conditionally displayed using `Image.asset` inside the `Stack`.
  
   - ![s3](https://github.com/Nisha2304tyagi/task-manager-using-flutter/assets/120704195/a4368fb0-8256-4470-82ec-8aaec8913824)
   - ![s2](https://github.com/Nisha2304tyagi/task-manager-using-flutter/assets/120704195/367d0d48-091d-4612-8442-2134434feedf)
   - ![S1](https://github.com/Nisha2304tyagi/task-manager-using-flutter/assets/120704195/4043b48d-ed83-4afc-81eb-7d7429a8c64a)



