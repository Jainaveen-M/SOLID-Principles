
/* In the Single Responsibility Principle (SRP), 
each class should have only one reason to change, meaning it should only have one responsibility. 
This promotes cleaner code that is easier to maintain, test, and understand.
 

Violation
---------
class UserManager {
  void createUser(String username, String password) {
    // Logic to create a user
    print('User $username created with password $password');
  }

  void sendWelcomeEmail(String username) {
    // Logic to send a welcome email
    print('Sending welcome email to $username');
  }
}
*/

// Refactored Code
class UserManager {
  void createUser(String username, String password) {
    // Logic to create a user
    print('User $username created with password $password');
  }
}

class NotificationService {
  void sendWelcomeEmail(String username) {
    // Logic to send a welcome email
    print('Sending welcome email to $username');
  }
}

void main() {
  NotificationService notificationService = NotificationService();
  UserManager userManager = UserManager();

  userManager.createUser('john_doe', 'password123');
  notificationService.sendWelcomeEmail("john_doe");
}

/*
Explanation:
-------------
UserManager:
-------------
This class is now solely responsible for user creation logic.

NotificationService:
----------------------
This class is responsible for sending notifications (like emails).

*/