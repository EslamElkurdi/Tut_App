import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/onboarding/view_model/onboarding_view.dart';
import 'package:tut_app/presentation/resources/assets_image.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constants_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind(){
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _onBoardingViewModel.outputSliderViewObject,
        builder: (context, snapshot){
          return _getContentWidgets(snapshot.data);
        }
    );
  }

  Widget _getContentWidgets(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      print("NULLLLLLLLLLLLLL");
      return Container();
    }else{

      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides, // fix num problem
            onPageChanged: (index) {
              _onBoardingViewModel.onChanged(index);
            },
            itemBuilder: (context,index){
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){},
                  child:  Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Container(
                  color: ColorManager.primary,
                  child: _getBottomSheetWidget(sliderViewObject))

              // indicator
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: ()
            {
              _pageController.animateToPage(
                  _onBoardingViewModel.goPrevious(),
                  duration: const Duration(microseconds: AppConstants.duration),
                  curve: Curves.bounceInOut
              );
            },
            child: SizedBox(
              // width: AppPadding.p20,
              // height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
          ),
        ),

        // middle indicator
        Row(
          children: [
            for(int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i, sliderViewObject.currentIndex),

              )
          ],
        ),

        // right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              width: AppPadding.p20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),

            onTap: ()
            {
              _pageController.animateToPage(
                  _onBoardingViewModel.goNext(),
                  duration: const Duration(microseconds: AppConstants.duration),
                  curve: Curves.bounceInOut
              );
            },
          ),
        )
      ],
    );
  }
  _getProperCircle(int index, int currentIndex)
   {
    if(index == currentIndex)
    {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    }else{
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
