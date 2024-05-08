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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            )
          else
            Container(
              width: 60,
              height: 60,
              color: Colors.grey[200],
              child: Icon(Icons.store, color: Colors.grey),
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  storeType,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('View'),
          ),
        ],
      ),
    );
  }
}