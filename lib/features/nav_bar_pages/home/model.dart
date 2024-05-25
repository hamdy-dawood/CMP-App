import 'package:cmp_app/features/nav_bar_pages/tasks/model.dart';

class HomeModel {
  String? status;
  UserData? userData;
  Map<String, dynamic>? attendanceStatistics;
  TaskStatistics? taskStatistics;
  List<Task>? tasks;

  HomeModel(
      {this.status,
        this.userData,
        this.attendanceStatistics,
        this.taskStatistics,
        this.tasks});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    attendanceStatistics = json['attendance_statistics'];
    taskStatistics = json['task_statistics'] != null
        ? new TaskStatistics.fromJson(json['task_statistics'])
        : null;
    if (json['tasks'] != null) {
      tasks = <Task>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.attendanceStatistics != null) {
      data['attendance_statistics'] = this.attendanceStatistics;
    }
    if (this.taskStatistics != null) {
      data['task_statistics'] = this.taskStatistics!.toJson();
    }
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? userId;
  String? name;
  String? email;
  String? sectionId;
  String? imageUrl;
  String? phone;
  String? points;

  UserData(
      {this.userId,
        this.name,
        this.email,
        this.sectionId,
        this.imageUrl,
        this.phone,
        this.points});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    sectionId = json['section_id'];
    imageUrl = json['image_url'];
    phone = json['phone'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['section_id'] = this.sectionId;
    data['image_url'] = this.imageUrl;
    data['phone'] = this.phone;
    data['points'] = this.points;
    return data;
  }
}

class TaskStatistics {
  int? totalTasks;
  int? completedTasks;
  int? completedOnTime;
  int? completedBeforeDeadline;
  int? completedAfterDeadline;
  int? totalTarget;
  int? achievedTarget;
  int? completionPercentage;
  int? weeklyTarget;
  int? monthlyTarget;
  int? yearlyTarget;
  int? achievedTodayTarget;
  int? achievedDailyTarget;
  var achievedRequestedDayTarget;

  TaskStatistics(
      {this.totalTasks,
        this.completedTasks,
        this.completedOnTime,
        this.completedBeforeDeadline,
        this.completedAfterDeadline,
        this.totalTarget,
        this.achievedTarget,
        this.completionPercentage,
        this.weeklyTarget,
        this.monthlyTarget,
        this.yearlyTarget,
        this.achievedTodayTarget,
        this.achievedDailyTarget,
        this.achievedRequestedDayTarget});

  TaskStatistics.fromJson(Map<String, dynamic> json) {
    totalTasks = json['total_tasks'];
    completedTasks = json['completed_tasks'];
    completedOnTime = json['completed_on_time'];
    completedBeforeDeadline = json['completed_before_deadline'];
    completedAfterDeadline = json['completed_after_deadline'];
    totalTarget = json['total_target'];
    achievedTarget = json['achieved_target'];
    completionPercentage = json['completion_percentage'];
    weeklyTarget = json['weekly_target'];
    monthlyTarget = json['monthly_target'];
    yearlyTarget = json['yearly_target'];
    achievedTodayTarget = json['achieved_today_target'];
    achievedDailyTarget = json['achieved_daily_target'];
    achievedRequestedDayTarget = json['achieved_requested_day_target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_tasks'] = this.totalTasks;
    data['completed_tasks'] = this.completedTasks;
    data['completed_on_time'] = this.completedOnTime;
    data['completed_before_deadline'] = this.completedBeforeDeadline;
    data['completed_after_deadline'] = this.completedAfterDeadline;
    data['total_target'] = this.totalTarget;
    data['achieved_target'] = this.achievedTarget;
    data['completion_percentage'] = this.completionPercentage;
    data['weekly_target'] = this.weeklyTarget;
    data['monthly_target'] = this.monthlyTarget;
    data['yearly_target'] = this.yearlyTarget;
    data['achieved_today_target'] = this.achievedTodayTarget;
    data['achieved_daily_target'] = this.achievedDailyTarget;
    data['achieved_requested_day_target'] = this.achievedRequestedDayTarget;
    return data;
  }
}

