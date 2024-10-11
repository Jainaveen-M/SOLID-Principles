
/*

The Interface Segregation Principle (ISP) states that 
no client should be forced to depend on methods it does not use. 
This means instead of having one large, monolithic interface (or class with many methods), 
we should split it into smaller, more specific interfaces so that clients only need to know about the methods they actually use.

Violation
---------
class Worker {
  void work() {
    print('Working');
  }
  
  void eat() {
    print('Eating');
  }
}

class HumanWorker extends Worker {
  @override
  void work() {
    print('Human is working');
  }

  @override
  void eat() {
    print('Human is eating');
  }
}

class RobotWorker extends Worker {
  @override
  void work() {
    print('Robot is working');
  }

  // The RobotWorker doesn't need to eat, but we still have to implement it
  @override
  void eat() {
    throw Exception('Robots do not eat!');
  }
}

void main() {
  var human = HumanWorker();
  var robot = RobotWorker();
  
  human.work();
  human.eat();

  robot.work();
  // robot.eat(); // This will throw an exception, which is bad design.
}

*/


// Refactored Code
abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

class HumanWorker implements Workable, Eatable {
  @override
  void work() {
    print('Human is working');
  }

  @override
  void eat() {
    print('Human is eating');
  }
}

class RobotWorker implements Workable {
  @override
  void work() {
    print('Robot is working');
  }

  // No need to implement `eat()` because RobotWorker doesn't eat.
}

void main() {
  var human = HumanWorker();
  var robot = RobotWorker();
  
  human.work();
  human.eat();  // Human eats

  robot.work();
  // robot.eat(); // This is now not even possible, because RobotWorker doesn't implement Eatable.
}

/*

Explanation:
-------------
Workable interface:
-------------------
This interface defines the work() method, which all workers (both human and robot) must implement.

Eatable interface:
------------------
This interface defines the eat() method, which only human workers need to implement.

Concrete Classes (HumanWorker, RobotWorker):
---------------------------------------------
The HumanWorker class implements both Workable and Eatable because humans can both work and eat.
The RobotWorker class only implements Workable since robots only need to work and do not eat.

By applying the Interface Segregation Principle, we avoid forcing RobotWorker to implement unnecessary methods (like eat()). Each class only depends on the interfaces that are relevant to its functionality. This design is more flexible and avoids potential errors related to unnecessary implementations.

*/