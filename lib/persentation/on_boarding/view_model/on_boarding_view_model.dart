import 'dart:async';
import 'package:easy_localization/easy_localization.dart';

import '/domain/model/models.dart';
import '/persentation/base/base_view_model.dart';
import '/persentation/resources/assets_manager.dart';
import '/persentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  //stream controllers outputs

  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //onBoarding viewModels Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //onBoarding viewModels Outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //onboarding private function

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingSubTitle1.tr(), ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingSubTitle2.tr(), ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3.tr(),
            AppStrings.onBoardingSubTitle3.tr(), ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4.tr(),
            AppStrings.onBoardingSubTitle4.tr(), ImageAssets.onboardingLogo4),
      ];
}

// inputs mean that "orders" that our view model will recive from view.

abstract class OnBoardingViewModelInput {
  int goNext(); // when user click on right arrow or swip left
  int goPrevious(); // when user click on left arrow or swip right
  void onPageChanged(int index);
  //stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  //stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
