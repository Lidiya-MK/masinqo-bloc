import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masinqo/application/artists/home_page/artist_home_bloc.dart';
import 'package:masinqo/application/artists/home_page/artist_home_state.dart';
import 'package:masinqo/infrastructure/core/url.dart';

class ArtistDrawer extends StatelessWidget {
  final String email;
  final String username;
  final String profilePicture;
  const ArtistDrawer(
      {super.key,
      required this.email,
      required this.username,
      required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: BlocBuilder<ArtistHomeBloc, ArtistHomeState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF39DCF3),
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage("${Domain.url}/{}"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        username,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Divider(color: Color.fromARGB(255, 156, 153, 153)),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile Management',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.pushNamed("artist_profile");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(color: Color.fromARGB(255, 241, 211, 211)),
              ),
              onTap: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
