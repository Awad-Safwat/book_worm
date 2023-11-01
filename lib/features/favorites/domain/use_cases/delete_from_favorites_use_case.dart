import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/favorites/domain/favorites_repos/favorites_repos.dart';
import 'package:dartz/dartz.dart';

class DeleteFromFavoritesUseCase extends UseCase<void, String> {
  final FavoritesRepos favoritesRepos;

  DeleteFromFavoritesUseCase({required this.favoritesRepos});

  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) {
    return favoritesRepos.deleteFromFavoritesBooks(bookId: bookId!);
  }
}
