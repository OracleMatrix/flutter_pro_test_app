# Pro Test App

A Flutter project designed to showcase a clean and professional implementation of various features, including social media posts, todos, and user authentication.

---

## Features

- **Social Media Posts**:
  - Fetch and display posts with details like title, body, tags, reactions, and views.
  - Interactive UI with smooth animations and transitions.

- **Todos**:
  - Manage todos with a user-friendly interface.
  - Mark todos as completed with a checkbox.

- **Authentication**:
  - User login and registration with validation.
  - Secure storage of user credentials.

- **Dependencies**:
  - Uses popular Flutter packages like `get`, `cached_network_image`, `flutter_login`, and more for enhanced functionality.

## Structure
```bash
pro_test_app/
├── lib/
├── app/
│   ├── data/
│   │   ├── models/ 
│   │   └── services/
│   ├── modules/
│   │   ├── authentication/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── home/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── posts/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   └── todos/
│   │       ├── bindings/
│   │       ├── controllers/
│   │       └── views/
│   ├── routes/│
├── main.dart

```

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/oraclematrix/pro_test_app.git
   cd pro_test_app
2. **Install dependencies:**
    ```bash
   flutter pub get
    ```
3. **Run the app:**
    ```bash
    flutter run
    ```
## Usage
### Social Media Posts
- Navigate to the Social Media section to view posts.

- Each post displays the title, body, tags, reactions (likes/dislikes), and views.

### Todos
- Navigate to the Todos section to manage your tasks.

- Mark tasks as completed by toggling the checkbox.

### Authentication
- Use the Login screen to authenticate.

- New users can register using the Sign Up option.

## Dependencies
This project uses the following key dependencies:

- State Management: ```get```

- Network Images: ```cached_network_image```

- Authentication: ```flutter_login```

- Routing: ```get```

- UI Enhancements: ```font_awesome_flutter```, ```another_flushbar```

- For a complete list of dependencies, check the ```pubspec.yaml``` file.

## Contributing
Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.

2. Create a new branch (git checkout -b feature/YourFeatureName).

3. Commit your changes (git commit -m 'Add some feature').

4. Push to the branch (git push origin feature/YourFeatureName).

5. Open a pull request.

## License
This project is licensed under the MIT ``License``

## Acknowledgments
- Thanks to the Flutter community for the amazing packages and resources.

- Special thanks to [Your Name] for the inspiration and guidance.

## Contact
For any questions or feedback, feel free to reach out:

- Email: ehsanmohamadipoor@gmail.com

- GitHub: OracleMatrix