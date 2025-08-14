import 'package:app4_receitas/data/models/recipe.dart';
import 'package:app4_receitas/data/repositories/recipe_repository.dart';
import 'package:app4_receitas/di/service_locator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoritesViewModel extends GetxController {
  final _repository = getIt<RecipeRepository>();

  final RxList<Recipe> _favoriteRecipes = <Recipe>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  List<Recipe> get favoriteRecipes => _favoriteRecipes;
  bool get isLoading => _isLoading.value;
  String? get errorMessage => _errorMessage.value;

  //user = getIt<AuthService>().currentUser;

  Future<void> getFavoriteRecipes() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      // TODO: Puxar do BD quando tiver logado o user id pra não precisar ficar colocando hard code e ele aceitar outros usuários
      //final userId = '790e503c-30de-438c-9998-d7183cea4532';
      final userId = '833041f1-121e-4398-a043-2a04aaf277d5'; //currentUser.id
      _favoriteRecipes.value = await _repository.getFavoriteRecipes(userId);
    } catch (e) {
      _errorMessage.value = 'Falha ao buscar receitas: ${e.toString()}';
    } finally {
      _isLoading.value = false;
    }
  }
}