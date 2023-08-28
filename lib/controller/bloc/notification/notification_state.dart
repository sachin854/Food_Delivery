abstract class NotificationState{}
class NotificationInitialState extends NotificationState{

}
class NotificationLoadingState extends NotificationState{
  List<dynamic> notificationdata;
  NotificationLoadingState(this.notificationdata);
}