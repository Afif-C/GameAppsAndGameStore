// services/skin_service.dart

import '../models/skin.dart';

class SkinService {
  List<Skin> fetchSkins() {
    return [
      Skin(name: "Juggernaut", type: "Skin", releaseDate: "2019", availability: "In Stock", price: "1200 V-Bucks", imagePath: "assets/images/juggernaut.png"),
      Skin(name: "Abaddon", type: "Skin", releaseDate: "2018", availability: "In Stock", price: "1500 V-Bucks", imagePath: "assets/images/abaddon.png"),
      Skin(name: "Invoker", type: "Skin", releaseDate: "2017", availability: "In Stock", price: "1500 V-Bucks", imagePath: "assets/images/invoker.png"),
      Skin(name: "Pudge", type: "Skin", releaseDate: "2017", availability: "In Stock", price: "1500 V-Bucks", imagePath: "assets/images/pudge.png"),
      Skin(name: "Riki", type: "Skin", releaseDate: "2017", availability: "In Stock", price: "1000 V-Bucks", imagePath: "assets/images/riki.png"),
      Skin(name: "Mirana", type: "Skin", releaseDate: "2017", availability: "In Stock", price: "1000 V-Bucks", imagePath: "assets/images/mirana.png"),
      // Add more skins here
    ];
  }
}
