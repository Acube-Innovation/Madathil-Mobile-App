import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/tasks/task_creation.dart';
import 'package:madathil/view/screens/tasks/task_details.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: AppColors.primeryColor,
            child: const Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TaskCreationScreen()))),
        appBar: const CustomAppBar(title: "Tasks"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: TabBar(
                    dividerColor: Colors.transparent,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primeryColor),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primeryColor,
                    unselectedLabelColor: AppColors.primeryColor,
                    tabs: const [
                      Tab(text: 'Own'),
                      Tab(text: 'Others'),
                    ],
                    indicatorColor: AppColors.primeryColor),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: TabBarView(
                  children: [OwnTasks(), OtherTasks()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OwnTasks extends StatelessWidget {
  const OwnTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 46,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              suffixIcon: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primeryColor),
                  child: const Icon(Icons.search, color: Colors.white)),
              enabled: true,
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.black),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.primeryColor, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.red),
              ),
              hintText: "Search",
              counterText: "",
              hintStyle: const TextStyle(
                // fontFamily: "SF Pro Display",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.275,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => const TaskListItem(),
        )
      ],
    );
  }
}

class OtherTasks extends StatelessWidget {
  const OtherTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TaskDetailScreen()));
      },
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                suffixIcon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primeryColor),
                    child: const Icon(Icons.search, color: Colors.white)),
                enabled: true,
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: AppColors.black),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.grey, width: 1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.grey, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide:
                      BorderSide(color: AppColors.primeryColor, width: 1),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColors.red),
                ),
                hintText: "Search",
                counterText: "",
                hintStyle: const TextStyle(
                  // fontFamily: "SF Pro Display",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.275,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => const TaskListItem(),
          )
        ],
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Image.asset(getImage("Money"), width: 50),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check Payment",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Customer: User Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.black),
                    ),
                    Text(
                      "22-09-2024 before 5pm",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.primeryColor),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "1",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.black),
                  ),
                  Text(
                    "Hrs",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Completed",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String getImage(String? status) {
  switch (status?.toLowerCase()) {
    case "money":
      return AppImages.moneyImage;
    case "assign":
      return AppImages.assignImage;
    case "sheet":
      return AppImages.sheetsImage;
    default:
      return AppImages.moneyImage;
  }
}
