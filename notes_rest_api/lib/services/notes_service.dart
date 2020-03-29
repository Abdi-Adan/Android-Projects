import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes_rest_api/models/api_response.dart';
import 'package:notes_rest_api/models/note_for_listing.dart';

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': 'd21226b7-36ba-480c-87b2-937ddd8e791a'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }
}
