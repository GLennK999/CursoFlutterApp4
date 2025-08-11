import 'package:app4_receitas/data/models/recipe.dart';
import 'package:app4_receitas/data/services/recipe_service.dart';
import 'package:app4_receitas/di/service_locator.dart';

class RecipeRepository {
  final _service = getIt<RecipeService>();

  Future<List<Recipe>> getRecipes() async {
    try {
      final rawData = await _service
          .fetchRecipes(); //Pega os dados no formato Lista Map de String Dynamics
      return rawData
          .map((data) => Recipe.fromJson(data))
          .toList(); //Transformando numa lista de Recipes pegando cada um dos dados
    } catch (e) {
      throw Exception('FALHA AO CARREGAR RECEITAS: ${e.toString()}');
    }
  }

  Future<Recipe?> getRecipeById(String id) async {
    final rawData = await _service.fetchRecipeById(id);
    return rawData != null ? Recipe.fromJson(rawData) : null;
  }

  Future<List<Recipe>> getFavoriteRecipes(String userId) async {
    final rawData = await _service.fetchFavoriteRecipes(userId);
    return rawData
        .where((data) => data['recipes'] != null)
        .map((data) => Recipe.fromJson(data['recipes'] as Map<String, dynamic>))
        .toList();
  }
}
