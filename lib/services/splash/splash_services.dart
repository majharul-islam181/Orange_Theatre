import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();

  SessionController._internal();

  factory SessionController() { 
    return _session;
  }

  Future<void> markOnboardingCompleted() async {
    await localStorage.setValue('onboardingCompleted', 'true');
  }

  Future<bool> isOnboardingCompleted() async {
    var onboardingStatus = await localStorage.readValue('onboardingCompleted');
    return onboardingStatus == 'true';
  }
}
