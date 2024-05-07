class TextProcessor {
  List<String> _words = [];

  // Метод для приема текстового блока
  void receiveText(String text) {
    // Разбиваем текст на слова с помощью регулярного выражения
    _words = text.replaceAll(RegExp(r'[.,]'), '').toLowerCase().split(RegExp(r'\W+')).toSet().toList();
  }

  // Метод для сортировки слов
  void sortWords() {
    _words.sort();
  }

  // Метод для получения отсортированного списка слов
  List<String> getSortedWords() {
    return List.from(_words);
  }
}