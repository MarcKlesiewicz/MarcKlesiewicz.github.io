'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5fb7b90585ed97636c747f904fa64b22",
"assets/AssetManifest.json": "91b62206070c3b4bfc18a8a3928a286e",
"assets/assets/animations/lunar_expansion.riv": "12177fa268902886002021e1e8726b69",
"assets/assets/animations/menu.riv": "c91f627404157294a913cc19154a4931",
"assets/assets/animations/wave.riv": "42689bafb2d383ab2127b14cefdb26c7",
"assets/assets/fonts/BerkshireSwash-Regular.ttf": "ce313427e6a2252bb111eb6474bc1e03",
"assets/assets/fonts/EBGaramond-Bold.ttf": "391e7511a926edf1b30aa5a057cd7dff",
"assets/assets/fonts/EBGaramond-BoldItalic.ttf": "439043971de90c1b6701202c237b2546",
"assets/assets/fonts/EBGaramond-ExtraBold.ttf": "f0413fd4dcb4b78b9a9d439c0bafc4c8",
"assets/assets/fonts/EBGaramond-ExtraBoldItalic.ttf": "c4aa0df5479861556fdd4185f15acb91",
"assets/assets/fonts/EBGaramond-Italic.ttf": "f992ecbdfa7408ebd729e9118b7a5f1f",
"assets/assets/fonts/EBGaramond-Medium.ttf": "47d49339834dd06a9bc0550938090c5e",
"assets/assets/fonts/EBGaramond-MediumItalic.ttf": "ff3c092e386b4139908db054644b6506",
"assets/assets/fonts/EBGaramond-Regular.ttf": "f8a5f8a90eb3d8a867293e2a965540d0",
"assets/assets/fonts/EBGaramond-SemiBold.ttf": "dc6243c20fdf6d4b5af0cd8c31e66a4d",
"assets/assets/fonts/EBGaramond-SemiBoldItalic.ttf": "1560117703ace395821d41c4de86efb5",
"assets/assets/fonts/Montserrat-Black.ttf": "9c1278c56276b018109f295c1a751a69",
"assets/assets/fonts/Montserrat-BlackItalic.ttf": "a943ff860cf7bda5ce3722cad5c1dc06",
"assets/assets/fonts/Montserrat-Bold.ttf": "1f023b349af1d79a72740f4cc881a310",
"assets/assets/fonts/Montserrat-BoldItalic.ttf": "9d216a715551da3b92a4a9b0e8994868",
"assets/assets/fonts/Montserrat-ExtraBold.ttf": "bd8fb30c6473177cfb9a5544c9ad8fdb",
"assets/assets/fonts/Montserrat-ExtraBoldItalic.ttf": "e07b3f35e3e0073b2cde4c5a951cc24e",
"assets/assets/fonts/Montserrat-ExtraLight.ttf": "fca7947b08333e5ffcb80c069755b5c9",
"assets/assets/fonts/Montserrat-ExtraLightItalic.ttf": "e4d0c1f4d67a7f3d23a1f2f78d24ea57",
"assets/assets/fonts/Montserrat-Italic.ttf": "761177c558bb3a0084aa85704315b990",
"assets/assets/fonts/Montserrat-Light.ttf": "e65ae7ed560da1a63db603bd8584cfdb",
"assets/assets/fonts/Montserrat-LightItalic.ttf": "e70e5d8d5129f35418fe2cfaa6132c1d",
"assets/assets/fonts/Montserrat-Medium.ttf": "b3ba703c591edd4aad57f8f4561a287b",
"assets/assets/fonts/Montserrat-MediumItalic.ttf": "2e7c02a0a4a5fd318b0625d120ad2033",
"assets/assets/fonts/Montserrat-Regular.ttf": "3fe868a1a9930b59d94d2c1d79461e3c",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "fb428a00b04d4e93deb4d7180814848b",
"assets/assets/fonts/Montserrat-SemiBoldItalic.ttf": "d41c0a341637c2e35ae019730b2d45a5",
"assets/assets/fonts/Montserrat-Thin.ttf": "4b73d125bab54f94ed2510590c237f73",
"assets/assets/fonts/Montserrat-ThinItalic.ttf": "59cdce8fbd384a39ab0fd14b9f693de5",
"assets/assets/i18n/da.json": "00ca81eee712800e2a1791120e94a573",
"assets/assets/i18n/en.json": "e190eff75e8f618d97d9aadf38f4d6cc",
"assets/assets/icons/icon-android-notification.png": "8bc2d298b080280331c708319e02d47a",
"assets/assets/icons/icon-android.png": "36b311e8627cf48a010b77bbf2fe9d97",
"assets/assets/icons/icon-ios.png": "a8d468ec09d656c514e9786ae7bfd279",
"assets/assets/images/avatar.png": "1189c9f97b8248d98b7292f17fe28161",
"assets/assets/images/me.jpg": "d778c4e5d7b2df32450ad5cd0fff9983",
"assets/assets/svgs/autoRouter_logo.svg": "bcc9685fa7a71a6d86a6288483ffc3d3",
"assets/assets/svgs/blazor_logo.svg": "1d65069cff5ddbbe19dc172356a30439",
"assets/assets/svgs/blob.svg": "58a88422c8b098e51e9ff889fb61952e",
"assets/assets/svgs/brand_da.svg": "20fbdf170ca2faa619fe29baa0897713",
"assets/assets/svgs/brand_en.svg": "ef8557e20cc3c663aae1979a529f8560",
"assets/assets/svgs/clickup_logo.svg": "29161a1992956d058bd43349506c89e0",
"assets/assets/svgs/compass_logo.svg": "0968b4e4c7ea45c7b588a29582fa160c",
"assets/assets/svgs/csharp_logo.svg": "869a3288238b80917c52cc79dbf394bd",
"assets/assets/svgs/dart_logo.svg": "db71a0b8f1fc5bdce2c76dc3aa3d1f84",
"assets/assets/svgs/docker_logo.svg": "fc527e2a9f743795f76368972486fb8d",
"assets/assets/svgs/education.svg": "fe271c7efe9ab25b0f93dff54cb74198",
"assets/assets/svgs/facebook_logo.svg": "9bc9c5be7f57cb6e8d51c16645344034",
"assets/assets/svgs/figma_logo.svg": "5eee006139a25fe976448c546e6fdd8d",
"assets/assets/svgs/firebase_logo.svg": "6b836e8909dcd7cc5fc75d17c2ec0d25",
"assets/assets/svgs/flutter_logo.svg": "e4fdf791cd924d19e0026cd4b60891ca",
"assets/assets/svgs/focus.svg": "de802c6ba5ba586a153d432cc98d4bed",
"assets/assets/svgs/github_logo.svg": "92841971cbd8ae7df5a95a3560ad1301",
"assets/assets/svgs/github_logo_black.svg": "bce2e47fc2550daa18e1b7dd5f2dc945",
"assets/assets/svgs/globe.svg": "9a6300c4c0ea6fe5f67111c8d9cb47af",
"assets/assets/svgs/graphql_logo.svg": "cad994a395bb4e26dcb1f1df2f70ee3b",
"assets/assets/svgs/instagram_logo.svg": "ac76678e7feb41dbf58c6ff2f2a26eec",
"assets/assets/svgs/linkedin_logo.svg": "6f8312d5c7a65e36ef18d36c9d9bc3bf",
"assets/assets/svgs/logo.svg": "67b22e72919fc09a1f27a4b34d469d07",
"assets/assets/svgs/mail_logo.svg": "4c6ba8c6aef8f9b18f4ddd8f08ee55a3",
"assets/assets/svgs/mongodb_logo.svg": "c128411ad10768ee4eeb2fd8ddd0a4aa",
"assets/assets/svgs/nav_home.svg": "80e1f21942a3a7fa4fe098bd2e68dfb6",
"assets/assets/svgs/photoshop_logo.svg": "5b23535d009ba43b0c8fe994d14e244c",
"assets/assets/svgs/plant_uml.svg": "ebc6af5a237f7ff64c3438dea029db6d",
"assets/assets/svgs/profession.svg": "a6193570e9e04b236c9f287f53c27d9c",
"assets/assets/svgs/riverpod_logo.svg": "1cae6936338ae2d0183b12cc9e50238c",
"assets/assets/svgs/rive_logo.svg": "d05dc407f5e8de01be724d5a0d7cda03",
"assets/assets/svgs/slack_logo.svg": "79170f83c5be9dae61fe4dbae77ec674",
"assets/assets/svgs/swagger_logo.svg": "cbf1965fccb36ed2f73551b5a3e6a688",
"assets/assets/svgs/teams_logo.svg": "20dfc30ab935fb009d26a3cac0e14978",
"assets/assets/svgs/thunder_client_logo.svg": "f459d239962bdca0d00135304f09a768",
"assets/assets/svgs/trello_logo.svg": "9f28758d6c40f8537cdb5435c58ff437",
"assets/assets/svgs/visio_logo.svg": "d66f5a131c178773d0661be8d07e5f1f",
"assets/assets/svgs/vscode_logo.svg": "a275b67e6a9f8531f9238252a0b041f3",
"assets/assets/svgs/vs_logo.svg": "392ecd1e26a1e207f14677d02398e67e",
"assets/assets/svgs/wave.svg": "e6dde2a64d53a882e9eebb731e69ce86",
"assets/assets/svgs/wavetoolbox.svg": "af72b5646411db88954e271bb06b4454",
"assets/assets/svgs/web_logo.svg": "e2697aa8077fb2768d96c9d2dca6e50f",
"assets/assets/svgs/xd_logo.svg": "7b18ed3f73d1eee26ac9806fd7341435",
"assets/FontManifest.json": "8ba0772997e34996dcce1cb204840064",
"assets/fonts/MaterialIcons-Regular.otf": "6f6e84f204e71cb35f7dcd7d7b2a26e1",
"assets/NOTICES": "5a830ae75e6b2ef25db1f2cab4d78d12",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5d153c6a988d6f896b00f9a424320ff6",
"canvaskit/canvaskit.wasm": "7c6de92a246382429b7782137b4b4b5e",
"canvaskit/chromium/canvaskit.js": "504767837b8b6bec6f77f3978ddc5543",
"canvaskit/chromium/canvaskit.wasm": "6b6502433d076d159b59a13e6174cfde",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "867e0c1af67ee1abb30141e450e9d41f",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "a99f822fd1aa60c5ce42ee9c3d56fbb1",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "38cf67851a89773b41477fdc63da669f",
"/": "38cf67851a89773b41477fdc63da669f",
"main.dart.js": "11550f567cedf2b9227c0dc6dfc00c6a",
"manifest.json": "246661e9355cf24b4f9cfc72cc000cc2",
"version.json": "c4fa1175a6f24aea36519321aa977adf"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
