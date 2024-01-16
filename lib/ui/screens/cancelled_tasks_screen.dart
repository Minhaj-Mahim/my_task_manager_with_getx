import 'package:flutter/material.dart';
import 'package:my_task_manager_with_getx/ui/widgets/body_background.dart';
import 'package:my_task_manager_with_getx/ui/widgets/profile_summary_card.dart';


class CancelledTasksScreen extends StatefulWidget {
  const CancelledTasksScreen({super.key});

  @override
  State<CancelledTasksScreen> createState() => _CancelledTasksScreenState();
}

class _CancelledTasksScreenState extends State<CancelledTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Column(
            children: [
              const ProfileSummeryCard(),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    //return const TaskItemCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
