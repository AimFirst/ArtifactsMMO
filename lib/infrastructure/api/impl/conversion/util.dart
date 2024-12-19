extension StringExtensions on String {
  String toCamelCase() {
    // Check if the string is empty or null
    if (isEmpty) {
      return this;
    }

    // Split the string into words based on spaces, underscores, or hyphens
    final words = split(RegExp(r'[_\s-]+'));

    // Capitalize the first letter of each word except the first one
    final camelCaseWords = words.map((word) {
      if (words.indexOf(word) == 0) {
        return word.toLowerCase(); // Keep the first word lowercase
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });

    // Join the words back together
    return camelCaseWords.join('');
  }

  String toUnknownIfEmpty() {
    if (isEmpty) {
      return "unknown";
    }

    return this;
  }
}