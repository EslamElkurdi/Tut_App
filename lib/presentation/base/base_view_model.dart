abstract class BaseViewModel extends BaseViewModelInputs implements BaseViewModelOutputs
{
  // shared variables
}

abstract class BaseViewModelInputs
{
  void start(); // start view model job


  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs {
  // will be implement later
}

