class TaskDetailsModel {
  Statistics? statistics;
  List<SubTasks>? subTasks;
  List<Data>? data;

  TaskDetailsModel({this.statistics, this.subTasks, this.data});

  TaskDetailsModel.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    if (json['sub_tasks'] != null) {
      subTasks = <SubTasks>[];
      json['sub_tasks'].forEach((v) {
        subTasks!.add(new SubTasks.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    if (this.subTasks != null) {
      data['sub_tasks'] = this.subTasks!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statistics {
  int? totalSubTasksCount;
  int? completedSubTasksCount;
  int? completionPercentage;
  int? onTimeSubTasksCount;
  int? onTimeSubTasksPercentage;
  int? notOnTimeSubTasksCount;
  int? notOnTimeSubTasksPercentage;
  int? finishedBeforeDeadlineCount;
  int? finishedBeforeDeadlinePercentage;
  int? stillAnglingCount;
  int? stillAnglingPercentage;

  Statistics(
      {this.totalSubTasksCount,
        this.completedSubTasksCount,
        this.completionPercentage,
        this.onTimeSubTasksCount,
        this.onTimeSubTasksPercentage,
        this.notOnTimeSubTasksCount,
        this.notOnTimeSubTasksPercentage,
        this.finishedBeforeDeadlineCount,
        this.finishedBeforeDeadlinePercentage,
        this.stillAnglingCount,
        this.stillAnglingPercentage});

  Statistics.fromJson(Map<String, dynamic> json) {
    totalSubTasksCount = json['total_sub_tasks_count'];
    completedSubTasksCount = json['completed_sub_tasks_count'];
    completionPercentage = json['completion_percentage'];
    onTimeSubTasksCount = json['on_time_sub_tasks_count'];
    onTimeSubTasksPercentage = json['on_time_sub_tasks_percentage'];
    notOnTimeSubTasksCount = json['not_on_time_sub_tasks_count'];
    notOnTimeSubTasksPercentage = json['not_on_time_sub_tasks_percentage'];
    finishedBeforeDeadlineCount = json['finished_before_deadline_count'];
    finishedBeforeDeadlinePercentage =
    json['finished_before_deadline_percentage'];
    stillAnglingCount = json['still_angling_count'];
    stillAnglingPercentage = json['still_angling_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sub_tasks_count'] = this.totalSubTasksCount;
    data['completed_sub_tasks_count'] = this.completedSubTasksCount;
    data['completion_percentage'] = this.completionPercentage;
    data['on_time_sub_tasks_count'] = this.onTimeSubTasksCount;
    data['on_time_sub_tasks_percentage'] = this.onTimeSubTasksPercentage;
    data['not_on_time_sub_tasks_count'] = this.notOnTimeSubTasksCount;
    data['not_on_time_sub_tasks_percentage'] = this.notOnTimeSubTasksPercentage;
    data['finished_before_deadline_count'] = this.finishedBeforeDeadlineCount;
    data['finished_before_deadline_percentage'] =
        this.finishedBeforeDeadlinePercentage;
    data['still_angling_count'] = this.stillAnglingCount;
    data['still_angling_percentage'] = this.stillAnglingPercentage;
    return data;
  }
}

class SubTasks {
  String? subTaskId;
  String? taskId;
  String? name;
  String? time;
  String? finished;
  String? finishedDate;
  String? fileUpload;

  SubTasks(
      {this.subTaskId,
        this.taskId,
        this.name,
        this.time,
        this.finished,
        this.finishedDate,
        this.fileUpload});

  SubTasks.fromJson(Map<String, dynamic> json) {
    subTaskId = json['sub_task_id'];
    taskId = json['task_id'];
    name = json['name'];
    time = json['time'];
    finished = json['finished'];
    finishedDate = json['finishedDate'];
    fileUpload = json['file_upload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_task_id'] = this.subTaskId;
    data['task_id'] = this.taskId;
    data['name'] = this.name;
    data['time'] = this.time;
    data['finished'] = this.finished;
    data['finishedDate'] = this.finishedDate;
    data['file_upload'] = this.fileUpload;
    return data;
  }
}

class Data {
  String? userTaskId;
  String? taskId;
  String? userId;
  String? finishDate;
  String? finished;
  String? title;
  String? sectionId;
  String? fromTime;
  String? toTime;
  String? day;
  String? taskDescription;
  String? finishOnTimePerc;
  String? pastDeadline;
  String? stillAngling;
  String? target;
  String? uploadFile;

  Data(
      {this.userTaskId,
        this.taskId,
        this.userId,
        this.finishDate,
        this.finished,
        this.title,
        this.sectionId,
        this.fromTime,
        this.toTime,
        this.day,
        this.taskDescription,
        this.finishOnTimePerc,
        this.pastDeadline,
        this.stillAngling,
        this.target,
        this.uploadFile});

  Data.fromJson(Map<String, dynamic> json) {
    userTaskId = json['user_task_id'];
    taskId = json['task_id'];
    userId = json['user_id'];
    finishDate = json['finish_date'];
    finished = json['finished'];
    title = json['title'];
    sectionId = json['section_id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    day = json['day'];
    taskDescription = json['task_description'];
    finishOnTimePerc = json['finish_on_time_perc'];
    pastDeadline = json['past_deadline'];
    stillAngling = json['still_angling'];
    target = json['target'];
    uploadFile = json['upload_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_task_id'] = this.userTaskId;
    data['task_id'] = this.taskId;
    data['user_id'] = this.userId;
    data['finish_date'] = this.finishDate;
    data['finished'] = this.finished;
    data['title'] = this.title;
    data['section_id'] = this.sectionId;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['day'] = this.day;
    data['task_description'] = this.taskDescription;
    data['finish_on_time_perc'] = this.finishOnTimePerc;
    data['past_deadline'] = this.pastDeadline;
    data['still_angling'] = this.stillAngling;
    data['target'] = this.target;
    data['upload_file'] = this.uploadFile;
    return data;
  }
}
