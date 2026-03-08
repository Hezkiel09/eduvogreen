class VolunteerEvent {
  final String title;
  final String category;
  final String activity;
  final String location;
  final String date;
  final String time;
  final String image;
  final String organizer;
  final String organizerLogo;
  final String description;
  int currentParticipants;
  final int maxParticipants;
  final List<String> criteria;
  final bool isOpen;

  VolunteerEvent({
    required this.title,
    required this.category,
    required this.activity,
    required this.location,
    required this.date,
    required this.time,
    required this.image,
    required this.organizer,
    required this.organizerLogo,
    required this.description,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.criteria,
    required this.isOpen,
  });

  double get progress => currentParticipants / maxParticipants;
}