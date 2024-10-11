
/*
The Open/Closed Principle (OCP) states that a class should be open for extension but closed for modification. 
This means that you should be able to add new functionality to an existing class without altering its existing code.


Violation
---------
class Shape {
  final String type;

  Shape(this.type);
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    if (shape.type == 'circle') {
      return 3.14 * 5 * 5; // assuming radius = 5
    } else if (shape.type == 'square') {
      return 5 * 5; // assuming side = 5
    } else {
      throw Exception('Shape not recognized');
    }
  }
}

void main() {
  var circle = Shape('circle');
  var square = Shape('square');
  
  var calculator = AreaCalculator();
  print('Circle Area: ${calculator.calculateArea(circle)}');
  print('Square Area: ${calculator.calculateArea(square)}');
}
 */


// Refactored Code
abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class Square extends Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}

void main() {
  var circle = Circle(5);
  var square = Square(5);
  
  var calculator = AreaCalculator();
  print('Circle Area: ${calculator.calculateArea(circle)}');
  print('Square Area: ${calculator.calculateArea(square)}');
}

/*
Explanation:

Shape Interface:
------------------
We define an abstract Shape class that enforces the implementation of a calculateArea() method. This method will be implemented by specific shapes like Circle and Square.

Concrete Classes (Circle, Square):
------------------------------------
Each shape (e.g., Circle, Square) has its own implementation of the calculateArea method. When we want to add a new shape, we can simply extend the Shape class without modifying any existing code.

AreaCalculator:
-----------------
The AreaCalculator class remains unchanged as it relies on polymorphism to calculate the area by calling shape.calculateArea(). If a new shape is added, like Triangle, we can extend the Shape class and implement calculateArea() in the new class.
*/