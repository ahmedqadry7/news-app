import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.color,
      required this.image,
      required this.name});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "business",
          color: Color(0xFFCF7E48),
          image: "assets/images/bussines.png",
          name: "Business"),
      CategoryModel(
          id: "sports",
          color: Color(0xFFC91C22),
          image: "assets/images/sports.png",
          name: "Sports"),
      CategoryModel(
          id: "health",
          color: Color(0xFFEC1E78),
          image: "assets/images/health.png",
          name: "Health"),
      CategoryModel(
          id: "entertainment",
          color: Color(0xFF003E90),
          image: "assets/images/Politics.png",
          name: "Politics"),
      CategoryModel(
          id: "general",
          color: Color(0xFF4881CE),
          image: "assets/images/environment.png",
          name: "Environment"),
      CategoryModel(
          id: "science",
          color: Color(0xFFF1D252),
          image: "assets/images/science.png",
          name: "Science"),
    ];
  }
}
