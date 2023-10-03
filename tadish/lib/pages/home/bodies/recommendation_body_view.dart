import 'package:flutter/material.dart';

class RecommendationBodyView extends StatelessWidget {
  const RecommendationBodyView({
    super.key,
  });

  final image = const AssetImage('assets/images/recommend/1.jpg');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200.0,
                child: Ink.image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              const ListTile(
                title: Text('FOOD'),
                subtitle: Text('issa okay'),
              ),
            ]
          )
        ),
      ),
    );
  }
}
