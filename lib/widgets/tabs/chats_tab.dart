import 'package:dtree/main.dart';
import 'package:dtree/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String message;
  final String time;

  Chat({
    required this.name,
    required this.message,
    required this.time,
  });
}

class ChatsTab extends StatelessWidget {
final List<Chat> chats = [
    Chat(
      name: 'Safaricom',
      message: 'Enjoy 50% bonus airtime when you top up with Ksh 100 or more!',
      time: '9:00 AM',
    ),
    Chat(
      name: 'Naivas Supermarket',
      message: 'Get up to 30% off on selected household items this weekend!',
      time: '10:30 AM',
    ),
    Chat(
      name: 'KFC Kenya',
      message: 'Buy 1 Get 1 Free on all Krushers today!',
      time: '11:45 AM',
    ),
    Chat(
      name: 'Uber Kenya',
      message: 'Use code UBERDEALS to get 50% off on your next ride!',
      time: '1:00 PM',
    ),
    Chat(
      name: 'Java House',
      message:
          'Enjoy a free pastry with every coffee purchase between 3 PM - 5 PM!',
      time: '2:30 PM',
    ),
    Chat(
      name: 'Jumia Kenya',
      message: 'Flash sale alert! Get up to 70% off on electronics this hour!',
      time: '3:45 PM',
    ),
    Chat(
      name: 'Kenya Airways',
      message:
          'Book your flight today and enjoy discounted fares to select destinations!',
      time: '4:30 PM',
    ),
    Chat(
      name: 'Nakumatt',
      message:
          'Huge clearance sale! Grab amazing deals on groceries and electronics!',
      time: '5:15 PM',
    ),
    Chat(
      name: 'M-PESA',
      message: 'Send money to any network for FREE today!',
      time: '6:00 PM',
    ),
    Chat(
      name: 'DStv Kenya',
      message: 'Upgrade to Premium and get 2 months free subscription!',
      time: '7:30 PM',
    ),
    Chat(
      name: 'Equity Bank',
      message: 'Open a bank account today and get a free debit card!',
      time: '8:15 PM',
    ),
    Chat(
      name: 'Sarit Centre',
      message:
          'Weekend special: Enjoy up to 50% off on fashion and accessories!',
      time: '9:45 PM',
    ),
    Chat(
      name: 'Zuku',
      message: 'Upgrade your internet speed and get a free Wi-Fi router!',
      time: '10:30 PM',
    ),
    Chat(
      name: 'Tuskys',
      message:
          'Amazing discounts on fresh produce! Visit your nearest branch today!',
      time: '11:15 PM',
    ),
    Chat(
      name: 'GOtv Kenya',
      message: 'Subscribe to GOtv Max and get access to over 100 channels!',
      time: '12:00 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: secondaryColor, 
            child: Icon(Icons.person, color: primaryColor),
          ),
          title: Text(
            chat.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            chat.message,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300
            ),
          ),
          trailing: Text(
            chat.time,
            style: const TextStyle(
              fontSize: 11, 
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ChatScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },

        );
      },
    );
  }
}
