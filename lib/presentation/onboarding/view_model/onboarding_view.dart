import 'dart:async';

import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs{
  // stream controllers outputs
  StreamController streamController = StreamController<SliderViewObject>();

  // OnBoarding ViewModel Inputs
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

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream get outputSliderViewObject => throw UnimplementedError();

}



abstract class OnBoardingViewModelOutputs {
  // stream controller output
  Stream get outputSliderViewObject;
}

// "Orders"
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user clicks on left arrow or swipe right
  void onChanged(int index);

  // stream controller
  Sink get inputSliderViewObject;

}