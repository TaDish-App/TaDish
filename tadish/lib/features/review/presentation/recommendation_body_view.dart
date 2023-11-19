import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/dish_card.dart';
import '../domain/dish.dart';


class RecommendationBodyView extends ConsumerWidget {
  const RecommendationBodyView({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Text("It broken"));
  }
}
// final dishesProvider = StateProvider<List<Dish>>((ref) {
//     final dishDB = ref.watch(dishDBProvider);
//     List<Dish> dishList = dishDB.getDishRestaurant();
//     return dishList;
// });
//
// final dishesSavedProvider = StateProvider<List>((ref) {
//   return [];
// });
//
// class RecommendationBodyView extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final saved = ref.watch(dishesSavedProvider);
//     final dishes = ref.watch(dishesProvider);
//
//     void swipeLeft() {
//       ref.read(dishesProvider.notifier).state = dishes.sublist(1);
//     }
//
//     void swipeRight() {
//       // saved.add(dishes[0].name);
//       ref.read(dishesSavedProvider.notifier).state = [...saved, dishes[0].name];
//       ref.read(dishesProvider.notifier).state = dishes.sublist(1);
//       // You can also save the dish to your 'saved' list if needed.
//     }
//
//     return Center(
//       child: dishes.isEmpty
//           ? Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('No more cards to swipe!'),
//             Text('Saved: $saved'),
//             // Display your saved dishes here.
//           ],
//         ),
//       )
//           : Stack(
//         alignment: Alignment.center,
//         children: dishes.asMap().entries.map((entry) {
//           final index = entry.key;
//           final dish = entry.value;
//           final isFrontCard = index == 0;
//
//           return SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Draggable(
//               onDragEnd: (details) {
//                 if (details.offset.dx < -100) {
//                   // Swiped left
//                   swipeLeft();
//                 } else if (details.offset.dx > 100) {
//                   // Swiped right
//                   swipeRight();
//                 }
//               },
//               feedback: Material(
//                 elevation: isFrontCard ? 8 : 0,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: isFrontCard
//                       ? DishCard(
//                     name: dish.name,
//                     picture: AssetImage(dish.pictures[0]),
//                     sweetness: dish.averageSweetness,
//                     sourness: dish.averageSourness,
//                     saltiness: dish.averageSaltiness,
//                     spiciness: dish.averageSpiciness,
//                     numRaters: dish.numRaters,
//                   )
//                       : Container(
//                     width: 100.0,
//                     height: 100.0,
//                   ),
//                 ),
//               ),
//               childWhenDragging: Container(),
//               child: isFrontCard
//                   ? DishCard(
//                 name: dish.name,
//                 picture: AssetImage(dish.pictures[0]),
//                 sweetness: dish.averageSweetness,
//                 sourness: dish.averageSourness,
//                 saltiness: dish.averageSaltiness,
//                 spiciness: dish.averageSpiciness,
//                 numRaters: dish.numRaters,
//               )
//                   : Container(
//                 width: 100.0,
//                 height: 100.0,
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
