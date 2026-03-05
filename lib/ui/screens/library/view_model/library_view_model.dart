import 'package:flutter/widgets.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/model/songs/song.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  LibraryViewModel({
    required SongRepository song_repository,
    required PlayerState player_state,
  }) : _songRepository = song_repository,
       _playerState = player_state;
  List<Song> _songs = [];

  Future<void> init() async {
    _songs = await _songRepository.fetchSongs();

    _playerState.addListener(_onPlayerStateChanged);

    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  List<Song> get songs => _songs;

  Song? get currentSong => _playerState.currentSong;
}
