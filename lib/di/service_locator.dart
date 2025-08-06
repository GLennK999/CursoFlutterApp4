import 'package:app4_receitas/data/repositories/recipe_repository.dart';
import 'package:app4_receitas/data/services/recipe_service.dart';
import 'package:app4_receitas/ui/recipes/recipes_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

// Inicializa todas as dependencias/serviços deixando-os prontos para uso
Future<void> setupDependencies() async {
    getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
    
    //Recipe Service
    getIt.registerLazySingleton<RecipeService>(() => RecipeService()); // registerLazySingleton Só inicializa em uma unica instância

    //Recipe Repository
    getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepository());

    //Recipes View Model
    getIt.registerLazySingleton<RecipesViewModel>(() => RecipesViewModel());
}