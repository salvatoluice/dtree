import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String name;
  final String storeType;
  final String imageUrl;
  final VoidCallback onPressed;

  const StoreCard({
    Key? key,
    required this.name,
    required this.storeType,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            : Container(
                width: 60,
                height: 60,
                color: Colors.grey[200],
                child: Icon(Icons.store, color: Colors.grey),
              ),
        title: Text(name),
        subtitle: Text(storeType),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: Text('View'),
        ),
      ),
    );
  }
}
