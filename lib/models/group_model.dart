class Group {
  final String imageUrl;
  final String title;
  final String description;
  final int participants;
  final bool isOnline;

  const Group({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.participants,
    required this.isOnline,
  });
}