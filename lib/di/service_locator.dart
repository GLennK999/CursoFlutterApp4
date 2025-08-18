import 'package:app4_receitas/data/repositories/profile_auth_repository.dart';
import 'package:app4_receitas/data/repositories/recipe_repository.dart';
import 'package:app4_receitas/data/services/auth_service.dart';
import 'package:app4_receitas/data/services/recipe_service.dart';
import 'package:app4_receitas/ui/auth/auth_view_model.dart';
import 'package:app4_receitas/ui/favorites/favorites_view_model.dart';
import 'package:app4_receitas/ui/profile/profile_view_model.dart';
import 'package:app4_receitas/ui/recipe_detail/recipe_detail_view_model.dart';
import 'package:app4_receitas/ui/recipes/recipes_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

// Inicializa todas as dependencias/serviços deixando-os prontos para uso
Future<void> setupDependencies() async {
    //Supabase
    getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
    
    //Service
    getIt.registerLazySingleton<RecipeService>(() => RecipeService()); // registerLazySingleton Só inicializa em uma unica instância
    getIt.registerLazySingleton<AuthService>(() => AuthService()); // registerLazySingleton Só inicializa em uma unica instância

    //Repository
    getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepository());
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

    //View Model
    getIt.registerLazySingleton<RecipesViewModel>(() => RecipesViewModel());
    getIt.registerLazySingleton<RecipeDetailViewModel>(() => RecipeDetailViewModel());
    getIt.registerLazySingleton<FavoritesViewModel>(() => FavoritesViewModel());
    getIt.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
    getIt.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());

}