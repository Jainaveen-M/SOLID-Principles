# SOLID Principles in Dart - A Learning Repository

## Description
This project is designed to help developers learn and practice the **SOLID** principles of object-oriented design using **Dart**. Each of the five principles is explained and demonstrated with practical code examples that show both violations and correct implementations of each principle.

### What is SOLID?
SOLID is an acronym that represents five design principles intended to make software designs more understandable, flexible, and maintainable:
- **S**ingle Responsibility Principle (SRP)
- **O**pen/Closed Principle (OCP)
- **L**iskov Substitution Principle (LSP)
- **I**nterface Segregation Principle (ISP)
- **D**ependency Inversion Principle (DIP)

## Principles Demonstrated
### 1. **Single Responsibility Principle (SRP)**
- Example: Refactor a `UserManager` class that manages both user registration and email notifications into separate `UserManager` and `NotificationService` classes, each with a single responsibility.

### 2. **Open/Closed Principle (OCP)**
- Example: Refactor a `Shape` class that calculates areas for different shapes by using inheritance and polymorphism to extend functionality without modifying existing code.

### 3. **Liskov Substitution Principle (LSP)**
- Example: Demonstrate how a `Bird` class can be refactored so that subclasses like `Penguin` do not violate expectations of the `Bird` class by using proper abstractions.

### 4. **Interface Segregation Principle (ISP)**
- Example: Separate a large `Worker` interface into smaller, more specific interfaces such as `Workable` and `Eatable`, ensuring that clients only implement methods they need.

### 5. **Dependency Inversion Principle (DIP)**
- Example: Refactor a `UserService` class that directly depends on an `EmailService` by introducing an abstraction (`NotificationService`) and using dependency injection to make the code flexible and testable.

## Features
- **Educational content**: Learn SOLID principles through code examples and explanations.
- **Code refactoring exercises**: Start with code that violates a principle, and refactor it to follow the principle.
- **Comments and documentation**: Clear explanations and comments are included to help you understand the purpose of each refactor.
- **Unit testing**: Unit tests included to show how applying SOLID principles can improve testability and reduce tightly coupled dependencies.

## Getting Started
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/solid-principles-dart.git
   cd solid-principles-dart
