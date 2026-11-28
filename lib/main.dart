
import 'package:flutter/material.dart';

void main() {
  runApp(const AdorApp());
}

const Color green = Color(0xFF00B85A);
const Color darkGreen = Color(0xFF008B45);
const Color paleGreen = Color(0xFFE9FFF2);

class AdorApp extends StatelessWidget {
  const AdorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ador',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FFFA),
        colorScheme: ColorScheme.fromSeed(seedColor: green),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 1;
  int selectedCategory = 0;
  int bottomIndex = 0;

  final categories = [
    'All',
    'South Asia',
    'Southeast Asia',
    'Latin America',
  ];

  final rooms = [
    {'name': 'Welcome Friends Room', 'host': 'Ador Official', 'people': '470', 'flag': '🇧🇩', 'color': 0xFF00A85A},
    {'name': 'Music & Friendship', 'host': 'Sabbir', 'people': '4410', 'flag': '🇧🇩', 'color': 0xFF1685B9},
    {'name': 'Happy Voice Room', 'host': 'Anik', 'people': '1260', 'flag': '🇧🇩', 'color': 0xFFDA8A20},
    {'name': 'Love & Friendship', 'host': 'Black Room', 'people': '850', 'flag': '🇧🇩', 'color': 0xFFD94D9C},
    {'name': 'Night Music Room', 'host': 'Ador User', 'people': '320', 'flag': '🇮🇳', 'color': 0xFF7551D8},
    {'name': 'Open Chat Room', 'host': 'Friends Club', 'people': '690', 'flag': '🇧🇩', 'color': 0xFF00A6A6},
  ];

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 12),
                children: [
                  _gameBanner(),
                  _smallBanners(),
                  _myRoom(),
                  _categories(),
                  _roomGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
      child: Row(
        children: [
          _topTab('Following', 0),
          const SizedBox(width: 18),
          _topTab('Party', 1),
          const SizedBox(width: 18),
          _topTab('Live', 2),
          const Spacer(),
          IconButton(
            onPressed: () => message('Search coming soon'),
            icon: const Icon(Icons.search, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _topTab(String text, int index) {
    final active = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: active ? FontWeight.bold : FontWeight.w500,
          color: active ? darkGreen : Colors.grey,
        ),
      ),
    );
  }

  Widget _gameBanner() {
    return Container(
      height: 145,
      margin: const EdgeInsets.fromLTRB(15, 12, 15, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF005C32), Color(0xFF00C878), Color(0xFFB4F5CE)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 15,
            top: 15,
            child: Icon(Icons.emoji_events,
                size: 95, color: Colors.amber.shade300),
          ),
          const Positioned(
            left: 20,
            top: 35,
            child: Text(
              'Game Star',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black45, blurRadius: 5)],
              ),
            ),
          ),
          const Positioned(
            left: 22,
            bottom: 20,
            child: Text(
              'PLAY • ENJOY • WIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallBanners() {
    final items = [
      ['VIP Room', Icons.workspace_premium, Color(0xFFFFB64D)],
      ['Love Room', Icons.favorite, Color(0xFFFF72BB)],
      ['Game Room', Icons.shield, Color(0xFF398BFF)],
    ];

    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: (MediaQuery.of(context).size.width - 48) / 3,
            margin: const EdgeInsets.only(right: 9),
            decoration: BoxDecoration(
              color: item[2] as Color,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item[1] as IconData,
                    size: 35, color: Colors.white),
                const SizedBox(height: 5),
                Text(
                  item[0] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _myRoom() {
    final people = [
      ['My Room', Icons.meeting_room],
      ['Sabbir', Icons.person],
      ['Anik', Icons.person],
      ['Black', Icons.person],
      ['Friends', Icons.person],
      ['More', Icons.add],
    ];

    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12, top: 14),
        itemCount: people.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => message('${people[index][0]} selected'),
            child: SizedBox(
              width: 83,
              child: Column(
                children: [
                  Container(
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? paleGreen : Colors.white,
                      border: Border.all(color: green, width: 2),
                    ),
                    child: Icon(
                      people[index][1] as IconData,
                      color: green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    people[index][0] as String,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Text('Hot',
                      style: TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemBuilder: (context, index) {
          final active = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: Container(
              margin: const EdgeInsets.only(right: 23),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 14,
                  color: active ? darkGreen : Colors.grey,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _roomGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      itemCount: rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final room = rooms[index];
        final color = Color(room['color'] as int);

        return GestureDetector(
          onTap: () => message('${room['name']} selected'),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: green.withOpacity(0.08),
                  blurRadius: 9,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(Icons.groups,
                              color: Colors.white, size: 65),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Text(
                            '${room['flag']} ${room['people']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 8, 7, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room['name'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.person,
                              size: 17, color: green),
                          Expanded(
                            child: Text(
                              room['host'] as String,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 11),
                            ),
                          ),
                          const Icon(Icons.graphic_eq,
                              size: 17, color: green),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomBar() {
    final icons = [
      Icons.home,
      Icons.videogame_asset_outlined,
      Icons.public,
      Icons.chat_bubble_outline,
      Icons.person_outline,
    ];
    final labels = ['Home', 'Game', 'Discover', 'Message', 'Profile'];

    return Container(
      height: 67,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0x14000000), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final active = bottomIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => bottomIndex = index);
              if (index != 0) message('${labels[index]} coming soon');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  size: 26,
                  color: active ? green : Colors.blueGrey.shade300,
                ),
                const SizedBox(height: 3),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 10,
                    color: active ? green : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
