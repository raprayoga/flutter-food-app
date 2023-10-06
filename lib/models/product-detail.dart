class ProductDetail {
  const ProductDetail({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strIngredients,
    required this.strMeasures,
  });

  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String? strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final List<String> strIngredients;
  final List<String> strMeasures;
}
