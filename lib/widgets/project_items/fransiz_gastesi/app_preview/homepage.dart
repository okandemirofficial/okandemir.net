import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/paddings.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/parallax_list_item.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/post_model.dart';
import 'package:portfolio_v2/widgets/project_items/fransiz_gastesi/app_preview/theme.dart';

const _sampleFrPosts = [
  FransizGastesiPostModel(
    date: '6.05.2023',
    author: 'Fransız Gastesi',
    title: 'Fransız Mutfağı',
    excerpt:
        'Fransızların dünyada övgüyle anıldıkları konuların başında mutfak kültürü gelir. Fransız mutfağı hangi yemekleri ile...',
    featuredMediaUrl: 'assets/images/fransiz_gastesi/sample3.jpg',
  ),
  FransizGastesiPostModel(
    date: '02.05.2023',
    author: 'Elif Türkmen',
    title: 'Mutluluk Üzerine Derkenar',
    excerpt:
        'Kuşkusuz her birimiz çok farklı ve eşsiz varlıklarız. Ancak bu dünyada bir şey var ki, hepimiz onun peşinde bir ömür...',
    featuredMediaUrl: 'assets/images/fransiz_gastesi/sample1.png',
  ),
  FransizGastesiPostModel(
    date: '16.02.2023',
    author: 'Fransız Gastesi',
    title: 'Fransa’nın En İyi Hukuk Fakülteleri',
    excerpt:
        'Fransa’nın en iyi hukuk fakülteleri listesi yayınlandı. işte Fransa’nın en iyi 35 hukuk fakültesi!',
    featuredMediaUrl: 'assets/images/fransiz_gastesi/sample2.jpg',
  ),
  FransizGastesiPostModel(
    date: '18.10.2022',
    author: 'Aydan Bayar',
    title: 'Carmen: “Skandal” Bir Operanın Başarı Öyküsü!',
    excerpt:
        'Tarihin en ünlü operalardan birisi olan Carmen’in çalkantılı tarihine kısa bir bakış atacağız.',
    featuredMediaUrl: 'assets/images/fransiz_gastesi/sample4.jpg',
  ),
  FransizGastesiPostModel(
    date: '24.09.2022',
    author: 'Beyza Özdemir',
    title: 'Fransızca Yılbaşı Şarkıları',
    excerpt:
        'Sıcak çikolatanızı yudumlarken, ağacınızı süslerken veya leziz yemekler hazırlarken dinleyebileceğiniz...',
    featuredMediaUrl: 'assets/images/fransiz_gastesi/sample5.png',
  ),
];

class FransizGastesiHomepage extends StatelessWidget {
  const FransizGastesiHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: Theme(
        data: fransizGastesiTheme,
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'images/fransiz_gastesi/logo.png',
              fit: BoxFit.fitHeight,
            ),
            actions: const [
              PaddingRight.s(
                child: Icon(Icons.menu),
              )
            ],
          ),
          body: Builder(builder: (newContext) {
            return ListView(
              children: [
                Card(child: Image.asset('images/fransiz_gastesi/filter.png')),
                FransizGastesiParallaxListItem(
                  _sampleFrPosts[0],
                ),
                FransizGastesiParallaxListItem(
                  _sampleFrPosts[1],
                ),
                FransizGastesiParallaxListItem(
                  _sampleFrPosts[2],
                ),
                FransizGastesiParallaxListItem(
                  _sampleFrPosts[3],
                ),
                FransizGastesiParallaxListItem(
                  _sampleFrPosts[4],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
