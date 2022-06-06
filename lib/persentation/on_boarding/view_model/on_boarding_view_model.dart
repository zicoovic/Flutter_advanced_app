import 'dart:async';
import 'package:flutter_advanced_app/domain/models.dart';
import 'package:flutter_advanced_app/persentation/base/base_view_model.dart';
import 'package:flutter_advanced_app/persentation/resources/assets_manager.dart';
import 'package:flutter_advanced_app/persentation/resources/strings_manager.dart';

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

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
          sliderObject: _list[_currentIndex],
          numOfSlides: _list.length,
          currentIndex: _currentIndex),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          image: ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          image: ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          image: ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          image: ImageAssets.onboardingLogo4,
        ),
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
