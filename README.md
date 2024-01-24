# film_planner

this is a simple project created based on your requirements and design. Project should be fully runnable.

see showcase for screenshots of app :)

# Requirements:
## flutter version: 3.16.4
## for running a project just use command: `flutter run`

# Project architecture

## Project is based on clean architecture with 4 layers: application, domain, infrastructure, presentation
- application: contains blocs that are responsible for state management
- domain: contains entities, enums and interfaces. Does not contain any logic, just pure dart objects.
- infrastructure: contains implementation of repositories interfaces
- presentation: contains pages, views and widgets

## Project features

- Core: contains PlatformBloc which is responsible to determine information about Platform state
  - in case of this app its only responsible for determining if user resolution is mobile or desktop
- TaskList: contains a page that displays list of tasks ordered by task status

# Showcase

![Screenshot 2024-01-24 at 1.05.11.png](showcase%2FScreenshot%202024-01-24%20at%201.05.11.png)

![Screenshot 2024-01-24 at 1.05.21.png](showcase%2FScreenshot%202024-01-24%20at%201.05.21.png)

![Screenshot 2024-01-24 at 1.05.33.png](showcase%2FScreenshot%202024-01-24%20at%201.05.33.png)