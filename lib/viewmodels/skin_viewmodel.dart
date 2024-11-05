// viewmodels/skin_viewmodel.dart

import '../models/skin.dart';
import '../services/skin_service.dart';

class SkinViewModel {
  final SkinService _skinService = SkinService();
  List<Skin> skins = [];

  SkinViewModel() {
    skins = _skinService.fetchSkins();
  }
}
