import 'package:app4_receitas/ui/base_screen.dart';
import 'package:app4_receitas/ui/favorites/favorites_view.dart';
import 'package:app4_receitas/ui/recipe_detail/recipe_detail_view.dart';
import 'package:app4_receitas/ui/recipes/recipes_view.dart';
import 'package:app4_receitas/ui/auth/auth_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/login',
      routes: [
        ShellRoute(
          builder: (context, state, child) => BaseScreen(child: child),
          routes: [
            GoRoute(path: '/login', builder: (context,state) => AuthView()),
            GoRoute(path: '/', builder: (context, state) => RecipesView()),
            GoRoute(path: '/recipe/:id', builder: (context, state) => RecipeDetailView(id: state.pathParameters['id']!)),
            GoRoute(path: '/favorites', builder: (context, state) => FavoritesView()),

          ],
        ),
      ],
    );
  }
}
