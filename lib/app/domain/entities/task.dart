class Task{
	int id;
	String task;
	String description;
	bool important;
	bool completed;

	Task({this.id, this.task, this.description, this.important = false, this.completed = false});
}
