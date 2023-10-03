import 'package:flutter/material.dart';
import '../../../components/item_card.dart';

class RecommendationBodyView extends StatefulWidget {
  @override
  _RecommendationBodyViewState createState() => _RecommendationBodyViewState();
}

class _RecommendationBodyViewState extends State<RecommendationBodyView> {
  List<Map<String, dynamic>> cards = [
    {
      'title': 'Tiramisu',
      'cost': '7.00',
      'image': AssetImage('assets/images/1.jpg'),
      'sweetness': 80.0,
      'sourness': 00.0,
      'spiciness': 00.0,
      'saltiness': 10.0,
      'people': '2',
    },
    {
      'title': 'Flan',
      'cost': '5.00',
      'image': AssetImage('assets/images/2.jpg'),
      'sweetness': 70.0,
      'sourness': 10.0,
      'spiciness': 00.0,
      'saltiness': 20.0,
      'people': '6',
    },
    {
      'title': 'Crème Brûlée',
      'cost': '8.50',
      'image': AssetImage('assets/images/3.jpg'),
      'sweetness': 80.0,
      'sourness': 00.0,
      'spiciness': 00.0,
      'saltiness': 20.0,
      'people': '5',
    },
    {
      'title': 'Panna Cotta',
      'cost': '12.00',
      'image': AssetImage('assets/images/4.jpg'),
      'sweetness': 60.0,
      'sourness': 00.0,
      'spiciness': 00.0,
      'saltiness': 20.0,
      'people': '1',
    },
    {
      'title': 'Yogurt Parfait',
      'cost': '4.50',
      'image': AssetImage('assets/images/5.jpg'),
      'sweetness': 80.0,
      'sourness': 00.0,
      'spiciness': 00.0,
      'saltiness': 20.0,
      'people': '100',
    },// Add more cards as needed
  ];

  void _swipeLeft() {
    setState(() {
      cards.removeAt(0);
    });
  }

  void _swipeRight() {
    setState(() {
      saved.add(cards[0]['title']);
      cards.removeAt(0);
    });
  }

  List<String> saved = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: cards.isEmpty
          ? Container(
            alignment: Alignment.center,
            child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No more cards to swipe!'),
                  Text('Saved: $saved'),
                ]
            )
          )
          : Stack(
        alignment: Alignment.center,
        children: cards.map((card) {
          final index = cards.indexOf(card);
          final isFrontCard = index == 0;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Draggable(
              onDragEnd: (details) {
                if (details.offset.dx < -100) {
                  // Swiped left
                  _swipeLeft();
                } else if (details.offset.dx > 100) {
                  // Swiped right
                  _swipeRight();
                }
              },
              feedback: Material(
                elevation: isFrontCard ? 8 : 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: isFrontCard
                      ? ItemCard(
                    title: card['title'],
                    cost: card['cost'],
                    image: card['image'],
                    sweetness: card['sweetness'],
                    sourness: card['sourness'],
                    spiciness: card['spiciness'],
                    saltiness: card['saltiness'],
                    people: card['people'],
                  )
                      : Container(
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
              childWhenDragging: Container(),
              child: isFrontCard
                  ? ItemCard(
                title: card['title'],
                cost: card['cost'],
                image: card['image'],
                sweetness: card['sweetness'],
                sourness: card['sourness'],
                spiciness: card['spiciness'],
                saltiness: card['saltiness'],
                people: card['people'],
              )
                  : Container(
                width: 100.0,
                height: 100.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
