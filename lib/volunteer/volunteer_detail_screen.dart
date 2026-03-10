import 'package:flutter/material.dart';
import 'volunteer_model.dart';
import 'widgets/event_tag.dart';
import 'widgets/progress_participants.dart';
import 'widgets/reward_popup.dart';
import 'report_page.dart';

class VolunteerDetailScreen extends StatefulWidget {
  final VolunteerEvent event;

  const VolunteerDetailScreen({super.key, required this.event});

  @override
  State<VolunteerDetailScreen> createState() => _VolunteerDetailScreenState();
}

class _VolunteerDetailScreenState extends State<VolunteerDetailScreen> {
  Future<void> showLoading() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage("assets/logo_eduvogreen.png"),
                width: 100,
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Color(0xff2E7D32)),
            ],
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
  }

  Future<void> showRewardPopup() async {
    showDialog(
      context: context,
      builder: (context) {
        return const RewardPopup();
      },
    );
  }

  void daftar() async {
    if (!widget.event.isOpen) return;

    if (widget.event.isRegistered) return;

    if (widget.event.currentParticipants >= widget.event.maxParticipants)
      return;

    await showLoading();

    setState(() {
      widget.event.currentParticipants++;
      widget.event.isRegistered = true;
    });

    await showRewardPopup();
  }

  @override
  void toggleSave() {
    setState(() {
      widget.event.isSaved = !widget.event.isSaved;
    });
  }

  Widget build(BuildContext context) {
    final event = widget.event;

    bool isClosed = !event.isOpen;
    bool isRegistered = event.isRegistered;

    bool buttonDisabled = isClosed || isRegistered;

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
                      icon: const Icon(Icons.arrow_back),
                      color: Color(0xff2E7D32),
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

                  const SizedBox(height: 8),

                  Text(event.description),

                  const SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            color: Color(0xff2E7D32),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),

                          child: const Text(
                            "Kriteria Peserta",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(14),

                          child: Column(
                            children: List.generate(event.criteria.length, (
                              index,
                            ) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),

                                padding: const EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),

                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: const Color(0xff2E7D32),
                                      child: Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

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
                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            color: Color(0xff2E7D32),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),

                          child: const Text(
                            "Benefit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(14),

                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,

                            children: event.benefits.map((benefit) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Color(0xff2E7D32),
                                    ),

                                    const SizedBox(width: 6),

                                    Text(benefit),
                                  ],
                                ),
                              );
                            }).toList(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ReportPage()),
                    );
                  },

                  icon: const Icon(Icons.error_outline, color: Colors.red),

                  label: const Text("Lapor"),
                ),

                const SizedBox(width: 10),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.event.isSaved
                        ? const Color(0xff2E7D32)
                        : Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                  ),

                  onPressed: toggleSave,

                  icon: Icon(
                    Icons.bookmark,
                    color: widget.event.isSaved ? Colors.yellow : Colors.grey,
                  ),

                  label: const Text("Simpan"),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonDisabled
                      ? Colors.grey
                      : const Color(0xff2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),

                onPressed: buttonDisabled ? null : daftar,

                child: Text(
                  isRegistered
                      ? "Sudah Terdaftar"
                      : isClosed
                      ? "Pendaftaran Belum Dibuka"
                      : "Daftar Sekarang",

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
