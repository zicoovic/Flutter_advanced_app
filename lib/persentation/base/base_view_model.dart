abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutptus {
  //shared variables and functions that will be used through any view model.

}

abstract class BaseViewModelInputs {
  void start();

  void dispose();
}

abstract class BaseViewModelOutptus {}
