import 'package:tut_app/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs{
  // stream controllers outputs

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onChanged(int index) {
    // TODO: implement onChanged
  }

}



abstract class OnBoardingViewModelOutputs {}

// "Orders"
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user clicks on left arrow or swipe right
  void onChanged(int index);
}