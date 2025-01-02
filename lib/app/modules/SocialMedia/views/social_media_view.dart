import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/social_media_controller.dart';

class SocialMediaView extends GetView<SocialMediaController> {
  const SocialMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (controller.allData.value.posts == null ||
              controller.allData.value.posts!.isEmpty) {
            return const Center(
              child: Text(
                'No posts found.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.allData.value.posts!.length,
            itemBuilder: (context, index) {
              final post = controller.allData.value.posts![index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Post Title
                      Text(
                        post.title ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Post Body
                      Text(
                        post.body ?? 'No content',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tags
                      if (post.tags != null && post.tags!.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          children: post.tags!
                              .map(
                                (tag) => Chip(
                                  label: Text(
                                    tag,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  backgroundColor: Colors.blue.shade50,
                                ),
                              )
                              .toList(),
                        ),
                      const SizedBox(height: 16),

                      // Reactions and Views
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Likes and Dislikes
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.green.shade600,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${post.reactions?.likes ?? 0}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.thumb_down,
                                color: Colors.red.shade600,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${post.reactions?.dislikes ?? 0}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),

                          // Views
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey.shade600,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${post.views ?? 0} views',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
