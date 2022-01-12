import 'package:vegan_liverpool/models/restaurant/restaurantCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/userCart.dart';
import 'package:vegan_liverpool/redux/actions/demoData.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateRestaurantCategories {
  final List<RestaurantCategory> listOfRestaurantCategories;
  UpdateRestaurantCategories({required this.listOfRestaurantCategories});
}

class UpdateFeaturedRestaurants {
  final List<RestaurantItem> listOfFeaturedRestaurants;
  UpdateFeaturedRestaurants({required this.listOfFeaturedRestaurants});
}

class UpdateUserCart {
  final UserCart currentUserCart;
  UpdateUserCart({required this.currentUserCart});
}

ThunkAction fetchRestaurantCategories() {
  return (Store store) async {
    try {
      List<RestaurantCategory> listOfRestaurantCategories = [
        restaurantCategory2,
        restaurantCategory1,
      ];

      store.dispatch(UpdateRestaurantCategories(
          listOfRestaurantCategories: listOfRestaurantCategories));
    } catch (e, s) {
      log.error('ERROR - fetchRestaurantCategories $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchRestaurantCategories $e',
      );
    }
  };
}

ThunkAction fetchFeaturedRestaurants() {
  return (Store store) async {
    try {
      List<RestaurantItem> restaurants =
          await vegiEatsService.featuredRestaurants();

      store.dispatch(
          UpdateFeaturedRestaurants(listOfFeaturedRestaurants: restaurants));
      store.dispatch(fetchMenuItemsForRestaurant());
    } catch (e, s) {
      log.error('ERROR - fetchFeaturedRestaurants $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchFeaturedRestaurants $e',
      );
    }
  };
}

ThunkAction fetchMenuItemsForRestaurant() {
  return (Store store) async {
    try {
      List<RestaurantItem> currentList =
          store.state.homePageState.featuredRestaurants;

      await Future.forEach(
        currentList,
        (RestaurantItem element) async {
          element.listOfMenuItems.addAll(
            await vegiEatsService.getRestaurantMenuItems(element.restaurantID),
          );
        },
      );

      //UpdateFeaturedRestaurants(listOfFeaturedRestaurants: currentList);
    } catch (e, s) {
      log.error('ERROR - fetchMenuItemsForRestaurant $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchMenuItemsForRestaurant $e',
      );
    }
  };
}

// ThunkAction fetchFeaturedVideos() {
//   return (Store store) async {
//     try {
//       List<VideoArticle> videoArticles = await newsService.featuredVideos();
//       store.dispatch(UpdateFeaturedVideos(featuredVideos: videoArticles));
//     } catch (e, s) {
//       log.error('ERROR - fetchFeaturedVideos $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchFeaturedVideos $e',
//       );
//     }
//   };
// }

// ThunkAction fetchEventsList() {
//   return (Store store) async {
//     try {
//       List<Events> eventsList = await newsService.eventsList();
//       store.dispatch(UpdateEventsList(eventsList: eventsList));
//     } catch (e, s) {
//       log.error('ERROR - fetchEventsList $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchEventsList $e',
//       );
//     }
//   };
// }

// ThunkAction fetchDirectoryList() {
//   return (Store store) async {
//     try {
//       List<Directory> directoryList = await newsService.directoryList();
//       store.dispatch(UpdateDirectoryList(directoryList: directoryList));
//     } catch (e, s) {
//       log.error('ERROR - fetchDirectoryList $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - fetchDirectoryList $e',
//       );
//     }
//   };
// }

ThunkAction fetchHomePageData() {
  return (Store store) async {
    try {
      store.dispatch(fetchRestaurantCategories());
      store.dispatch(fetchFeaturedRestaurants());
    } catch (e, s) {
      log.error('ERROR - fetchHomePageData $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchHomePageData $e',
      );
    }
  };
}
