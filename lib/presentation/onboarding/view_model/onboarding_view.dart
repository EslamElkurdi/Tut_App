import 'dart:async';

import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';

import '../../resources/assets_image.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs{
  // stream controllers outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // OnBoarding ViewModel Inputs
  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int next = ++_currentIndex;
    if(next == _list.length)
    {
      next = 0;
    }
    return next;
  }

  @override
  int goPrevious() {
    int previous = --_currentIndex;
    if(previous == -1)
    {
      previous = _list.length - 1;
    }
    return previous;
  }

  @override
  void onChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onBoarding Private functions
  void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(
      _list[_currentIndex],
      _currentIndex,
      _list.length,
    ));
  }

  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingSubTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingSubTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingSubTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingSubTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4)
  ];
}

abstract class OnBoardingViewModelOutputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}

// "Orders"
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onChanged(int index);

  // stream controller
  Sink get inputSliderViewObject;

}