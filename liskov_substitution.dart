/*
The Liskov Substitution Principle (LSP) states that subtypes should be substitutable for their base types without altering the correctness of the program. 
In simpler terms, if a class B is a subtype of class A, then objects of type A should be able to be replaced by objects of type B without causing unexpected behavior.

class Bird {
  void fly() {
    print('Flying');
  }
}

Violation
---------
class Penguin extends Bird {
  @override
  void fly() {
    // Penguins cannot fly, but we still inherit the fly() method
    throw Exception('Penguins cannot fly!');
  }
}

void makeBirdFly(Bird bird) {
  bird.fly();
}

void main() {
  var bird = Bird();
  var penguin = Penguin();
  
  makeBirdFly(bird);      // Works fine
  makeBirdFly(penguin);   // Throws an exception because penguins can't fly
}

*/

// Refactored Code
abstract class Bird {
  void eat() {
    print('Eating');
  }
}

abstract class Flyable {
  void fly();
}

class Sparrow extends Bird implements Flyable {
  @override
  void fly() {
    print('Sparrow is flying');
  }
}

class Penguin extends Bird {
  // Penguins don't implement Flyable because they can't fly
}

void makeBirdFly(Flyable bird) {
  bird.fly();
}

void main() {
  var sparrow = Sparrow();
  var penguin = Penguin();
  
  makeBirdFly(sparrow);   // Works fine
  // makeBirdFly(penguin); // This will now give a compile-time error, as intended
}


/*
Explanation:

Bird class:
-----------
We define a general Bird class for common bird behaviors, like eating. Not all birds can fly, so fly() is removed from this class.

Flyable interface:
-------------------
We introduce a new interface Flyable with the fly() method. This interface is implemented only by birds that can fly, like Sparrow.

Concrete Classes (Sparrow, Penguin):
------------------------------------
Sparrow is a bird that can fly, so it implements both Bird and Flyable.
Penguin is a bird that cannot fly, so it does not implement Flyable.

makeBirdFly() method:
---------------------
The makeBirdFly function expects an object that implements the Flyable interface. Since Penguin does not implement Flyable, it cannot be passed into this method, preventing any runtime errors.
*/