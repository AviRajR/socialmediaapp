import 'package:flutter/material.dart';

class Post {
  String username;
  String profilePicture;
  String postContent;
  int likes;
  int comments;

  Post({
    required this.username,
    required this.profilePicture,
    required this.postContent,
    this.likes = 0,
    this.comments = 0,
  });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        // Remove the line below if you don't want to set an accent color directly
        // accentColor: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Post> posts = [
    Post(
      username: 'Aviraj_123',
      profilePicture: 'assets/images/abcd.jpg',
      postContent: 'This is the first post. #Flutter',
      likes: 10,
      comments: 5,
    ),
    Post(
      username: 'What_',
      profilePicture: 'assets/user2.jpg',
      postContent: 'Hello Flutter developers!',
      likes: 20,
      comments: 8,
    ),
    // Add more posts as needed
  ];
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Feed'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return buildPostCard(posts[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: _currentIndex == 0 ? Colors.white : Colors.grey),
              onPressed: () {
                _onTabTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: _currentIndex == 1 ? Colors.white : Colors.grey),
              onPressed: () {
                _onTabTapped(1);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary ?? Colors.pink,
        onPressed: () {
          // Implement action for creating a new post
          // This is just an example, you can replace it with your own logic
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Create a new post'),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildPostCard(Post post) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(post.profilePicture),
            ),
            title: Text(post.username),
          ),
          // Add Image widget to display the post image
          Image.asset(
            'assets/images/abcd.jpg', // Replace with the path to your post image
            fit: BoxFit.cover, // Adjust the BoxFit as needed
            width: double.infinity,
            height: 200.0, // Adjust the height as needed
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.postContent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                          // Update likes count accordingly
                          post.likes =
                              isLiked ? post.likes + 1 : post.likes - 1;
                        });
                      },
                    ),
                    Text(post.likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        // Navigate to comments screen or show comments
                      },
                    ),
                    Text(post.comments.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
