class Questions{
  final String id;
  final String title;
  final Map<String, bool> options;

  Questions({
    required this.id,
    required this.title,
     required this.options,
  });
  String toString(){
    return 'The question (id is: $id, title is: $title, options is: $options)';
  }
}