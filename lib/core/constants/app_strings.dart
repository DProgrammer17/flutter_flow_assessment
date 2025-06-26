abstract class AppStrings {
  static const appName = 'Flutter Flow Assessment';
  static const abhayaFontFamily = 'abhaya_libre';
  static const poppinsFontFamily = 'poppins';
  static const questrialFontFamily = 'questrial';
  static const balancedMeal = 'Balanced Meal';
  static const welcomePageText =
      'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.';
  static const orderFood = 'Order Food';
  static const enterYourDetails = 'Enter your details';
  static const gender = 'Gender';
  static const genderHint = 'Choose your gender';
  static const weight = 'Weight';
  static const weightHint = 'Enter your weight';
  static const height = 'Height';
  static const heightHint = 'Enter your height';
  static const age = 'Age';
  static const ageHint = 'Enter your age';
  static const nextText = 'Next';
  static const male = 'Male';
  static const female = 'Female';
  static const kg = 'Kg';
  static const cm = 'Cm';
  static const createYourOrder = 'Create your order';
  static const vegetables = 'Vegetables';
  static const bellPepper = 'Bell Pepper';
  static const carrot = 'Carrot';
  static const broccoli = 'Broccoli';
  static const spinach = 'Spinach';
  static const meats = 'Meats';
  static const leanBeef = 'Lean Beef';
  static const salmon = 'Salmon';
  static const turkey = 'Turkey';
  static const chickenBreast = 'Chicken Breast';
  static const carbs = 'Carbs';
  static const sweetCorn = 'Sweet Corn';
  static const brownRice = 'Brown Rice';
  static const oats = 'Oats';
  static const blackBeans = 'Black Beans';
  static String calAmount(int calories) => '${calories.toString()} Cal';
  static const productCost = '\$12';
  static String itemPrice(double price) => '\$${price.toStringAsFixed(0)}';
  static const add = 'Add';
  static const cal = 'Cal';
  static const price = 'Price';
  static const bmi = 'BMI:';
  static String calCount({required double calories, required double bmi}) =>
      '${calories.toStringAsFixed(0)} Cal out of ${bmi.toStringAsFixed(0)} Cal';
  static const placeOrder = 'Place order';
  static const confirm = 'Confirm';
  static const orderSummary = 'Order summary';
  static const productsRetrievedSuccessfully = 'Products retrieved successfully!';
  static const productsUploadedSuccessfully = 'Products uploaded successfully!';
}

abstract class ErrorStrings {
  static const actionNotPossible = 'Action not possible.';
  static const itemAddedToCart = 'Item has been added to cart';
  static const somethingWentWrong = 'Hey! Something went wrong. Try again.';
}
