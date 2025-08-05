void main() {
  // Define a list of your favorite animal
  List<String> favoriteAnimals = ['Cat', 'Dog', 'Lion', 'Tiger'];

  // Print the list
  print('My favorite Animals: $favoriteAnimals');
  favoriteAnimals.add('cheetah');
  print('After adding cheetah: $favoriteAnimals');


  // Add a new animal to the list
  

  // Remove an animal from the list
  favoriteAnimals.remove('Dog');
  print('After removing Dog: $favoriteAnimals');
bool containsCat = favoriteAnimals.contains('Cat');
print('does the list contaian Cat?${containsCat}');

  // Check if the list contains a specific animal
  
}