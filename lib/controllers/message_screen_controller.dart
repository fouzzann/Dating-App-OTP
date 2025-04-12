import 'dart:convert';
import 'package:get/get.dart';
import 'package:japx/japx.dart';
import 'package:lilac_infotech_task_otp/controllers/model/chat_screen_model.dart';
import 'package:lilac_infotech_task_otp/controllers/model/messge_screen_model.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final String baseUrl = 'https://test.myfliqapp.com/api/v1';
  final RxList<ChatUser> contacts = <ChatUser>[].obs;
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = false.obs;
  final RxString currentUserId = '55'.obs; // Assuming current user ID is 55

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
    // Adding mock contacts data for UI testing
    addMockContacts();
  }

  // Add mock contacts for testing UI
  void addMockContacts() {
    // This will be used if the API call fails or for testing
    List<Map<String, dynamic>> mockUsers = [
      {
        'id': '81',
        'attributes': {
          'name': 'Regina Bearden',
          'username': 'regina',
          'email': 'regina@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': true,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 28,
        },
      },
      {
        'id': '82',
        'attributes': {
          'name': 'Rhonda Rivera',
          'username': 'rhonda',
          'email': 'rhonda@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': false,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 32,
        },
      },
      {
        'id': '83',
        'attributes': {
          'name': 'Mary Gratton',
          'username': 'mary',
          'email': 'mary@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': true,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 25,
        },
      },
      {
        'id': '84',
        'attributes': {
          'name': 'Annie Medved',
          'username': 'annie',
          'email': 'annie@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': true,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 27,
        },
      },
      {
        'id': '85',
        'attributes': {
          'name': 'John Smith',
          'username': 'john',
          'email': 'john@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': false,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 31,
        },
      },
      {
        'id': '86',
        'attributes': {
          'name': 'Sarah Johnson',
          'username': 'sarah',
          'email': 'sarah@example.com',
          'profile_photo_url':
              'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
          'is_online': true,
          'last_active_at': '2023-01-01T00:00:00Z',
          'age': 29,
        },
      },
    ];

    // Add these mock users to contacts list if API fails
    if (contacts.isEmpty) {
      contacts.value =
          mockUsers.map((userData) => ChatUser.fromJson(userData)).toList();
    }
  }

  Future<void> fetchContacts() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/chat/chat-messages/queries/contact-users'),
        headers: {
          'Content-Type': 'application/vnd.api+json',
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE',
        },
      );

      if (response.statusCode == 200) {
        final rawJson = jsonDecode(response.body);
        // Using the Japx library to decode JSON:API response
        final parsedJson = Japx.decode(rawJson);

        // Convert list of maps to list of ChatUser objects
        final List<dynamic> usersData = parsedJson['data'];
        contacts.value =
            usersData.map((userData) => ChatUser.fromJson(userData)).toList();
      } else {
        // Get.snackbar('Successfully login','',borderColor: Colors.green);
        // We'll rely on mock data if API fails
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred: $e');
      // We'll rely on mock data if API fails
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMessages(String otherUserId) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/chat/chat-messages/queries/chat-between-users/${currentUserId.value}/$otherUserId',
        ),
        headers: {
          'Content-Type': 'application/vnd.api+json',
          'Accept': 'application/vnd.api+json',
          'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE',
        },
      );

      if (response.statusCode == 200) {
        final rawJson = jsonDecode(response.body);
        // Using the Japx library to decode JSON:API response
        final parsedJson = Japx.decode(rawJson);

        final List<dynamic> messagesData = parsedJson['data'];
        messages.value =
            messagesData
                .map((messageData) => ChatMessage.fromJson(messageData))
                .toList();
      } else {
        Get.snackbar('Error', 'Failed to load messages');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
