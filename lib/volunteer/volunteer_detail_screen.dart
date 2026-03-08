import 'package:flutter/material.dart';
import 'volunteer_model.dart';
import 'widgets/event_tag.dart';
import 'widgets/progress_participants.dart';

class VolunteerDetailScreen extends StatefulWidget {
  final VolunteerEvent event;

  const VolunteerDetailScreen({super.key, required this.event});

  @override
  State<VolunteerDetailScreen> createState() => _VolunteerDetailScreenState();
}

class _VolunteerDetailScreenState extends State<VolunteerDetailScreen> {
  void daftar() {
    if (widget.event.currentParticipants < widget.event.maxParticipants) {
      setState(() {
        widget.event.currentParticipants++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                Image.asset(
                  event.image,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff2E7D32),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      EventTag(label: event.category),
                      const SizedBox(width: 8),
                      EventTag(label: event.activity),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 6),

                      Text(event.date),

                      const SizedBox(width: 6),
                      const Text("•"),
                      const SizedBox(width: 6),

                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 6),

                      Text(event.time),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 6),
                      Text(event.location),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ProgressParticipants(
                    current: event.currentParticipants,
                    max: event.maxParticipants,
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(event.organizerLogo),
                      ),

                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Penyelenggara Event",
                            style: TextStyle(fontSize: 12),
                          ),

                          Text(
                            event.organizer,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Tentang Event",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  const SizedBox(height: 6),

                  Text(event.description),
                  const SizedBox(height: 25),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // HEADER
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            color: Color(0xff2E7D32),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Kriteria Peserta",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        // ISI
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),

                          child: Column(
                            children: List.generate(event.criteria.length, (
                              index,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${index + 1}. "),

                                    Expanded(
                                      child: Text(event.criteria[index]),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.flag),
                  label: const Text("Lapor"),
                ),

                const SizedBox(width: 10),

                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border),
                  label: const Text("Simpan"),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: event.isOpen
                      ? const Color(0xff2E7D32)
                      : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: event.isOpen ? daftar : null,
                child: Text(
                  event.isOpen ? "Daftar Sekarang" : "Pendaftaran Belum Dibuka",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
