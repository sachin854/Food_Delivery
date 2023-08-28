import 'package:finalapppp/controller/bloc/notification/notification_event.dart';
import 'package:finalapppp/controller/bloc/notification/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState()) {
    getData();
  }

  getData() async {
    List result = await RestApiClientService.shared.getNotificationData();
    emit(NotificationLoadingState(result));
  }
}
