import 'package:flutter/material.dart';
import '../volunteer_model.dart';
import '../volunteer_detail_screen.dart';
import 'progress_participants.dart';
import 'event_tag.dart';

class VolunteerCard extends StatelessWidget {
  final VolunteerEvent event;
  final VoidCallback onUpdate;

  const VolunteerCard({super.key, required this.event, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    bool isClosed = !event.isOpen;
    bool isRegistered = event.isRegistered;
    bool buttonDisabled = isClosed || isRegistered;

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VolunteerDetailScreen(event: event),
          ),
        );

        onUpdate();
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image.asset(
                    event.image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: EventTag(label: event.category),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(14),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        event.activity,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 6),
                      const Text("•"),
                      const SizedBox(width: 6),

                      Text(
                        event.date,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    event.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: ProgressParticipants(
                          current: event.currentParticipants,
                          max: event.maxParticipants,
                        ),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonDisabled
                              ? Colors.grey
                              : const Color(0xff2E7D32),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),

                        onPressed: buttonDisabled
                            ? null
                            : () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        VolunteerDetailScreen(event: event),
                                  ),
                                );

                                onUpdate();
                              },

                        child: Text(isRegistered ? "Terdaftar" : "Daftar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
