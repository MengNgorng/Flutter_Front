// //1. Class and Object
// Define a class called 'Car'
// class Car {
//   // Properties (or attributes) of the class
//   String brand;
//   String model;
//   int year;
//
//   // Constructor to initialize the properties
//   Car(this.brand, this.model, this.year);
//
//   // Method (or function) of the class
//   void displayInfo() {
//     // This method displays the information of the car
//     print('Car: $brand $model, Year: $year');
//   }
// }
//
// void main() {
//   // Create an object (or instance) of the class 'Car'
//   Car myCar = Car('Toyota', 'Corolla', 2020);
//
//   // Access the method using the object
//   myCar.displayInfo(); // Output: Car: Toyota Corolla, Year: 2020
// }
//
// 2.inheritance
// Base class (or parent class)
// class Animal {
//   // Property of the class
//   String name;
//
//   // Constructor to initialize the name
//   Animal(this.name);
//
//   // Method of the class
//   void sound() {
//     print('$name makes a sound.');
//   }
// }
//
// // Derived class (or child class) that inherits from Animal
// class Dog extends Animal {
//   // Constructor of the Dog class
//   Dog(String name) : super(name); // Calls the constructor of the parent class
//
//   // Overriding the method from the parent class
//   @override
//   void sound() {
//     print('$name barks.');
//   }
// }
//
// void main() {
//   // Create an object of the Dog class
//   Dog myDog = Dog('Buddy');
//
//   // Access the method using the object
//   myDog.sound(); // Output: Buddy barks.
// }

// //3. encapsulation
// // Define a class
// class Student {
//   String _name; // Private variable
//   int _age;
//
//   Student(this._name, this._age);
//
//   // Getter method
//   String get name => _name;
//
//   // Setter method
//   set name(String newName) {
//     _name = newName;
//   }
// }
//
// void main() {
//   Student student = Student('John', 20);
//   print(student.name); // Output: John
//   student.name = 'Doe';
//   print(student.name); // Output: Doe
// }


// // 4.Access Modifier
// // Define a class called 'Person'
// class Person {
//   // Public property (no underscore)
//   String name;
//
//   // Private property (with underscore)
//   int _age;
//
//   // Constructor to initialize the properties
//   Person(this.name, this._age);
//
//   // Public method to get the age
//   int getAge() {
//     return _age;
//   }
//
//   // Public method to set the age (with validation)
//   void setAge(int age) {
//     if (age >= 0) {
//       _age = age;
//     } else {
//       print('Age cannot be negative.');
//     }
//   }
//
//   // Public method to display person's information
//   void displayInfo() {
//     print('Name: $name, Age: ${getAge()}');
//   }
// }
//
// void main() {
//   // Create an object of the Person class
//   Person person = Person('Alice', 30);
//
//   // Access the public property directly
//   print('Name: ${person.name}'); // Output: Name: Alice
//
//   // Access the private property directly (not allowed, this will cause an error)
//   // print('Age: ${person._age}'); // Uncommenting this will cause an error
//
//   // Use public methods to interact with the private property
//   person.setAge(35);
//   print('Updated Age: ${person.getAge()}'); // Output: Updated Age: 35
//
//   // Display the person's information using a public method
//   person.displayInfo(); // Output: Name: Alice, Age: 35
// }

// // 5.override data member
// // Define a base class called 'Animal'
class Animal {
  // Property of the base class
  String name = 'Unknown';

  // Method of the base class
  void makeSound() {
    print('$name makes a sound.');
  }
}

// Define a subclass called 'Dog' that extends 'Animal'
class Dog extends Animal {
  // Override the property in the subclass
  @override
  String name = 'Dog';

  // Override the method in the subclass
  @override
  void makeSound() {
    print('$name barks.');
  }
}

void main() {
  // Create an object of the base class
  Animal myAnimal = Animal();
  myAnimal.makeSound(); // Output: Unknown makes a sound.

  // Create an object of the subclass
  Dog myDog = Dog();
  myDog.makeSound(); // Output: Dog barks.
}



