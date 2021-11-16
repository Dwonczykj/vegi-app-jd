import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:redux/redux.dart';

class FeaturedPostStackViewModel extends Equatable {
  final List<BlogArticle> featuredArticles;

  FeaturedPostStackViewModel({required this.featuredArticles});

  static FeaturedPostStackViewModel fromStore(Store<AppState> store) {
    return FeaturedPostStackViewModel(
      featuredArticles: store.state.newsState.featuredPosts,
    );
  }

  @override
  List<Object> get props => [featuredArticles];
}
