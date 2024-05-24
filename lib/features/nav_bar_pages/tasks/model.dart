class TasksModel {
  String? status;
  List<Task>? message;

  TasksModel({this.status, this.message});

  TasksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Task>[];
      json['message'].forEach((v) {
        message!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  String? taskId;
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
  List<SubTasks>? subTasks;
  SubTaskStatistics? subTaskStatistics;

  Task(
      {this.taskId,
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
        this.uploadFile,
        this.subTasks,
        this.subTaskStatistics});

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
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
    if (json['sub_tasks'] != null) {
      subTasks = <SubTasks>[];
      json['sub_tasks'].forEach((v) {
        subTasks!.add(new SubTasks.fromJson(v));
      });
    }
    subTaskStatistics = json['sub_task_statistics'] != null
        ? new SubTaskStatistics.fromJson(json['sub_task_statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
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
    if (this.subTasks != null) {
      data['sub_tasks'] = this.subTasks!.map((v) => v.toJson()).toList();
    }
    if (this.subTaskStatistics != null) {
      data['sub_task_statistics'] = this.subTaskStatistics!.toJson();
    }
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

class SubTaskStatistics {
  int? totalSubTasks;
  int? completedSubTasks;
  int? completedBeforeDeadline;
  int? completedOnTime;
  int? completedAfterDeadline;
  int? completionPercentage;
  int? beforeDeadlinePercentage;
  int? onTimePercentage;
  int? afterDeadlinePercentage;

  SubTaskStatistics(
      {this.totalSubTasks,
        this.completedSubTasks,
        this.completedBeforeDeadline,
        this.completedOnTime,
        this.completedAfterDeadline,
        this.completionPercentage,
        this.beforeDeadlinePercentage,
        this.onTimePercentage,
        this.afterDeadlinePercentage});

  SubTaskStatistics.fromJson(Map<String, dynamic> json) {
    totalSubTasks = json['total_sub_tasks'];
    completedSubTasks = json['completed_sub_tasks'];
    completedBeforeDeadline = json['completed_before_deadline'];
    completedOnTime = json['completed_on_time'];
    completedAfterDeadline = json['completed_after_deadline'];
    completionPercentage = json['completion_percentage'];
    beforeDeadlinePercentage = json['before_deadline_percentage'];
    onTimePercentage = json['on_time_percentage'];
    afterDeadlinePercentage = json['after_deadline_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sub_tasks'] = this.totalSubTasks;
    data['completed_sub_tasks'] = this.completedSubTasks;
    data['completed_before_deadline'] = this.completedBeforeDeadline;
    data['completed_on_time'] = this.completedOnTime;
    data['completed_after_deadline'] = this.completedAfterDeadline;
    data['completion_percentage'] = this.completionPercentage;
    data['before_deadline_percentage'] = this.beforeDeadlinePercentage;
    data['on_time_percentage'] = this.onTimePercentage;
    data['after_deadline_percentage'] = this.afterDeadlinePercentage;
    return data;
  }
}
