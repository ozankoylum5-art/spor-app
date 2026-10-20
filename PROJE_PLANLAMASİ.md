# Spor Uygulaması Projesi (Okul Projesi)
**8 Haftalık Proje Planı ve Ekip Öğrenme Rehberi**  
**Teknoloji:** React Native + Expo + Supabase | **Ekip:** 6 Kişi | **Süre:** 8 Hafta (6 Hafta Geliştirme + 2 Hafta Bugfix & Teslim)

---

## İçindekiler
1. [Proje Özeti ve Varsayımlar](#1-proje-özeti-ve-varsayımlar)
2. [Ekip Yapısı ve Eşit İş Yükü](#2-ekip-yapısı-ve-eşit-iş-yükü)
3. [8 Haftalık Görev Planı](#3-8-haftalık-görev-planı)
4. [Kilometre Taşları (Milestones)](#4-kilometre-taşları)
5. [Proje Yönetim Kuralları](#5-proje-yönetim-kuralları)
6. [Başlıca Riskler ve Önlemler](#6-başlıca-riskler-ve-önlemler)
7. [Ekip Öğrenme Rehberleri](#7-ekip-öğrenme-rehberleri)
   - [7.1 Üye 1: Hesap sistemi (Opsiyonel), girişsiz mod & Test/QA Lideri](#71-üye-1-hesap-sistemi-opsiyonel-girişsiz-mod-testqa-lideri)
   - [7.2 Üye 2: Supabase, PostgreSQL, RLS, Storage, servis katmanı & Git/Build Lideri](#72-üye-2-supabase-postgresql-rls-storage-servis-katmanı-git-ve-build-lideri)
   - [7.3 Üye 3: Anatomi ekranı (ön/arka SVG, tıklanabilir kaslar) & SVG Varlık Lideri](#73-üye-3-anatomi-ekranı-önarka-svg-tıklanabilir-kaslar-svg-varlık-lideri)
   - [7.4 Üye 4: Kas $\rightarrow$ Video ekranı, Profil, Tema, Navigasyon & İçerik/Dokümantasyon Lideri](#74-üye-4-kas--video-ekranı-profil-tema-navigasyon-içerik-ve-dokümantasyon-lideri)
   - [7.5 Üye 5: Takvim ve antrenman günlüğü (hareket, set, tekrar, kg) & Demo/Sunum Lideri](#75-üye-5-takvim-ve-antrenman-günlüğü-hareket-set-tekrar-kg-demo-ve-sunum-lideri)
   - [7.6 Üye 6: Profil, Tema, Navigasyon, Kas $\rightarrow$ Video ekranı & UI/Bileşen Lideri](#76-üye-6-profil-tema-navigasyon-kas--video-ekranı-uibileşen-lideri)

---

## 1. Proje Özeti ve Varsayımlar

Altı kişilik bir ekip **8 haftada** bir spor ve antrenman takip mobil uygulaması geliştirecektir. Proje **okul projesi** kapsamında teslim edileceği için uygulama mağazalarında (Google Play / App Store) yayınlanmayacak; reklam, mağaza görselleri/metinleri ve KVKK/gizlilik politikası gibi ticari yayın süreçleri kapsam dışı bırakılmıştır.

### Uygulamanın Kapsamı
* **Ana Menü (Anatomi):** Ön ve arka tarafı olan 2D insan kas anatomi çizimi (SVG). Bir kas grubuna tıklayınca o kasla ilgili egzersiz videoları gösterilir.
* **Videolar (`.mp4`):** YouTube bağlantısı yerine ekibin kendi hazırladığı `.mp4` formatındaki videolar kullanılır (Supabase Storage üzerinden veya yerel/uzak varlık olarak `expo-video` ile oynatılır).
* **Takvim ve Antrenman Günlüğü:** Gün gün hangi hareketin kaç set, kaç tekrar ve kaç $\text{kg}$ ile yapıldığı kaydedilir.
* **Profil:** İsim, soyisim, yaş, kilo, boy gibi temel kullanıcı bilgileri tutulur.
* **Hesap Sistemi (Opsiyonel):** Anatomi ve video kısmı girişsiz (misafir modunda) kullanılabilir. Takvim ve profil verisinin kalıcı olması için kullanıcı girişi gerekir.

### Teknoloji Yığını
* **Uygulama (Frontend):** React Native + Expo (`expo-video`, `react-native-svg`, `react-native-calendars`, React Navigation)
* **Veritabanı & Depolama (Backend):** PostgreSQL + Supabase (Auth, Database, Storage)
* **Tasarım Yaklaşımı:** Figma kullanılmayacaktır. Ekran tasarımları doğrudan kod üzerinde ortak tema (`src/theme`) ve ortak bileşenler (`Button`, `Input`, `Card`, `Screen`) kullanılarak geliştirilecektir.

### Varsayımlar ve Planlama Mantığı
* **Süreç (6 + 2 Hafta):** İlk 6 hafta yoğunlaştırılmış geliştirme sürecidir (eski 12 haftalık plandaki ikişer haftalık işler tek haftada birleştirilmiştir). **Hafta 7 ve Hafta 8** tamamen **Bugfix (hata düzeltme), regresyon testi, dokümantasyon ve okul sunumu/teslimi** için ayrılmıştır.
* **MP4 Videolar ve Görev Paylaşımı:** Figma ve mağaza süreçleri kalktığı için **Üye 4 ve Üye 6** arayüz (Profil, Tema, Navigasyon, Video Ekranı) ve içerik entegrasyonu görevlerini ortak/eşdeğer şekilde yürütür. Ayrıca `.mp4` videoların hazırlanması ve sisteme girilmesi sürecine tüm 6 üye destek verir.
* **Teslim Hedefi:** Hafta 8 sonunda Expo Go ve EAS üzerinden alınan **APK** paketi ile okul sunumunda uçtan uca hatasız çalışan uygulama demosu yapmak.

---

## 2. Ekip Yapısı ve Eşit İş Yükü

| Üye | Ana Modül ve Sorumluluk | Yan Rol | Kod İnceleme ve Test Çifti |
| :--- | :--- | :--- | :--- |
| **Üye 1** | Hesap sistemi (Opsiyonel): giriş, kayıt, oturum, girişsiz mod | Test / QA Lideri | **Üye 2** ($1 \leftrightarrow 2$) |
| **Üye 2** | Supabase, PostgreSQL şeması, RLS, Storage (MP4), servis katmanı | Git ve Build (APK) Lideri | **Üye 1** ($1 \leftrightarrow 2$) |
| **Üye 3** | Anatomi ekranı: ön/arka SVG, tıklanabilir kaslar, zoom | Grafik / SVG Varlık Lideri | **Üye 4** ($3 \leftrightarrow 4$) |
| **Üye 4** | Kas $\rightarrow$ MP4 Video ekranı, Profil, Tema, Navigasyon & İçerik | İçerik ve Dokümantasyon Lideri | **Üye 3** ($3 \leftrightarrow 4$) |
| **Üye 5** | Takvim ve antrenman günlüğü (hareket, set, tekrar, $\text{kg}$) | Demo ve Okul Sunumu Lideri | **Üye 6** ($5 \leftrightarrow 6$) |
| **Üye 6** | Profil, Tema, Navigasyon, Kas $\rightarrow$ MP4 Video ekranı & Ortak UI | UI / Ortak Bileşen Lideri | **Üye 5** ($5 \leftrightarrow 6$) |

### Yük Eşitliği ve Çift Çalışma Kuralları
* **Kod İnceleme (PR) ve Çapraz Test Çiftleri:**
  * **Üye 1 $\leftrightarrow$ Üye 2**
  * **Üye 3 $\leftrightarrow$ Üye 4**
  * **Üye 5 $\leftrightarrow$ Üye 6**
  * Her PR'ı (Pull Request) ilgili üyenin çifti inceler ve onaylar. Hafta 4'teki çapraz testte ve Hafta 7-8'deki bugfix sürecinde çiftler birbirinin modülünü test eder.
* **Üye 4 ve Üye 6 Eşitlemesi:** Figma ve mağaza yükü kalktığı için Üye 4 ve Üye 6 aynı görev havuzunu (Tema, Ortak Bileşenler, Navigasyon, Profil Ekranı, MP4 Video Oynatıcı/Liste Ekranı ve MP4 İçerik Girişi) paylaşarak ilerler. Ayrıca `.mp4` videoların çekimi/hazırlanması 6 üye arasında kas gruplarına göre eşit bölüştürülür.

---

## 3. 8 Haftalık Görev Planı

| Hafta | Tema | Üye 1 | Üye 2 | Üye 3 | Üye 4 | Üye 5 | Üye 6 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Hafta 1**<br>*(Eski H1+H2)* | **Ortak Eğitim & Mini Prototip (M1)** | Git/JS/Expo eğitimi + Supabase Auth mini prototipi | Git/JS/Expo eğitimi + Supabase ilk tablo ve veri oku/yaz | Git/JS/Expo eğitimi + `react-native-svg` tıklanabilir şekil | Git/JS/Expo eğitimi + `expo-video` ile MP4 oynatıcı/listeve Tab Navigasyon prototipi | Git/JS/Expo eğitimi + `react-native-calendars` denemesi | Git/JS/Expo eğitimi + Tab Navigasyon ve `expo-video` MP4 oynatıcı/liste prototipi |
| **Hafta 2**<br>*(Eski H3+H4)* | **İskelet & Temel Akışlar (M2)** | Giriş/kayıt arayüzü + Kayıt/giriş/çıkış ve oturum kalıcılığı (`useAuth`) | DB şeması, ER diyagramı + Tabloları kurma, RLS, Storage bucket ve kas seed verisi | Ön/arka vücut SVG hazırlığı (Inkscape/CC0) + Uygulamaya alma ve ön/arka geçişi | Tema, ortak bileşenler (`Button`, `Input`), Kas/Video tablosu + MP4 Video listesi ve Profil arayüzü | Takvim ekranı iskeleti + Gün detayı ve "hareket ekle" formu (yerel state) | Tema (`src/theme`), ortak bileşenler + Profil ekranı arayüzü ve MP4 Video listesi ekranı |
| **Hafta 3**<br>*(Eski H5+H6)* | **Çekirdek Özellikler 1 (DB & MP4 Bağlantısı)** | Girişsiz (misafir) mod + Şifre sıfırlama + Hata/yükleniyor durumları | Servis katmanı (kas/video/log/profil) + Egzersiz listesi, arama, indexler | Kasa dokunma algılama, vurgulama + Küçük kaslar için dokunma alanı ve zoom | Kas seç $\rightarrow$ MP4 video ekranı (Supabase'ten) + İlk 7 kas grubu MP4 yükleme + Profil kaydet/oku + Boş/hata ekranları | Antrenman kaydını ($\text{set/tekrar/kg}$) DB'ye yazma + Antrenmanlı günleri takvimde işaretleme | Profili kaydet/oku (Supabase) + Boş/hata ekranları, ikonlar + Kas seç $\rightarrow$ MP4 video ekranı ve ilk 7 kas MP4 yükleme |
| **Hafta 4**<br>*(Eski H7+H8)* | **Çekirdek Özellikler 2 & Çapraz Test (M3 - MVP)** | Çıkış, şifre değiştirme, hesap silme + **Üye 2'nin modülünü test et** | Veri doğrulama (`CHECK`), test verisi + **Üye 1'in modülünü test et** | Farklı ekran boyutlarına uyum, görsel cila + **Üye 4'ün modülünü test et** | Kalan 7 kas MP4 videoları, seviye etiketi, Onboarding + **Üye 3'ün modülünü test et** | Kaydı düzenle/sil, hareketi listeden seç + **Üye 6'nın modülünü test et** | Onboarding, sekmeler arası akış, kalan 7 kas MP4 videoları + **Üye 5'in modülünü test et** |
| **Hafta 5**<br>*(Eski H9)* | **İyileştirme, Ek Özellikler & Kullanıcı Testi** | 5-10 kişiyle kullanıcı testi (okul/arkadaş), geri bildirim formu | Performans, yedekleme, `.env` düzeni, MP4 Storage optimizasyonu | Kas sınırlarında ince ayar + kullanıcı geri bildirimleri | Video arama/filtre (`tr-TR`) + Karanlık mod, erişilebilirlik, uygulama ikonu/splash | Haftalık ve aylık özet (toplam set, tekrar ve $\text{kg}$ hacmi) | Karanlık mod, erişilebilirlik, uygulama ikonu/splash + Video arama/filtre |
| **Hafta 6**<br>*(Eski H10)* | **Özellik Dondurma (M4) & Son Cila** | Güvenlik kontrolü (`.env`, RLS kontrolü, şifre kuralları) | EAS Build kurulumu (`eas.json`), sunum için ilk APK çıktısı | SVG performansı (`React.memo`), ön/arka geçiş animasyon cilası | MP4 videoların tüm cihazlarda kontrolü (codec/boyut) + Ekranlar arası UI tutarlılığı | Bağlantı hatası durumları (`NetInfo`), çevrimdışı uyarı bandı | Ekranlar arası UI tutarlılığı + MP4 videoların tüm cihazlarda oynatım/boyut kontrolü |
| **Hafta 7**<br>*(Bugfix 1)* | **Bugfix Süreci 1: Regresyon & Kritik Hatalar** | Tam regresyon testi, hata raporları (Issue) takibi ve kendi bugfixleri | Test APK build'leri, DB/RLS/Servis katmanı bugfixleri | Kritik hatalar ve bugfix: Anatomi ekranı ve SVG dokunma/zoom | Kritik hatalar ve bugfix: MP4 video oynatıcı, liste, profil ve navigasyon | Kritik hatalar ve bugfix: Takvim, tarih kayması, ondalık $\text{kg}$ ve state temizliği | Kritik hatalar ve bugfix: Profil, karanlık mod, klavye/ekran taşmaları, video ekranı |
| **Hafta 8**<br>*(Bugfix 2 & Teslim)* | **Bugfix Süreci 2, Dokümantasyon & Final Demo (M5)** | Son bugfix kontrolü, Go/No-Go listesi, test verisi temizliği | Final APK üretimi, Git sürüm etiketi (`v1.0`), DB son kontrolü | Son bugfixler + Anatomi modülü teknik dokümantasyonu (`README`) | Son bugfixler + Kullanıcı rehberi, MP4 içerik dokümanı ve ana `README` | Son bugfixler + **Okul Final Demo ve Sunum Hazırlığı** | Son bugfixler + Ekip retrospektifi, UI dokümantasyonu ve sunum desteği |

---

## 4. Kilometre Taşları

| Taş | Zaman | Çıkış Kriteri |
| :--- | :--- | :--- |
| **M1** | **Hafta 1 Sonu** | Herkeste çalışan Expo uygulaması, Git akışı ve her üyenin kendi mini prototipi hazır. |
| **M2** | **Hafta 2 Sonu** | Giriş/kayıt çalışıyor, Supabase DB ve Storage hazır, anatomi SVG ekranda, ortak tema ve navigasyon birleştirildi. |
| **M3** | **Hafta 4 Sonu** | **MVP Tamamlandı:** Tüm özellikler (Anatomi $\rightarrow$ MP4 Video, Takvim, Profil, Girişsiz Mod) uçtan uca çalışıyor ve çapraz testler ($1 \leftrightarrow 2$, $3 \leftrightarrow 4$, $5 \leftrightarrow 6$) yapıldı. |
| **M4** | **Hafta 6 Sonu** | **Özellik Dondurma (Feature Freeze):** Arama, karanlık mod, haftalık özet ve bağlantı kontrolü bitti. İlk APK alındı. Bu haftadan sonra yeni özellik eklenmez. |
| **M5** | **Hafta 8 Sonu** | **Okul Teslimi ve Final Demo:** Hafta 7-8 bugfix süreci tamamlandı, açık kritik hata sıfırlandı, dokümantasyon ve APK ile final sunumu hazır. |

---

## 5. Proje Yönetim Kuralları

* **Yöntem:** 1 haftalık sprintler (Scrum-lite). Pazartesi planlama ($45\text{ dk}$), günlük $15\text{ dk}$ stand-up (WhatsApp/Discord üzerinden yazılı olabilir), Cuma demo + retrospektif ($45\text{ dk}$).
* **Araçlar:** GitHub (Repo + Projects panosu + Issues), WhatsApp veya Discord, Supabase Paneli, Expo Go, SVG düzenleme için Inkscape (veya hazır açık lisanslı SVG). *Figma kullanılmayacaktır.*
* **Git Düzeni:** `main` korumalı, `develop` ana çalışma dalı, her iş için `feature/...` veya `fix/...` dalı. PR zorunludur ve kod inceleme çiftinden ($1 \leftrightarrow 2$, $3 \leftrightarrow 4$, $5 \leftrightarrow 6$) en az 1 onay gerekir.
* **"Bitti" Tanımı (Definition of Done):** Kod çalışıyor, PR eş tarafından onaylandı, yazan kişi dışında eşi gerçek telefonda test etti, pano kartı kapandı.
* **Takılma Kuralı:** Bir sorunla **2 saat** uğraşıp çözemeyen hemen ekibe sorar. 8 haftalık sıkıştırılmış takvimde sessizce takılmak en büyük zaman kaybıdır.
* **Kapsam Kuralı:** **Hafta 6**'dan sonra kesinlikle yeni özellik girmez. Hafta 7 ve 8 yalnızca bugfix, test ve sunum hazırlığı içindir.

---

## 6. Başlıca Riskler ve Önlemler

| Risk | Önlem |
| :--- | :--- |
| **8 haftalık sıkıştırılmış takvim** | İki haftalık işler birleştirildiği için Hafta 1'de ortak bileşenler ve şema gecikmemeli; 2 saat takılma kuralına sıkı uyulmalı. |
| **MP4 videoların boyutu ve format uyumsuzluğu** | Videolar H.264 codec'li `.mp4` formatında, $720\text{p}$ çözünürlükte ve kısa ($10\text{-}20\text{ sn}$) tutulmalı. Uygulama içine gömmek yerine Supabase Storage'dan (public URL) çekilmeli. |
| **Figma olmadan arayüz uyumsuzluğu** | Hafta 2 başında `src/theme` (renkler, boşluklar, yazı boyutları) ve ortak bileşenler (`Button`, `Input`, `Card`, `Screen`) yazılıp herkesin sadece bunları kullanması zorunlu tutulmalı. |
| **2D anatomi SVG'sinin zorluğu** | CC0 lisanslı hazır bir SVG tabanı kullanılmalı veya Inkscape'te sadeleştirilmeli. Hafta 2 ortasına kadar yetişmezse basit blok kas şemasına geçilmeli. |
| **Kapsam kayması (Scope Creep)** | Hafta 6 sonunda özellik dondurma uygulanır; Hafta 7 ve 8'de sadece hata düzeltilir. |
| **Sunum günü internet veya cihaz sorunu** | Hafta 6-8'de EAS ile çalışan **APK** alınır, sunumdan önce yedek ekran kaydı videosu çekilir ve 2 farklı telefonda hazır tutulur. |

---

## 7. Ekip Öğrenme Rehberleri

Aşağıda her üye için 8 haftalık yeni plana göre güncellenmiş görev ve öğrenme rehberleri yer almaktadır.

---

### 7.1 Üye 1: Hesap sistemi (Opsiyonel), girişsiz mod; Test/QA Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 2 ($1 \leftrightarrow 2$)

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + Supabase Auth denemesi | **Eğitim:** Git (commit, branch, push, pull, PR), JS (`async/await`, nesne, import/export), React (`useState`, `useEffect`), Expo kurulumu.<br>**Prototip:** Kimlik doğrulama mantığı (kullanıcı, session, token). `react-native-url-polyfill` ve `AsyncStorage` ile Supabase client kurulumu. `signUp`, `signInWithPassword`, `signOut`. Kendi deneme Supabase projesinde çalış. | Kendi dalında PR açabiliyor; deneme uygulamasında kayıt olup giriş yapabiliyor. |
| **Hafta 2**<br>Giriş/kayıt arayüzü + Oturum kalıcılığı (`useAuth`) | **Arayüz:** `View`, `Text`, `TextInput`, `Pressable`, `StyleSheet`, `KeyboardAvoidingView`. Form state'i ve doğrulama (e-posta formatı, şifre uzunluğu). Üye 4/6'nın ortak bileşenlerini (`Button`, `Input`) kullanma.<br>**Oturum:** `onAuthStateChange`, `getSession`. `AsyncStorage` ile kalıcılık. React Context ile `useAuth()` hook'u yazıp `user.id` bilgisini tüm ekibe dağıtma. | Giriş/kayıt ekranları çalışıyor, uygulama kapatılıp açılınca oturum sürüyor, `useAuth()` ekibe teslim edildi. |
| **Hafta 3**<br>Girişsiz mod + Şifre sıfırlama + Hata/Yükleniyor durumları | **Girişsiz Mod:** Koşullu gezinme. "Misafir olarak devam et" akışı: Anatomi ve MP4 videolar girişsiz açılır; Takvim ve Profil'e girişsiz tıklanınca giriş ekranına yönlendirir.<br>**Hata ve Şifre:** `resetPasswordForEmail` ve deep link (`Linking`). `try/catch` ve `{ data, error }` yapısı. İngilizce Supabase hatalarını Türkçe mesajlara çevirme. `ActivityIndicator` ile işlem sürerken butonu kilitleme. | Girişsiz mod çalışıyor, korumalı sekmeler yönlendiriyor, hatalarda Türkçe anlaşılır mesajlar çıkıyor. |
| **Hafta 4**<br>Çıkış, şifre değiştirme, hesap silme + **Üye 2'yi Test Et** | **Hesap İşlemleri:** `auth.updateUser({ password })`, onay penceresi (`Alert`). Hesap silme: Üye 2'nin yazdığı SQL fonksiyonunu `supabase.rpc()` ile çağırma ve verilerin silindiğini doğrulama.<br>**Çapraz Test ($1 \leftrightarrow 2$):** QA lideri olarak test şablonu hazırlama. **Üye 2'nin** veritabanı, RLS, Storage ve servis katmanını test edip GitHub Issues'ta hata raporu açma. | Şifre değişimi ve hesap silme çalışıyor; Üye 2'nin modülü test edildi ve Issue'lar açıldı. |
| **Hafta 5**<br>Kullanıcı testi (5-10 kişi) | Okuldan/arkadaş çevresinden 5-10 kişiye Expo Go ile uygulamayı kullandırma. Görev verip müdahale etmeden gözlem yapma. Kısa geri bildirim formu (Google Forms) toplama ve bulguları "hata", "öneri", "karışıklık" olarak önceliklendirip GitHub Issues'a aktarma. | Kullanıcı testi yapıldı, geri bildirimler önceliklendirilmiş Issue'lara dönüştürüldü. |
| **Hafta 6**<br>Özellik Dondurma & Güvenlik Kontrolü | *Not: Okul projesi olduğu için KVKK metni yazılmayacaktır.*<br>**Güvenlik Kontrol Listesi:** `.env` dosyası `.gitignore`'da mı, `service_role` anahtarı uygulama kodunda yok mu, tüm kullanıcı tablolarında RLS açık mı (Üye 2 ile kontrol), hata mesajları sistem bilgisi sızdırıyor mu, loglarda şifre/token kalmış mı kontrolü. | Güvenlik kontrol listesi tamamlandı, açık güvenlik zafiyeti kalmadı. |
| **Hafta 7**<br>Bugfix 1: Tam Regresyon Testi & Hata Düzeltme | **Bugfix Süreci:** Üye 2'nin aldığı APK üzerinde tüm test senaryolarını (kayıt, giriş, misafir modu, anatomi, MP4 video, takvim, profil) baştan sona koşma (Regresyon testi). Kendi Auth/Girişsiz mod hatalarını küçük PR'larla (`fix/...`) düzeltme, diğer üyelerin kapattığı Issue'ları yeniden test edip onaylama. | Tüm senaryolar APK üzerinde koşuldu, Auth hataları giderildi, açık kritik hatalar takip ediliyor. |
| **Hafta 8**<br>Bugfix 2: Son Test, Go/No-Go & Teslim | Kalan son bugfixlerin doğrulanması. Sunum öncesi Go/No-Go kontrol listesinin tamamlanması (tüm akışlar hatasız çalışıyor mu). Sunumda kullanılacak veritabanından gereksiz test hesaplarını temizleme. Okul sunumunda kendi modülünü ve QA sürecini anlatma. | Açık kritik hata sıfırlandı, uygulama okul sunumuna hazır. |

---

### 7.2 Üye 2: Supabase, PostgreSQL, RLS, Storage, servis katmanı; Git ve Build Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 1 ($1 \leftrightarrow 2$)

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + Supabase ilk tablo ve veri oku/yaz | **Eğitim:** Git (branch, PR, **merge conflict çözme** - Git lideri olarak derinlemesine), JS (`async/await`, dizi/nesne), Expo kurulumu.<br>**Prototip:** Veritabanı kavramları (tablo, satır, sütun, `uuid`, `timestamp`, primary key). `supabase-js` kurulumu, `select` ve `insert`. `anon` key ile `service_role` key farkı. | Merge conflict çözebiliyor; Expo uygulamasından Supabase'e veri yazıp okuyabiliyor. |
| **Hafta 2**<br>DB Şeması, Tablolar, RLS, Storage & Seed | **Şema:** Foreign key, bire-çok ilişki, ER diyagramı (`profiles`, `muscle_groups`, `exercises`, `videos`, `workout_logs`).<br>**Kurulum & RLS:** `CREATE TABLE`, `INSERT`, `SELECT`, RLS politikaları (`auth.uid()`). Kas ve video tabloları herkese açık (girişsiz mod), profil ve antrenmanlar sadece sahibine açık.<br>**MP4 Storage:** Supabase Storage'da herkese açık (public) bir `videos` bucket'ı açma ve örnek `.mp4` yükleyip public URL alma. SQL'leri `schema.sql` ve `seed.sql` olarak repoya koyma. | Tablolar, RLS ve MP4 Storage bucket hazır; kas seed verisi girildi. |
| **Hafta 3**<br>Servis katmanı + Egzersiz listesi, arama, indexler | **Servis Katmanı:** `services/` klasöründe kas, MP4 video URL'leri, profil ve antrenman kayıtları için `select`, `insert`, `update`, `delete`, `eq`, `order` fonksiyonlarını yazıp ekibe verme.<br>**Arama & Index:** `ILIKE` ile egzersiz arama fonksiyonu, `LIMIT`, foreign key sütunlarına `CREATE INDEX` ekleme. | Tüm ekip veritabanı işlemlerini `services/` fonksiyonlarıyla çağırabiliyor, arama çalışıyor. |
| **Hafta 4**<br>Veri doğrulama, Hesap silme RPC + **Üye 1'i Test Et** | **Doğrulama:** `CHECK` kısıtları ($\text{kg} > 0$, $\text{tekrar} > 0$), varsayılan değerler. Üye 1 için kullanıcı hesabını ve ilişkili verileri silen küçük SQL fonksiyonunu (`rpc`) yazma.<br>**Çapraz Test ($1 \leftrightarrow 2$):** **Üye 1'in** kayıt, giriş, çıkış, oturum kalıcılığı ve girişsiz mod ekranlarını test edip GitHub Issues'ta raporlama. | Geçersiz veriler DB seviyesinde reddediliyor, hesap silme RPC hazır; Üye 1'in modülü test edildi. |
| **Hafta 5**<br>Performans, Yedekleme, `.env` ve MP4 Optimizasyonu | `.env` dosyası ve `EXPO_PUBLIC_` değişkenlerinin düzenlenmesi. Veritabanı yedekleme (SQL/CSV dışa aktarma). Supabase Storage'daki `.mp4` dosyalarının hızlı yüklenmesi için dosya boyutu ve public URL kontrolleri. | `.env` yapısı temiz, veritabanı yedeği alındı, MP4 bağlantıları sorunsuz. |
| **Hafta 6**<br>EAS Build Kurulumu ve İlk APK Çıktısı | *Not: Mağaza yayını olmadığı için Google Play / App Store hesapları açılmaz.*<br>**APK Build:** EAS CLI kurulumu, `eas.json` (`preview` profilinde Android için `.apk` üretecek şekilde yapılandırma: `"buildType": "apk"`), `app.json` ayarları (uygulama adı, paket kimliği, Üye 4/6'nın hazırladığı ikon/splash). İlk test APK'sını alıp ekibe dağıtma. | EAS üzerinden ilk kurulum yapılabilir `.apk` dosyası alındı ve telefonlara kuruldu. |
| **Hafta 7**<br>Bugfix 1: Servis/DB Hataları & Yeni Test APK'ları | **Bugfix Süreci:** Regresyon testlerinde çıkan veritabanı, RLS, `services/` fonksiyonları veya Storage kaynaklı hataları çözme. Ekibin yaptığı düzeltmeleri `develop` dalında birleştirip güncel test APK'ları üretme. | DB ve servis katmanındaki tüm hatalar giderildi, güncel APK ekibe dağıtıldı. |
| **Hafta 8**<br>Bugfix 2: Final APK Build, Git Tag & Teslim | Son bugfix PR'larını birleştirme. Okul sunumu için final `.apk` paketini üretme ve sunum telefonlarına kurma. `main` dalına son sürümü aktarıp `git tag v1.0.0` etiketi atma. Sunumda veritabanı mimarisini ve güvenliği (RLS) anlatma. | Final APK hazır, `v1.0.0` etiketlendi, sunum cihazlarında uygulama çalışıyor. |

---

### 7.3 Üye 3: Anatomi ekranı (ön/arka SVG, tıklanabilir kaslar); SVG Varlık Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 4 ($3 \leftrightarrow 4$)

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + `react-native-svg` tıklanabilir şekil | **Eğitim:** Git (branch, PR, PR inceleme - çiftin Üye 4), JS (`map()`, dizi/nesne), React (`props`, `useState`), Expo kurulumu.<br>**Prototip:** `npx expo install react-native-svg`. SVG temelleri (`viewBox`, `Svg`, `G`, `Path`). `onPress` ile şekle dokunmayı yakalama ve `useState` ile dokunulan şeklin rengini değiştirme. | 3 farklı şekilden oluşan deneme çiziminde dokunulan şeklin rengi değişiyor. |
| **Hafta 2**<br>Ön/Arka SVG Hazırlığı + Uygulamaya Alma ve Geçiş | **SVG Hazırlığı (Figma Yok):** CC0 lisanslı hazır bir 2D kas SVG'si bulma veya **Inkscape** kullanarak kas gruplarını (14 grup: ön ve arka) ayrı `Path` nesnelerine ayırma (`chest`, `biceps` vb. küçük harfli `id`'ler). SVGO/SVGOMG ile sadeleştirip `{ id, d }` veri yapısına dönüştürme.<br>**Bileşen:** `BodyMap` bileşenini `muscles.front.map(...)` ile veriye dayalı çizme. Ön/Arka geçiş butonu ekleme. | Ana menüde ön ve arka vücut çizimi görünüyor, buton ile ön/arka geçişi çalışıyor. |
| **Hafta 3**<br>Kasa Dokunma Algılama + Küçük Kaslar ve Zoom | **Dokunma & Navigasyon:** Seçili kasın rengini değiştirme, kas adını ekranda gösterme (Üye 2'nin `muscle_groups` verisiyle eşleşmeli). Kasa tıklayınca `navigation.navigate('Videos', { muscleId })` ile video ekranına yönlendirme.<br>**Küçük Kaslar & Zoom:** Küçük kaslar için görünmez geniş dokunma alanı (`fill="transparent"`) veya `viewBox` state'ini değiştirerek $+/-$ yakınlaştırma (zoom) ekleme. | Kasa dokununca vurgulanıyor, küçük kaslara rahat basılıyor ve doğru kasın MP4 video ekranı açılıyor. |
| **Hafta 4**<br>Ekran Boyutu Uyumu + **Üye 4'ü Test Et** | **Görsel Cila:** `useWindowDimensions`, `SafeAreaView` ile küçük/büyük ekranlarda en-boy oranını koruma. Uygulamayı dikey modda sabitleme. Renkleri `src/theme` dosyasından okuma.<br>**Çapraz Test ($3 \leftrightarrow 4$):** **Üye 4'ün** MP4 video listesi, video oynatıcı ekranı ve içerik modülünü gerçek telefonda test edip GitHub Issues'ta hata raporu açma. | Çizim hiçbir ekranda taşmıyor; Üye 4'ün video modülü test edildi ve Issue'lar açıldı. |
| **Hafta 5**<br>Kas Sınırlarında İnce Ayar & Geri Bildirimler | Kullanıcı testlerinden gelen "yanlış kasa basıyorum", "sınırlar kaymış" geri bildirimlerine göre Inkscape veya SVG path verisinde nokta düzeltmeleri yapma. İsteğe bağlı erişilebilirlik desteği olarak ekranın altına basit seçilebilir kas listesi ekleme. | Kullanıcı geri bildirimlerindeki dokunma ve sınır sorunları tamamen çözüldü. |
| **Hafta 6**<br>SVG Performansı & Animasyon Cilası | `React.memo` ve `useMemo` kullanarak bir kasa basıldığında tüm şekillerin gereksiz yere yeniden çizilmesini önleme. Ön/arka vücut geçişinde React Native `Animated` ile yumuşak geçiş (opacity fade) ekleme. | Düşük donanımlı telefonda bile takılma yok, ön/arka geçişi akıcı. |
| **Hafta 7**<br>Bugfix 1: Anatomi ve SVG Hata Düzeltmeleri | **Bugfix Süreci:** Farklı Android/iOS ekran boyutlarında, karanlık modda veya hızlı art arda tıklamalarda oluşan SVG ve navigasyon hatalarını (`fix/...` dallarıyla) düzeltme. | Anatomi modülündeki tüm bildirilmiş hatalar giderildi. |
| **Hafta 8**<br>Bugfix 2: Teknik Dokümantasyon & Teslim | Son bugfix kontrolleri. Anatomi modülü için `README.md` yazımı (`BodyMap` props yapısı, yeni kas path'i ekleme adımları, veritabanı `id` eşleşmesi). Okul sunumunda SVG mimarisini anlatma. | Dokümantasyon tamamlandı, modül sunuma hazır. |

---

### 7.4 Üye 4: Kas $\rightarrow$ Video ekranı, Profil, Tema, Navigasyon; İçerik ve Dokümantasyon Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 3 ($3 \leftrightarrow 4$)
* **Görev Eşitlemesi Notu:** Figma ve mağaza süreçleri kaldırıldığı için **Üye 4 ve Üye 6**; Tema, Ortak Bileşenler, Navigasyon, Profil ve MP4 Video Ekranı görevlerini birlikte/eşdeğer olarak yürütür. MP4 videoların hazırlanmasına tüm 6 üye katkı sağlar.

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + MP4 Video Oynatıcı & Navigasyon Prototipi | **Eğitim:** Git (PR açma ve inceleme - çiftin Üye 3), JS (`map()`, `filter()`), React (`useState`, `useEffect`), Markdown temelleri.<br>**Prototip (MP4):** YouTube yerine yerel/uzak `.mp4` oynatmak için `npx expo install expo-video` (veya `expo-av`) kurulumu. `FlatList` ile 3-4 örnek `.mp4` videoyu listeleme ve tıklayınca tam ekran/modal içinde oynatma. Üye 6 ile birlikte React Navigation sekme yapısını deneme. | Deneme uygulamasında liste görünüyor, tıklayınca `.mp4` video sorunsuz oynuyor. |
| **Hafta 2**<br>Tema, Ortak Bileşenler, Kas/Video Tablosu & MP4 Liste Ekranı | **Tema ve Bileşenler (Üye 6 ile ortak):** Figma olmadan doğrudan kodda `src/theme/` (renkler, boşluklar) ve ortak bileşenleri (`Button`, `Input`, `Card`, `Screen`) kurma.<br>**İçerik Tablosu ve Liste Ekranı:** Üye 3 ve Üye 2 ile 14 kas grubu `id` listesini sabitleme. Ekibin hazırlayacağı `.mp4` videolar için tablo şablonu (kas id, hareket adı, mp4 dosya adı/URL, seviye). Örnek veriyle MP4 Video Listesi kartlarını ve oynatıcı ekranını kodlama. | Ortak tema/bileşenler `develop` dalında; örnek veriyle MP4 video listesi ve oynatıcı çalışıyor. |
| **Hafta 3**<br>Supabase'ten MP4 Video Ekranı + İlk 7 Kas MP4 + Ortak Durum Ekranları | **Veritabanı & Storage Bağlantısı:** `route.params.muscleId` ile seçilen kası okuma, Üye 2'nin servis fonksiyonuyla Supabase'ten o kasın video listesini ve Storage `.mp4` URL'lerini çekip oynatma. Girişsiz modda da çalışmasını sağlama.<br>**İçerik 1 & Ortak Ekranlar:** Ön görünüşteki 7 kas grubu için ekibin hazırladığı `.mp4` videoları Supabase Storage'a yükleme ve tabloya girme. Üye 6 ile birlikte `EmptyState`, `ErrorState`, `LoadingState` bileşenlerini hazırlama. | Anatomide kasa dokununca gerçek `.mp4` videolar Supabase'den gelip oynuyor; ilk 7 kas grubu videoları yüklendi. |
| **Hafta 4**<br>Kalan 7 Kas MP4, Seviye Etiketi, Onboarding + **Üye 3'ü Test Et** | **İçerik 2 & Seviye:** Arka görünüşteki 7 kas grubunun `.mp4` videolarını yükleme ve veritabanına bağlama. Kartlara seviye rozeti (`Başlangıç`, `Orta`, `İleri`) ekleme. Üye 6 ile birlikte Onboarding ve sekmeler arası akışa destek.<br>**Çapraz Test ($3 \leftrightarrow 4$):** **Üye 3'ün** 2D Anatomi SVG, ön/arka geçiş, dokunma ve zoom özelliklerini test edip GitHub Issues'ta raporlama. | 14 kas grubunun tamamında `.mp4` videolar çalışıyor; Üye 3'ün modülü test edildi ve Issue'lar açıldı. |
| **Hafta 5**<br>Video Arama/Filtre + Karanlık Mod & İkon/Splash (Üye 6 ile) | **Arama ve Filtre:** Video listesinde istemci tarafı arama kutusu (`TextInput`) ve seviye filtreleme butonları. Türkçe büyük/küçük harf (`I/ı`, `İ/i`) uyumsuzluğu için `toLocaleLowerCase('tr-TR')` kullanımı.<br>**UI Destek:** Üye 6 ile birlikte karanlık mod renk geçişlerini ve video kartlarının kontrastını kontrol etme. Ekip için modül `README` şablonu hazırlama. | Video arama ve seviye filtresi Türkçe karakterlerle hatasız çalışıyor, `README` şablonu paylaşıldı. |
| **Hafta 6**<br>MP4 Son Kontrol (Codec/Boyut) & UI Tutarlılığı | *Not: YouTube telif/kırık link kontrolü yerine MP4 dosya kontrolü yapılır.*<br>Tüm `.mp4` videoları hem Android hem iOS'ta tek tek açıp kontrol etme (ses, görüntü, H.264 uyumu, yavaş internette açılma süresi). Çok büyük boyutlu `.mp4` dosyalarını sıkıştırıp Storage'da güncelleme. | Tüm `.mp4` videolar iki platformda da hızlı ve hatasız oynatılıyor. |
| **Hafta 7**<br>Bugfix 1: Video Oynatıcı, Liste ve UI Hataları | **Bugfix Süreci:** Video oynatılırken ekran döndürme, tam ekrandan çıkış, arka plana atınca sesin devam etmesi, Android geri tuşu ve liste kaydırma hatalarını (`fix/...` dallarıyla) düzeltme. Üye 6 ile birlikte Profil/UI bugfixlerine destek verme. | Video oynatıcı ve liste ekranlarında açık kritik hata kalmadı. |
| **Hafta 8**<br>Bugfix 2: Kullanıcı Rehberi, İçerik Dokümanı & Ana README | Son bugfixler. Ekran görüntülü kısa **Kullanıcı Rehberi** ve **MP4 İçerik Dokümanı** (yeni `.mp4` video nasıl eklenir, format/boyut standartları nedir) hazırlama. Tüm üyelerin modül dokümanlarını ana `README.md` dosyasında birleştirme ve sunumda anlatma. | Proje ana `README.md` dosyası ve kullanıcı rehberi eksiksiz hazırlandı. |

---

### 7.5 Üye 5: Takvim ve antrenman günlüğü (hareket, set, tekrar, kg); Demo ve Sunum Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 6 ($5 \leftrightarrow 6$)

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + `react-native-calendars` denemesi | **Eğitim:** Git (branch, PR, PR inceleme - çiftin Üye 6), JS (`map()`, `filter()`, `reduce()`, `Date` nesnesi), Expo kurulumu.<br>**Prototip:** `react-native-calendars` kurulumu, `Calendar` bileşeni, `onDayPress`, `markedDates`, `firstDay={1}` (Pazartesi başlangıç), `LocaleConfig` ile Türkçe ay/gün adları. `toISOString()` saat dilimi tuzağına düşmeden yerel `YYYY-MM-DD` üretme. | Deneme uygulamasında Türkçe takvim görünüyor, gün seçiliyor ve örnek günlerde nokta işareti çıkıyor. |
| **Hafta 2**<br>Takvim İskeleti + Gün Detayı ve "Hareket Ekle" Formu | **İskelet:** Üstte ay görünümü, altta seçili günün antrenman listesi. Ortak tema renklerini kullanma.<br>**Form (Yerel State):** Hareket adı, set listesi (set no, tekrar, $\text{kg}$). `keyboardType="decimal-pad"` kullanımı ve Türkçe virgül tuzağı çözümü (`replace(',', '.')` ile `62,5` $\rightarrow$ `62.5`). Boş, $0$ veya negatif değerleri reddetme. | Gün seçip hareket ve set eklenebiliyor, `62,5` gibi ondalık kilolar doğru kaydediliyor. |
| **Hafta 3**<br>Antrenman Kaydını DB'ye Yazma + Takvimde İşaretleme | **DB Kayıt:** Üye 1'in `useAuth()` hook'undan `user.id` alıp Üye 2'nin servis fonksiyonlarıyla kayıtları Supabase'e yazma ve okuma. Okurken `reduce()` ile setleri hareket başına gruplama.<br>**İşaretleme:** Görünen ayın başlangıç/bitiş tarihlerini `.gte()` ve `.lte()` ile sorgulayıp antrenmanlı günleri `markedDates` üzerinde nokta ile işaretleme (`selected` ve `marked` özelliklerini ezmeden birleştirme). | Kayıtlar Supabase'e yazılıp okunuyor, antrenman olan günlerde takvimde nokta görünüyor. |
| **Hafta 4**<br>Kaydı Düzenle/Sil, Hareket Seçici + **Üye 6'yı Test Et** | **Düzenle/Sil & Seçici:** Mevcut seti güncelleme (`update`) ve onay alarak silme (`delete`). Hareket adını serbest yazmak yerine Üye 2'nin egzersiz listesinden Modal + `FlatList` ile seçtirme.<br>**Çapraz Test ($5 \leftrightarrow 6$):** **Üye 6'nın** Profil, Tema, Navigasyon ve UI bileşenlerini test edip GitHub Issues'ta hata raporu açma. | Kayıt düzenlenip silinebiliyor, hareket listeden seçiliyor; Üye 6'nın modülü test edildi. |
| **Hafta 5**<br>Haftalık ve Aylık Özet (Toplam Set / Tekrar / Hacim) | Hafta (Pazartesi-Pazar) ve ay aralığındaki verileri çekip `reduce()` ile toplam set, toplam tekrar ve toplam hacim ($\sum (\text{tekrar} \times \text{kg})$) hesaplama. Takvim ekranında şık özet sayı kartlarıyla gösterme (kayıt yoksa `0` veya `-` gösterme, çökme önleme). | Haftalık ve aylık özet kartları doğru hesaplama yapıyor, boş günlerde hata vermiyor. |
| **Hafta 6**<br>Bağlantı Hatası Durumları (`NetInfo`) | `@react-native-community/netinfo` ile internet bağlantısını izleme. Bağlantı kesildiğinde üstte uyarı bandı gösterme, kaydet butonunu devre dışı bırakma ve hata durumunda kullanıcının formda yazdığı verileri kaybetmemesini sağlama. | Uçak modunda denendiğinde uygulama çökmüyor, uyarı veriyor ve form verisi korunuyor. |
| **Hafta 7**<br>Bugfix 1: Takvim, Tarih ve Veri Hataları | **Bugfix Süreci:** Gece yarısına yakın saatlerde tarih kayması, ay geçişleri ($31 \rightarrow 1$), son kayıt silindiğinde takvim noktasının kalkması, bir hesaptan çıkıp diğerine girince önceki kullanıcının takvim verisinin temizlenmesi ve klavyenin formu kapatması hatalarını düzeltme. | Takvim modülündeki tüm kritik ve orta seviye hatalar kapatıldı. |
| **Hafta 8**<br>Bugfix 2: Okul Final Demo ve Sunum Hazırlığı | Son bugfix kontrolleri. **Sunum Liderliği:** 10-15 dakikalık okul final sunumu senaryosunu hazırlama, her üyeye kendi modülünü anlatacağı süreyi paylaştırma, demo hesabına geçmiş haftalar için dolu antrenman verileri girme, 8-10 sayfalık sunum slaytı ve yedek ekran kaydı videosu alma, ekipçe en az 2 prova yapma. | Sunum slaytları, dolu demo hesabı, yedek video kaydı ve ekip provası tamamlandı. |

---

### 7.6 Üye 6: Profil, Tema, Navigasyon, Kas $\rightarrow$ Video ekranı; UI/Bileşen Lideri
* **Kod İnceleme ve Çapraz Test Çifti:** Üye 5 ($5 \leftrightarrow 6$)
* **Görev Eşitlemesi Notu:** Figma ve mağaza süreçleri kaldırıldığı için **Üye 6 ve Üye 4**; Tema, Ortak Bileşenler, Navigasyon, Profil ve MP4 Video Ekranı görevlerini birlikte/eşdeğer olarak yürütür.

| Hafta ve Görev | Sadece Bunları Öğrensin ve Uygulamaya Alınsın | Hafta Sonu Kontrol |
| :--- | :--- | :--- |
| **Hafta 1**<br>Ortak eğitim + Tab Navigasyon & MP4 Video Prototipi | **Eğitim:** Git (branch, PR, PR inceleme - çiftin Üye 5), JS, React, `Flexbox` ve `StyleSheet` ile ekran iskeleti kurma.<br>**Prototip (Figma Yok):** `@react-navigation/native`, `bottom-tabs` ve `native-stack` kurulumu. 3 ana sekme (Anatomi, Takvim, Profil) ve Anatomi içinde Video Stack (`navigate('Videos', { muscleId })`) yapısını kurma. Üye 4 ile birlikte `expo-video` MP4 oynatıcı prototipini deneme. | 3 sekme ve stack geçişi çalışıyor; Flexbox ile temel ekran düzenleri kurulabiliyor. |
| **Hafta 2**<br>Tema (`src/theme`), Ortak Bileşenler + Profil ve Video Arayüzü | **Tema ve Bileşenler (En Kritik Görev):** Figma kullanılmadığı için tüm ekibin ekranlarını aynı standartta yapmasını sağlayacak `src/theme/` (renk sabitleri, boşluk ölçeği, yazı boyutları) ve `src/components/` (`Button`, `Input`, `Card`, `Screen`) yapısını Üye 4 ile kurup `develop` dalına birleştirme.<br>**Profil ve Video UI:** Profil ekranı formunu (ad, soyad, yaş, kilo, boy, hedef) yerel state ve ondalık virgül desteğiyle (`62,5`) hazırlama; Üye 4 ile MP4 video listesi arayüzünü tamamlama. | Tüm ekip `develop`'tan ortak temayı ve bileşenleri çekip kullanabiliyor; Profil formu hazır. |
| **Hafta 3**<br>Profili Kaydet/Oku (Supabase) + Boş/Hata Ekranları + MP4 Video Bağlantısı | **Profil DB:** Üye 1'in `useAuth()` hook'u ve Üye 2'nin `profiles` servisiyle veriyi okuma (`.maybeSingle()`) ve kaydetme (`upsert`). Girişsiz kullanıcılar için Profil sekmesinde "Profilini görmek için giriş yap" ekranı gösterme.<br>**Ortak Durumlar & MP4:** Üye 4 ile birlikte `EmptyState`, `ErrorState`, `LoadingState` bileşenlerini, `@expo/vector-icons` sekme ikonlarını ve ilk 7 kas grubunun MP4 video entegrasyonunu tamamlama. | Profil verisi Supabase'e kaydedilip okunuyor, ortak boş/hata ekranları ve ilk 7 kas MP4 videoları çalışıyor. |
| **Hafta 4**<br>Onboarding, Sekmeler Arası Akış, Kalan MP4'ler + **Üye 5'i Test Et** | **Onboarding & Akış:** İlk açılışta gösterilen 2-3 sayfalık tanıtım ekranı (`AsyncStorage` bayrağı ve `expo-splash-screen` ile kontrol). Klavye açıldığında alt sekme çubuğunu gizleme (`tabBarHideOnKeyboard`). Üye 4 ile kalan 7 kasın MP4 videolarını tamamlama.<br>**Çapraz Test ($5 \leftrightarrow 6$):** **Üye 5'in** Takvim ve antrenman günlüğü modülünü (tarih seçimi, set/kg ekleme, silme) gerçek telefonda test edip Issue açma. | İlk açılışta onboarding çalışıyor, sekme geçişleri sorunsuz; Üye 5'in takvim modülü test edildi. |
| **Hafta 5**<br>Karanlık Mod, Erişilebilirlik, İkon/Splash + Video Arama/Filtre | **Karanlık Mod & Erişilebilirlik:** `useColorScheme` ile sistem temasını takip eden ikinci renk paletini `src/theme` içine ekleme. Tüm ekranlarda (SVG, Takvim, Video kartları, Profil) kontrastı kontrol etme. Basit, telifsiz uygulama ikonu ($1024 \times 1024$) ve splash screen hazırlayıp Üye 2'ye verme. Üye 4 ile video arama/filtre özelliğini tamamlama. | Karanlık mod tüm ekranlarda sorunsuz çalışıyor, uygulama ikonu ve splash hazır. |
| **Hafta 6**<br>Ekranlar Arası UI Tutarlılığı & MP4 Son Kontrol | *Not: Mağaza ekran görüntüleri ve mağaza metinleri okul projesi olduğu için hazırlanmaz.*<br>Figma kullanılmadığı için 6 üyenin geliştirdiği tüm ekranları yan yana açıp buton boyutları, kenar boşlukları, yazı tipleri ve hata mesajlarının görsel tutarlılığını eşitleme. Üye 4 ile birlikte MP4 videoların son cihaz kontrollerini yapma. | Uygulamadaki tüm ekranlar tek bir elden çıkmış gibi görsel olarak tutarlı. |
| **Hafta 7**<br>Bugfix 1: Profil, Tema, Navigasyon ve Video Hataları | **Bugfix Süreci:** Hesap değiştirildiğinde eski profil verisinin ekranda kalması, küçük ekranlarda form taşmaları, çentikli ekran (`SafeArea`) sorunları, karanlık modda okunmayan metinler ve Android geri tuşu hatalarını (`fix/...` dallarıyla) düzeltme. | Profil, tema ve navigasyonla ilgili açık kritik hata kalmadı. |
| **Hafta 8**<br>Bugfix 2: Ekip Retrospektifi, UI Dokümantasyonu & Teslim | Son bugfix kontrolleri. Tema ve ortak bileşenlerin kullanımını anlatan kısa dokümantasyonu ana `README`'ye ekleme. Ekip içi **Retrospektif** toplantısını yönetme (neler iyi gitti, neler öğrenildi - sunumda da kullanılacak). Okul sunumunda UI mimarisini ve Profil/Video ekranlarını anlatma. | Retrospektif tamamlandı, tüm arayüz kusursuz şekilde okul sunumuna hazır. |

# Ajan Rolü ve Kesin Kurallar (SALT OKUNUR MENTOR MODU)

Sen benim yazılım mimarisi öğretmenimsin. Temel referans kaynağın `@PROJECT_NOTES.md` dosyasıdır.

## KESİN YASAKLAR (Kırmızı Çizgiler)
1. **DOSYA DEĞİŞTİRME YASAĞI:** Hiçbir koşulda projedeki dosyaları düzenleme (`write_file`, `edit` veya `patch` araçlarını KULLANMA), yeni dosya oluşturma veya dosya silme.
2. **KOMUT ÇALIŞTIRMA YASAĞI:** Ben açıkça istemeden terminalde hiçbir derleme, paket kurma veya veritabanı komutu çalıştırma.
3. **HAZIR PROJE YAZMA YASAĞI:** Bana kopyala-yapıştır yapacağım uzun, bitmiş kod blokları verme.

## ÇALIŞMA ŞEKLİN (Öğretmen Yaklaşımı)
- Klasördeki dosyalarımı sadece OKU (`read_file`) ve analiz et.
- Bir hata, eksik veya mimari sorun gördüğünde; hatanın **hangi dosyada, hangi satırda** olduğunu ve **neden** kaynaklandığını kavramsal olarak açıkla.
- Çözümü kendin dosyaya uygulama! Bana "Şu dosyayı aç, şu satırda şu mantığı kullanarak kendin düzelt" diyerek tarif et ve küçük örneklerle mantığını öğret.
- Ben değişikliği kendi elimle yapıp "Kontrol et" dediğimde dosyayı tekrar oku, yazdığım kodu değerlendir ve geri bildirim ver.