import 'dart:convert';  // Import the dart:convert package to work with JSON

// Define the Students class
class Students {
  // List to store people, which is a List of Maps (each map represents a person)
  List<Map<String, String>> people;

  // Constructor that accepts a List<Map<String, String>> and assigns it to the people variable
  Students(this.people);

  // Method to sort the List of people based on a given field (e.g., "first" or "last")
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));  // Sort by the field provided
  }

  // Method to print all the items in the List
  void output() {
    for (var person in people) {
      print(person);  // Print each person's details (first, last, email)
    }
  }

  // Method to add a new person (as a Map) to the List
  void plus(Map<String, String> person) {
    people.add(person);  // Add the person to the list
  }

  // Method to remove a person from the List using the removeWhere() method based on a field value
  void remove(String field) {
    people.removeWhere((person) => person.containsValue(field));  // Remove person where field value matches
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  // Decode the JSON string to a List<Map<String, dynamic>>, then map to List<Map<String, String>>
  List<Map<String, String>> people = List<Map<String, String>>.from(
    jsonDecode(json).map((person) => Map<String, String>.from(person))
  );

  // Create a Students object and pass the list of people to it
  Students students = Students(people);

  print('The Original List of students:');
  students.output();

  // Sort the list by last name and print the sorted list
  print('\nSorted the list by last name:');
  students.sort('last');
  students.output();

  // Add a new student to the list and print the updated list
  print('\nAfter adding a new student:');
  students.plus({"first": "John", "last": "Doe", "email": "doej@algonquincollege.com"});
  students.output();

  // Remove a student by their first name and print the updated list
  print('\nAfter removing Adesh:');
  students.remove("Adesh");
  students.output();
}
