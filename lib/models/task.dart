class Task {
  final String id;
  final int timestamp;
  final String name;
  final bool isDone;

  Task({
    this.id,
    this.timestamp,
    this.name,
    this.isDone = false,
  });

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      timestamp: json['timestamp'],
      name: json['name'],
      isDone: json['isDone'] ?? false,
    );
  }
}
