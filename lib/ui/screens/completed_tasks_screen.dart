import 'package:flutter/material.dart';
import 'package:my_task_manager_with_getx/ui/widgets/body_background.dart';
import 'package:my_task_manager_with_getx/ui/widgets/profile_summary_card.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
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
