'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "cd3807e5406ffe54eca711b9fd150f65",
"assets/AssetManifest.json": "01c2223f7b3334ba84db207f22c85a6a",
"assets/assets/animations/lunar_expansion.riv": "12177fa268902886002021e1e8726b69",
"assets/assets/animations/wave.riv": "ded8118f3fb286f70588a15601ab4257",
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
"assets/assets/i18n/da.json": "de9db62fdd732f5e62d6fe2e42def4b4",
"assets/assets/i18n/en.json": "afb4a1d73980b2b51a928599528ba723",
"assets/assets/icons/icon-android-notification.png": "8bc2d298b080280331c708319e02d47a",
"assets/assets/icons/icon-android.png": "36b311e8627cf48a010b77bbf2fe9d97",
"assets/assets/icons/icon-ios.png": "a8d468ec09d656c514e9786ae7bfd279",
"assets/assets/images/test.png": "6e125741e17d10fb92490edc34cf696e",
"assets/assets/svgs/brand_da.svg": "a9417a0eb075010524505d90d59d4f21",
"assets/assets/svgs/brand_en.svg": "de3d6aaaf053e9f376ed1a18b69c3db0",
"assets/assets/svgs/facebook_logo.svg": "d132a6d0433c103e5a78a7369fac312d",
"assets/assets/svgs/github_logo.svg": "03aae0f6f51c27a5bb053d7f2d3efc76",
"assets/assets/svgs/instagram_logo.svg": "ea5ebd1b974ad356dc240080f70475d4",
"assets/assets/svgs/linkedin_logo.svg": "d396621a43b15796a373db7d195a8f78",
"assets/assets/svgs/logo.svg": "f74d37dfb5dcc32ebb039f0ae4ee921c",
"assets/assets/svgs/mail_logo.svg": "54cae6afd2fad6cc52bffc08f905fc68",
"assets/assets/svgs/wave.svg": "e6dde2a64d53a882e9eebb731e69ce86",
"assets/FontManifest.json": "8ba0772997e34996dcce1cb204840064",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/NOTICES": "e5dc007edb23e7e9863dba2be2868b78",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5d153c6a988d6f896b00f9a424320ff6",
"canvaskit/canvaskit.wasm": "7c6de92a246382429b7782137b4b4b5e",
"canvaskit/chromium/canvaskit.js": "504767837b8b6bec6f77f3978ddc5543",
"canvaskit/chromium/canvaskit.wasm": "6b6502433d076d159b59a13e6174cfde",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "867e0c1af67ee1abb30141e450e9d41f",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "7521698933b330793fccb97c504593a3",
"/": "7521698933b330793fccb97c504593a3",
"main.dart.js": "f015a3ffa785e41b107f7da1bd302b4f",
"manifest.json": "246661e9355cf24b4f9cfc72cc000cc2",
"version.json": "e2b17b502e4b0ce0d598939bf4dcc9ec"};
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
