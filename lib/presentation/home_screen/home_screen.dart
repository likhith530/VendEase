import 'package:flutter/material.dart';
import 'package:vendeaze/core/app_export.dart';
import 'package:vendeaze/presentation/carts_page/carts_page.dart';
import 'package:vendeaze/widgets/custom_bottom_bar.dart';
import '../products_page_screen/products_page_screen.dart';
//import 'package:location/location.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final PageController pageController = PageController(viewportFraction: 0.8);
 @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // This prevents the back button from doing anything
        // Return false to do nothing when back button is pressed
        return false;
      },
      child: SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildLocationRow(context),
              SizedBox(height: 14.v),
              _buildCategoriesRow(context),
              Text(
                "CATEGORIES",
                style: CustomTextStyles.headlineLargePrimaryContainer,
              ),
              SizedBox(height: 55.v),
              _buildFacts(context),
              SizedBox(height: 30.v), // Replace Spacer with a SizedBox
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: _buildBottomBar(context),
        ),
      ),
      ),
    );
  }

Widget _buildFacts(BuildContext context) {
    final List<String> foodFacts = [
      "Fact 1: Eating fruits and vegetables can reduce the risk of chronic diseases.",
      "Fact 2: Whole grains are a great source of fiber and nutrients.",
      "Fact 3: Drinking water before meals can help with weight loss."
    ];

    return Container(
      height: 200.v, // Adjust height as needed
      child: PageView.builder(
        controller: pageController,
        itemCount: foodFacts.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1.0;
              if (pageController.position.haveDimensions) {
                value = pageController.page! - index;
                value = (1 - (value.abs() * .2)).clamp(0.8, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeInOut.transform(value) * 200.v,
                  width: Curves.easeInOut.transform(value) * 250.h,
                  child: child,
                ),
              );
            },
            child: Card(
              elevation: 4.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: Container(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      foodFacts[index],
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Add more content or styling as needed
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }



  /// Section Widget
Widget _buildLocationRow(BuildContext context) {
    return SizedBox(
      height: 100.v,
      width: 389.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 7.h,
                vertical: 34.v,
              ),
              decoration: AppDecoration.fillPink.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMdiLocation,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(top: 6.v),
                  ),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.headlineSmall, // Adjusted this line
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVendeaselogoRemovebgPreview164x255,
            height: 80.v,
            width: 136.h,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
}


  /// Section Widget
Widget _buildCategoriesRow(BuildContext context) {
  // Updated list with category name and image path
  final List<Map<String, String>> categories = [
    {"name": "Snacks", "image": ImageConstant.imgCat1},
    {"name": "Chips", "image": ImageConstant.imgCat2},
    {"name": "Juices", "image": ImageConstant.imgCat3},
    // ... other categories
  ];

  return Container(
    height: 324.v, // Set a fixed height for the container
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 31.h : 55.h,
            right: index == categories.length - 1 ? 31.h : 0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPageScreen(
                    // Pass the selected category name to the ProductsPageScreen
                    categoryName: categories[index]["name"]!,
                  ),
                ),
              );
            },
            child: CustomImageView(
              imagePath: categories[index]["image"]!,
              height: 324.v,
              width: 280.h,
              radius: BorderRadius.circular(24.h),
            ),
          ),
        );
      },
    ),
  );
}


/// Section Widget
Widget _buildBottomBar(BuildContext context) {
  return CustomBottomBar(
    onChanged: (BottomBarEnum type) {
      // This callback can be used to update the state of HomeScreen if needed.
    },
  );
}


/// Handling page based on route
Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppRoutes.cartsPage:
      return CartsPage();
    default:
      return HomeScreen();
  }
}

// Future<String> getCurrentLocation() async {
//   Location location = new Location();

//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return "Location service disabled";
//     }
//   }

//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return "Location permission denied";
//     }
//   }

//   _locationData = await location.getLocation();
//   return "${_locationData.latitude}, ${_locationData.longitude}";
// }

}
