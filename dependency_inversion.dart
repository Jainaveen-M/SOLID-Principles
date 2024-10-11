/*
The Dependency Inversion Principle (DIP) states that high-level modules should not depend on low-level modules,
both should depend on abstractions (interfaces or abstract classes).
Additionally, abstractions should not depend on details,but details should depend on abstractions.

Violation
----------
class EmailService {
  void sendEmail(String message) {
    print('Sending email with message: $message');
  }
}

class UserService {
  final EmailService emailService = EmailService();
  
  void notifyUser() {
    emailService.sendEmail('Welcome to our service!');
  }
}

void main() {
  var userService = UserService();
  userService.notifyUser();
}

*/


// Refactored Code
// Abstract class (Abstraction)
abstract class NotificationService {
  void sendMessage(String message);
}

// Low-level module: EmailService
class EmailService implements NotificationService {
  @override
  void sendMessage(String message) {
    print('Sending email with message: $message');
  }
}

// Low-level module: SMSService
class SMSService implements NotificationService {
  @override
  void sendMessage(String message) {
    print('Sending SMS with message: $message');
  }
}

// High-level module: UserService (depends on abstraction)
class UserService {
  final NotificationService _notificationService;

  UserService(this._notificationService);

  void notifyUser() {
    _notificationService.sendMessage('Welcome to our service!');
  }
}

void main() {
  // Injecting EmailService as a dependency
  var emailService = EmailService();
  var userServiceWithEmail = UserService(emailService);
  userServiceWithEmail.notifyUser();  // Output: Sending email with message: Welcome to our service!
  
  // Injecting SMSService as a dependency
  var smsService = SMSService();
  var userServiceWithSMS = UserService(smsService);
  userServiceWithSMS.notifyUser();  // Output: Sending SMS with message: Welcome to our service!
}

/*
Explanation:
---------------

NotificationService Interface:
------------------------------
This is the abstraction. Both EmailService and SMSService implement this interface. This means UserService no longer depends on any specific service—it only relies on the interface.

Low-level Modules (EmailService, SMSService):
--------------------------------------------
These are the low-level modules that implement the NotificationService interface. Each one has its own implementation of sendMessage().

High-level Module (UserService):
---------------------------------
The UserService class depends on the NotificationService interface (abstraction). In the constructor, we inject a NotificationService implementation (either EmailService or SMSService).
UserService can work with any class that implements NotificationService without needing any changes.

Dependency Injection:
----------------------
In main(), we inject the specific services (EmailService or SMSService) into UserService. This makes the code flexible and easy to modify or test.

Benefits:
-----------
Loosely Coupled: UserService no longer needs to know the details of EmailService or SMSService. It can work with any notification service that implements NotificationService.
Testability: In tests, you can easily substitute NotificationService with a mock implementation.

 */