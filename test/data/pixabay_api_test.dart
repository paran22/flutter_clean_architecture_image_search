import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('Pixabay 데이터를 잘 가져와야 한다', () async {
    final client = MockClient();
    final api = PhotoApiRepositoryImpl(api: PixabayApi(client: client));

    when(client.get(Uri.parse(
        '${PixabayApi.baseUrl}?key=${PixabayApi
            .key}&q=iphone&image_type=photo')))
        .thenAnswer((_) async => http.Response(fakeJsonBody, 200));

    final result = await api.fetch('iphone');

    expect((result as Success<List<Photo>>).data.first.id, 2681039);

    verify(client.get(Uri.parse(
        '${PixabayApi.baseUrl}?key=${PixabayApi
            .key}&q=iphone&image_type=photo')));
  });
}

String fakeJsonBody = """
{
    "total": 8677,
    "totalHits": 500,
    "hits": [
        {
            "id": 2681039,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/",
            "type": "photo",
            "tags": "phone wallpaper, watercolor, painting",
            "previewURL": "https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg",
            "previewWidth": 99,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g2018459d64d9fdd279a3a929cb745bc9c94813f67f3b710d5526c8f1f6358c6d53a13bd86a2939f60eedf5bee12c49171bf284713f3e7c42ad58d60be0d389b1_640.jpg",
            "webformatWidth": 424,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/ga9a9c56481f9d09ab0d3c552f47b158fb1948ac0c579960851f90c7618e0cdb983905a32c1c258860577b24ee04b7901ad6f0b8ab6e7d4306d658eca245f5a29_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4928,
            "imageSize": 5021313,
            "views": 1022033,
            "downloads": 781970,
            "collections": 1873,
            "likes": 1189,
            "comments": 126,
            "user_id": 4894494,
            "user": "eluela31",
            "userImageURL": "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
        },
        {
            "id": 1599527,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/",
            "type": "photo",
            "tags": "phone wallpaper, mystery, island",
            "previewURL": "https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg",
            "previewWidth": 116,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gfcced26fc033b0e890a522c4dea9d4835fe6f9c78864e2ae629ac128e3ea8a391886ea16a4d2d2de9cd22f460af2cda41268c3d880d182024b17f0fe5117123b_640.jpg",
            "webformatWidth": 495,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g10f69b4fcaf99f63ba7d97ab7af88db7875bed9c0db60de53ec6be643b273b58fe9f88f90f8606c5e6380454cdf2a1e0f38dd87a7225e11107e5cbcfa6396059_1280.jpg",
            "imageWidth": 3022,
            "imageHeight": 3907,
            "imageSize": 3563541,
            "views": 660211,
            "downloads": 337504,
            "collections": 1364,
            "likes": 1323,
            "comments": 159,
            "user_id": 2633886,
            "user": "intographics",
            "userImageURL": "https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"
        },
        {
            "id": 620817,
            "pageURL": "https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/",
            "type": "photo",
            "tags": "office, notes, notepad",
            "previewURL": "https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g0349fee49a5b65c4ba11d02549faea61993a44731f2fd7f81eea41e24ca3f6f2eff8fd67813529aa57eb5f8cc591f0f0_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 425,
            "largeImageURL": "https://pixabay.com/get/ged849e272af3abbbdace314418b3358b580b48da01c15121d0b1bd85b2807036478d2424478834cc2de2680136aa601b134f6acd7d07250ae312bfcd5f93ae9a_1280.jpg",
            "imageWidth": 4288,
            "imageHeight": 2848,
            "imageSize": 2800224,
            "views": 726509,
            "downloads": 317253,
            "collections": 1326,
            "likes": 1118,
            "comments": 261,
            "user_id": 663163,
            "user": "Firmbee",
            "userImageURL": "https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
        },
        {
            "id": 1914130,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-spices-spoons-salt-1914130/",
            "type": "photo",
            "tags": "phone wallpaper, spices, spoons",
            "previewURL": "https://cdn.pixabay.com/photo/2016/12/17/18/51/spices-1914130_150.jpg",
            "previewWidth": 133,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gf2a5b0c1969ead833eec40d3b26be946282e7a2d0f548d777acdcd8b36b69367a17b854818e1110197f71e5f43c5364bd02ea20b51de90863212e88b2fc49027_640.jpg",
            "webformatWidth": 571,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gdadbcc8055142407722e31dc4401cc8b7e0a91bc54109c6821b409535993eee954f96b3d962920c23240eca930e13719e14fce420202e2068670bd09bf119a8e_1280.jpg",
            "imageWidth": 3581,
            "imageHeight": 4013,
            "imageSize": 6193655,
            "views": 406838,
            "downloads": 264473,
            "collections": 1154,
            "likes": 1212,
            "comments": 159,
            "user_id": 3938704,
            "user": "Daria-Yakovleva",
            "userImageURL": "https://cdn.pixabay.com/user/2016/12/06/15-05-11-524_250x250.jpg"
        },
        {
            "id": 1979674,
            "pageURL": "https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/",
            "type": "photo",
            "tags": "relaxing, lounging, saturday",
            "previewURL": "https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg",
            "previewWidth": 150,
            "previewHeight": 102,
            "webformatURL": "https://pixabay.com/get/gf9ac6e1bf6931eebe6967cef13208513e676f72ee8d5c753cfc5070ba188004d37caf09152291cd88b4d8059a7e43e876d8f5d319db0d50533d5ec57638a2916_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 438,
            "largeImageURL": "https://pixabay.com/get/ga6112de7c450be2c367b1b3bed0ace261807e7bc01985215ff7242311cd2da7609e1081351bf2b267e4462262051522170ffe0e6e77ef363befc120757ac496c_1280.jpg",
            "imageWidth": 5310,
            "imageHeight": 3637,
            "imageSize": 3751070,
            "views": 403167,
            "downloads": 228597,
            "collections": 1023,
            "likes": 1152,
            "comments": 145,
            "user_id": 334088,
            "user": "JillWellington",
            "userImageURL": "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
        },
        {
            "id": 410324,
            "pageURL": "https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
            "type": "photo",
            "tags": "iphone, smartphone, apps",
            "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g0bd07e5c42a713e393823931bb60309af62814781aec9080c4e6765083d3f7e9afdf2d37e18a2c487ede7e6d0fc674b7_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g7d6f6951707189cb91df159b482c5c4ad80509ee9045025dfd7a23cbe2a806c52dd3dddfe1915d9bc52c903558c91abfbcb8592f830d7e9e5e0f2e1abb29d772_1280.jpg",
            "imageWidth": 2180,
            "imageHeight": 1453,
            "imageSize": 477025,
            "views": 730415,
            "downloads": 425592,
            "collections": 888,
            "likes": 789,
            "comments": 211,
            "user_id": 264599,
            "user": "JESHOOTS-com",
            "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id": 2846221,
            "pageURL": "https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/",
            "type": "photo",
            "tags": "business, computer, mobile",
            "previewURL": "https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g6038add37f05d4b0dd4e8a7d851a6726d4d30fc88fa319673f36dbf064b97a684f289250de8fa17e1511ff42538487341ccb1df144e25af75279f22a5dc203d4_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/gdb0919080b85e8f8166a8e6fbfb3cc7b6fa5d2f0be6bbc68b1c460af217051cfddf2a5cae04586168a61466b36f30de975a9481c4740943abcc0bc48511a49e3_1280.jpg",
            "imageWidth": 4608,
            "imageHeight": 3072,
            "imageSize": 2543501,
            "views": 393770,
            "downloads": 281214,
            "collections": 1041,
            "likes": 622,
            "comments": 98,
            "user_id": 6689062,
            "user": "6689062",
            "userImageURL": ""
        },
        {
            "id": 459196,
            "pageURL": "https://pixabay.com/photos/macbook-laptop-google-display-459196/",
            "type": "photo",
            "tags": "macbook, laptop, google",
            "previewURL": "https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg",
            "previewWidth": 150,
            "previewHeight": 92,
            "webformatURL": "https://pixabay.com/get/g89c215bf20952ed5bd969f548bfce02ceec901f9358581dbb0d60c5790e7db7a3eba176901022a30abce26b0ff8d108e_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 396,
            "largeImageURL": "https://pixabay.com/get/gc5a33f4eb28788365fb1333df97861cdc7200b45276fb73dc016be62b1b252c2c66f2c5cb1325e805e578d2f85faf31784f70170b09b5478740a8be73050fed1_1280.jpg",
            "imageWidth": 3888,
            "imageHeight": 2406,
            "imageSize": 2883743,
            "views": 561621,
            "downloads": 283826,
            "collections": 794,
            "likes": 754,
            "comments": 213,
            "user_id": 377053,
            "user": "377053",
            "userImageURL": ""
        },
        {
            "id": 1213475,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-heart-clouds-sky-1213475/",
            "type": "photo",
            "tags": "phone wallpaper, heart, clouds",
            "previewURL": "https://cdn.pixabay.com/photo/2016/02/21/12/09/heart-1213475_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g3b0934fc777f4ca703c579d8c37366aecbfd79ca181a93c7a0e844b2608604b99b3a116753b738d14e5290197b79d74682b4b5de551893a18f986a45370f94ff_640.jpg",
            "webformatWidth": 427,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g777c23ab8f5ef9883a63bd56046fbfd643c0df8561554c907c59c0e91ade14b605eac99ba76b29f57567d167e2c4e0f8a0c916217ac98e98f5cea691bba79f56_1280.jpg",
            "imageWidth": 1667,
            "imageHeight": 2500,
            "imageSize": 656080,
            "views": 603628,
            "downloads": 430665,
            "collections": 780,
            "likes": 796,
            "comments": 107,
            "user_id": 848168,
            "user": "oo11o",
            "userImageURL": ""
        },
        {
            "id": 586268,
            "pageURL": "https://pixabay.com/photos/telephone-mobile-call-samsung-586268/",
            "type": "photo",
            "tags": "telephone, mobile, call",
            "previewURL": "https://cdn.pixabay.com/photo/2015/01/02/00/01/telephone-586268_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g1755228d6118619fa6b314b5c7da669230093487e092ef39c727b348f88a5e60a214089ea2f93e90cf99667e64a03416_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g9244f140f558de89238c67b497cc4b6a4c7a32f7d117a3cb3daebaf7c69db33a9d1a13cc40f9cd9af5ea8ba4dd405539c3688d3f59e0c8942564ac9f0414b203_1280.jpg",
            "imageWidth": 3711,
            "imageHeight": 2474,
            "imageSize": 1772256,
            "views": 172300,
            "downloads": 100743,
            "collections": 1349,
            "likes": 202,
            "comments": 57,
            "user_id": 80788,
            "user": "niekverlaan",
            "userImageURL": "https://cdn.pixabay.com/user/2014/05/19/00-26-35-848_250x250.jpg"
        },
        {
            "id": 3746423,
            "pageURL": "https://pixabay.com/photos/ruin-castle-middle-ages-dramatic-3746423/",
            "type": "photo",
            "tags": "ruin, castle, middle ages",
            "previewURL": "https://cdn.pixabay.com/photo/2018/10/14/13/01/ruin-3746423_150.jpg",
            "previewWidth": 106,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g11a3a866ac736511616a7b209017b0843471844380989b88041301fd683fe2c370e43c10602572296581f7c4e8e17f30e2b5a6bde3ce5d12dcd6d251cbc820b6_640.jpg",
            "webformatWidth": 452,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gf2783a2f238feb2f16d7caa9d4beb684667b54df58125606cc9042f37a06a4716f56beef047da06d93b4e5d72cb16877a9d35e9992099166392b2c00fd2594b3_1280.jpg",
            "imageWidth": 3508,
            "imageHeight": 4961,
            "imageSize": 4680479,
            "views": 298226,
            "downloads": 252315,
            "collections": 818,
            "likes": 681,
            "comments": 132,
            "user_id": 1664300,
            "user": "Darkmoon_Art",
            "userImageURL": "https://cdn.pixabay.com/user/2022/09/27/12-51-07-71_250x250.jpg"
        },
        {
            "id": 3076954,
            "pageURL": "https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/",
            "type": "photo",
            "tags": "desk, smartphone, iphone",
            "previewURL": "https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g88a3ea1b1eeeee0eaa4bfcec10082434c63666c4cc204e9dd1048e28727da13b98b88b43c13f3d66540ba4335f022f350c6fbef96f9c9e265c64829e83557645_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g24652a42d75e6a69651da7d9241536ff744dec799070f18e9adafd24c624bc132e847d5e89db46fadd026c6212eb23b997e574e46fbd8ed2bfefd8f14edc4594_1280.jpg",
            "imageWidth": 5304,
            "imageHeight": 3531,
            "imageSize": 2258922,
            "views": 243189,
            "downloads": 154776,
            "collections": 909,
            "likes": 570,
            "comments": 103,
            "user_id": 2218222,
            "user": "Ylanite",
            "userImageURL": "https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"
        },
        {
            "id": 1842202,
            "pageURL": "https://pixabay.com/photos/camera-phone-picture-capture-1842202/",
            "type": "photo",
            "tags": "camera, phone, picture",
            "previewURL": "https://cdn.pixabay.com/photo/2016/11/20/08/33/camera-1842202_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/gce9d88a5daf203f35099e44eb472ce1909e34ec66a275128f91a949225e54dac6d5fb1f7e0bd96f6da078047434d7df58149e86d5e13580464578d42f13c361a_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g9dd1b8769f71c1c9affab5cdd53980f84651baab295cefaad58a71e65511fcdbbb273f6c804e8ed638c4ce43113d27420170f3895e6b85cc0e8afd6eb5907c79_1280.jpg",
            "imageWidth": 5472,
            "imageHeight": 3648,
            "imageSize": 2581728,
            "views": 85180,
            "downloads": 47342,
            "collections": 1359,
            "likes": 128,
            "comments": 26,
            "user_id": 2286921,
            "user": "Pexels",
            "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        },
        {
            "id": 298243,
            "pageURL": "https://pixabay.com/photos/smoke-abstract-background-fumes-298243/",
            "type": "photo",
            "tags": "smoke, abstract, background",
            "previewURL": "https://cdn.pixabay.com/photo/2014/03/25/22/53/smoke-298243_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g6d97ea65e27aa35f83a6e5afb253719fd6c82567583b3adfb3390627ae5430250d422bba488650f970852e7706cbb5f0_640.jpg",
            "webformatWidth": 425,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g795aa4de161f93c44170175bc766ce34ff23d8c60d05b98d52e21d0e854c598e6e8b2ff658cf9177cc6e4c4f7789d90c2d530a17055236d68ffdb932f052ea85_1280.jpg",
            "imageWidth": 2848,
            "imageHeight": 4288,
            "imageSize": 2236073,
            "views": 547784,
            "downloads": 387997,
            "collections": 740,
            "likes": 634,
            "comments": 104,
            "user_id": 168090,
            "user": "goranmx",
            "userImageURL": ""
        },
        {
            "id": 1659054,
            "pageURL": "https://pixabay.com/photos/grass-lawn-garden-park-ground-1659054/",
            "type": "photo",
            "tags": "grass, lawn, garden",
            "previewURL": "https://cdn.pixabay.com/photo/2016/09/10/12/40/grass-1659054_150.jpg",
            "previewWidth": 81,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g1fa23a1a5fd451e6ab957881145b5c4520cba3fb8467274fed72ca2cad375911706549aa40495fabe9f03a3f23ae8e04d32aaea6d8346e9af4234308ae6e30b3_640.jpg",
            "webformatWidth": 346,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gcb4f7477d6d3d38224e73d2c3f45f18ccf3a996769f3dbc8583324c379d29e3e7b3ca94200e2af8891466496ec9ee19e899cbd97924b491ab38783114a68ef1e_1280.jpg",
            "imageWidth": 2659,
            "imageHeight": 4911,
            "imageSize": 8444898,
            "views": 397767,
            "downloads": 319345,
            "collections": 772,
            "likes": 601,
            "comments": 88,
            "user_id": 1594796,
            "user": "jeonsango",
            "userImageURL": "https://cdn.pixabay.com/user/2016/04/22/14-26-25-744_250x250.jpg"
        },
        {
            "id": 2369664,
            "pageURL": "https://pixabay.com/photos/art-multicoloured-to-dye-abstract-2369664/",
            "type": "photo",
            "tags": "art, multicoloured, to dye",
            "previewURL": "https://cdn.pixabay.com/photo/2017/06/03/20/12/art-2369664_150.jpg",
            "previewWidth": 99,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g8f6bf6581c4329682765d1739e2dfd01becfb9834421d27c8e320bc58c670cd80fcdc342db3ba8a9c2c1e1d61a80fa95cc55d85e4ce9e60c4fee7b0c2caff493_640.jpg",
            "webformatWidth": 424,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g98603f0576b32b9347549e752982ba98f2da6ef37eae3fe67f06ed875721e320a8527df975269088d0c069a7305e7fd0eee671ff18f2ee33665a332b3385f9b7_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4928,
            "imageSize": 4032363,
            "views": 473195,
            "downloads": 417325,
            "collections": 820,
            "likes": 566,
            "comments": 66,
            "user_id": 4894494,
            "user": "eluela31",
            "userImageURL": "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
        },
        {
            "id": 410311,
            "pageURL": "https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
            "type": "photo",
            "tags": "iphone, hand, screen",
            "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/ga0317b3a0adeebf832ab13f4dfcf8153faf477fb5d778b29d7c96c296cd5cb93d71c298b25e85b6d737dff11453fcff8_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g0e9869050b0619f9a9df8df365985bf5fb31323b3b5b4af279180e7da551bc0051e9800dab5919cda633da3ba564a0630989785e46059268785dd965a988679f_1280.jpg",
            "imageWidth": 1920,
            "imageHeight": 1280,
            "imageSize": 416413,
            "views": 522815,
            "downloads": 261352,
            "collections": 632,
            "likes": 601,
            "comments": 163,
            "user_id": 264599,
            "user": "JESHOOTS-com",
            "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id": 500291,
            "pageURL": "https://pixabay.com/photos/iphone-hand-girl-smartphone-500291/",
            "type": "photo",
            "tags": "iphone, hand, girl",
            "previewURL": "https://cdn.pixabay.com/photo/2014/10/23/20/51/iphone-500291_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g57a7de775535f04cb3cb5f61825d5a76c34c0235c314c8d9d937e29385024114a754f4327642e63d7afed88c8737a8c1_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/gc5f002601dfaf88d9528bb3bdb589f53dd055b5ac4febd7c99273d027cbdd34929f0b72e53cb2ddab4469c87d7f4a1ce9e811b33abe4283a6a4e42468e3cec40_1280.jpg",
            "imageWidth": 1920,
            "imageHeight": 1280,
            "imageSize": 521447,
            "views": 160792,
            "downloads": 79398,
            "collections": 1039,
            "likes": 252,
            "comments": 46,
            "user_id": 264599,
            "user": "JESHOOTS-com",
            "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id": 1052023,
            "pageURL": "https://pixabay.com/photos/glasses-book-phone-iphone-1052023/",
            "type": "photo",
            "tags": "glasses, book, phone",
            "previewURL": "https://cdn.pixabay.com/photo/2015/11/19/21/14/glasses-1052023_150.jpg",
            "previewWidth": 150,
            "previewHeight": 112,
            "webformatURL": "https://pixabay.com/get/gd50d43f4441d50a9cd8bfa37566c014d96faa2fef3ded8ecdfa820ebc68b95cfc279e4d67c8b76ad6fa9ed68545d062d4baf0b4721425ade4f9084de71f95a8d_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 480,
            "largeImageURL": "https://pixabay.com/get/g06d5e235c10845c6e0756033512e885db838c8bf37371c202a656a52f9390870a898fe3d6e40973423c27384e2536b30851da81196c8b8656710f81cbaae1b8d_1280.jpg",
            "imageWidth": 4533,
            "imageHeight": 3400,
            "imageSize": 3219890,
            "views": 278996,
            "downloads": 168405,
            "collections": 645,
            "likes": 591,
            "comments": 80,
            "user_id": 1441456,
            "user": "DariuszSankowski",
            "userImageURL": "https://cdn.pixabay.com/user/2015/12/21/10-54-58-771_250x250.jpg"
        },
        {
            "id": 1850893,
            "pageURL": "https://pixabay.com/photos/morning-bedroom-bed-door-girl-1850893/",
            "type": "photo",
            "tags": "morning, bedroom, bed",
            "previewURL": "https://cdn.pixabay.com/photo/2016/11/22/22/18/morning-1850893_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g6407e5468cd5720418d3343e7d17eb8f18055e51465faa8d4bfa15736551c22c9b2ba2da0718b7c925cc7b7dcdb774f1e1056ecafb0c90946be0d4acf8fb9932_640.jpg",
            "webformatWidth": 426,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gcd7b447d2515b5c18650d72f9eb4d891979b9b8abdd27dca187c589b471f944836fc02ac52c051ec07628757e22fcf95682231a7eca33a750595f6d43839b1bc_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4896,
            "imageSize": 1383694,
            "views": 164400,
            "downloads": 102861,
            "collections": 666,
            "likes": 464,
            "comments": 43,
            "user_id": 2286921,
            "user": "Pexels",
            "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        }
    ]
}""";
