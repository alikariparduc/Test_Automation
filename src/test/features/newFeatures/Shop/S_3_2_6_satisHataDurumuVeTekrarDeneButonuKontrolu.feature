Feature: S_3_2_6_satisHataDurumuVeTekrarDeneButonuKontrolu


  Background: System Login
    Given I control logout with username: "DealerODag5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerODag5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #redis probleminden dolayı tekrar dene çalışmıyor, test fail.
  #@Stok
  Scenario: S_3_2_6_satisHataDurumuVeTekrarDeneButonuKontrolu
    # entegratör bilgilerini hatalı bir şekilde güncelle
    And I see entegrator page

    Then I wait ent BilgiGun element 5 seconds at index 1
    Then I click element: ent BilgiGun at index 1
    Then I wait ent EkraniBasligi element 2 seconds at index 1
    Then I wait ent Alandi element 2 seconds at index 1
    Then I wait ent LOGO element 2 seconds at index 1

    Then I wait ent LogoSec element 2 seconds at index 1
    And I click element: ent LogoSec at index 1
    Then I wait ent KulAdi element 2 seconds at index 1
    And I enter "10409425588" text to ent KulAdi at index 1
    Then I wait ent Sifre element 2 seconds at index 1
    And I enter "123456" text to ent Sifre at index 1

    Then I wait ent bireyselSec element 2 seconds at index 1
    And I click element: ent bireyselSec at index 1
    Then I wait ent TCKN element 2 seconds at index 1
    And I enter "22222222222" text to ent TCKN at index 1
    Then I wait ent Isim element 2 seconds at index 1
    And I enter "otomasyonHataliTestIsim" text to ent Isim at index 1
    Then I wait ent SoyIsim element 2 seconds at index 1
    And I enter "otomasyonHataliTestSoyisim" text to ent SoyIsim at index 1
    Then I wait ent VeriDairesi element 2 seconds at index 1
    And I enter "otomasyonHataliTestVergiDairesi" text to ent VeriDairesi at index 1
    Then I wait ent Mersis element 2 seconds at index 1
    And I enter "otomasyonHataliTestMersis" text to ent Mersis at index 1
    Then I wait ent SicilNo element 2 seconds at index 1
    And I enter "otomasyonHataliTestSicilNo" text to ent SicilNo at index 1

    Then I scroll to the "ent KaydetBtn"
    Then I wait ent KaydetBtn element 2 seconds at index 1
    And I click element: ent KaydetBtn at index 1
    Then I wait tamamBtn element 2 seconds at index 1
    And I click element: tamamBtn at index 1

    # dashboard'dan ürünlerim sayısını kaydet
    #And I see ozet page
    #And I wait ozet button element 1 seconds at index 1
    #And I click element: ozet button at index 1
    #And I wait ozetEkraniStoktakiUrunler element 1 seconds at index 1
    #And I  get Dashboard Stock Value ozetEkraniStoktakiUrunler

    # ürün lerim sayfasına giriş.
    And I see urun page
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    # Imei'li ürün ekle
    And I see urun page
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1
    Then I need to just wait
    And I control take in operations in database for IMEI: "RANDOM" barkod: "6941059633969" SKU: "XIA0036" and store code: "S075730"
    Then I have to refresh the page

    # dashboard'dan ürünlerim sayısını kontrol et, ve yeni sayıyı kaydet
    #And I see ozet page
    #And I wait ozet button element 1 seconds at index 1
    #And I click element: ozet button at index 1
    #Then I need to just wait
    #Then I have to refresh the page
    #And I wait ozetEkraniStoktakiUrunler element 1 seconds at index 1
    #And I verify Dashboard Value: ozetEkraniStoktakiUrunler at addCount 1
    #And I  get Dashboard Stock Value ozetEkraniStoktakiUrunler

    # eklenen ürünü faturalı sat

    And I see satis page
    Then I click element: satis at index 1
    And I wait faturaliSatis element 1 seconds at index 1
    Then I click element: faturaliSatis at index 1
    And I wait faturaliSatisArama element 1 seconds at index 1
    And I enter a IMEI number to faturaliSatisArama at index 1
    And I wait faturaliSatisEkle element 1 seconds at index 1
    Then I click element: faturaliSatisEkle at index 1

    And I wait birimFiyat element 1 seconds at index 1
    Then I enter "9999" text to birimFiyat at index 1
    Then I clear text to birimFiyat at index 1
    Then I enter "150" text to birimFiyat at index 1

    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 1 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I clear text to Nakitgirisinput at index 1
    Then I enter "150" text to Nakitgirisinput at index 1
    Then I scroll to the "NakitgirisTutar" at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    Then I scroll to the "faturaliSatistckn"
    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I enter "Fat.Şahıs.Bireysel" text to faturaliSatisLastName at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I scroll to the "faturaliSatisEMail" at index 1
    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I scroll to the "faturaliSatisStreet" at index 1
    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1

    And I wait faturaliSatisCitydown element 1 seconds at index 1
    Then I click element: faturaliSatisCitydown at index 1
    And I wait Citydown1 element 1 seconds at index 1
    Then I click element: Citydown1 at index 1
    And I wait district element 1 seconds at index 1
    Then I click element: district at index 1
    And I wait Citydown1 element 1 seconds at index 1
    Then I click element: Citydown1 at index 1

    And I wait faturaliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I need to just wait
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1

    # satışın hatalı olduğunu kontrol et
    And I see satisListesi page
    Then I wait satislistesi element 1 seconds at index 1
    And I click element: satislistesi at index 1

    Then I click element: hamburger close at index 1

    And I wait satislistArama element 2 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecHatali element 5 seconds at index 1

    #burada db üzerinden satışın hatalı olduğunu kontrol et
    #Then I click element: SurecHatali at index 1
    #And I wait Incele element 1 seconds at index 1
    #Then I click element: Incele at index 1
    #And I need to just wait
    #And I save fatura bilgileri into variables
    #And I save fatura name from faturaDetay element at index 1
    #And I control vdm to silver sale operations in database for IMEI: "RANDOM" barkod: "190198044167" SKU: "IPH0175" and store code: "W001000-01"
    #And I wait Geri element 1 seconds at index 1
    #Then I click element: Geri at index 1

    Then I click element: hamburger close at index 1


    # ürünlerin satılmadığını ve kullanılabildiklerini ürünlerim ve dashboard ekranlarından kontrol et

      # ürünlerim ekranından ürünün geldiğini kontrol
    And I see urun page
    Then I wait urun button element 2 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1

    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1

    And I enter a IMEI number to urun arama at index 1

    Then I wait serch1 element 2 seconds at index 1
    And I click element: serch1 at index 1

     # dashboard'dan ürünlerim sayısını kontrol et
    #Then I need to just wait
    #And I have to refresh the page
    #And I see ozet page
    #And I wait ozet button element 1 seconds at index 1
    #And I click element: ozet button at index 1
    #And I wait ozetEkraniStoktakiUrunler element 1 seconds at index 1
    #And I verify Dashboard Value: ozetEkraniStoktakiUrunler at addCount 0

    # entegratör bilgilerini doğru bir şekilde güncelle
    And I see entegrator page

    Then I wait ent BilgiGun element 5 seconds at index 1
    Then I click element: ent BilgiGun at index 1
    Then I wait ent EkraniBasligi element 2 seconds at index 1
    Then I wait ent Alandi element 2 seconds at index 1
    Then I wait ent LOGO element 2 seconds at index 1

    Then I wait ent LogoSec element 2 seconds at index 1
    And I click element: ent LogoSec at index 1
    Then I wait ent KulAdi element 2 seconds at index 1
    And I enter "10409425588" text to ent KulAdi at index 1
    Then I wait ent Sifre element 2 seconds at index 1
    And I enter "123456" text to ent Sifre at index 1

    Then I wait ent bireyselSec element 2 seconds at index 1
    And I click element: ent bireyselSec at index 1
    Then I wait ent TCKN element 2 seconds at index 1
    And I enter "10409425588" text to ent TCKN at index 1
    Then I wait ent Isim element 2 seconds at index 1
    And I enter "otomasyonTestIsim" text to ent Isim at index 1
    Then I wait ent SoyIsim element 2 seconds at index 1
    And I enter "otomasyonTestSoyisim" text to ent SoyIsim at index 1
    Then I wait ent VeriDairesi element 2 seconds at index 1
    And I enter "otomasyonTestVergiDairesi" text to ent VeriDairesi at index 1
    Then I wait ent Mersis element 2 seconds at index 1
    And I enter "otomasyonTestMersis" text to ent Mersis at index 1
    Then I wait ent SicilNo element 2 seconds at index 1
    And I enter "otomasyonTestSicilNo" text to ent SicilNo at index 1

    Then I scroll to the "ent KaydetBtn"
    Then I wait ent KaydetBtn element 2 seconds at index 1
    And I click element: ent KaydetBtn at index 1
    Then I wait tamamBtn element 2 seconds at index 1
    And I click element: tamamBtn at index 1

    # satış listesi ekranından hatalı olan satış için tekrar dene'ye bas
    And I see satis page
    Then I wait satis element 1 seconds at index 1
    And I click element: satis at index 1
    And I see satisListesi page
    Then I wait satislistesi element 1 seconds at index 1
    And I click element: satislistesi at index 1
        #database'in güncel halinin (entegratör bilgisi için) çekilebilmesi  bir süre beklemek gerekiyor
    #And I need to just wait
    #And I need to just wait
    #And I need to just wait
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
        #database'in güncel halinin (entegratör bilgisi için) çekilebilmesi için bir süre beklemek gerekiyor

    Then I click element: hamburger close at index 1

    And I wait satislistArama element 2 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecHatali element 5 seconds at index 1
    And I click element: SurecHatali at index 1
    And I wait tekrarDene element 5 seconds at index 1
    And I click element: tekrarDene at index 1
    Then I wait tamamBtn element 2 seconds at index 1
    And I click element: tamamBtn at index 1

    # satışın başarılı olduğunu db'den kontrol et

    # satışın başarılı olduğunu ön yüzden kontrol et
     # satış listesinden kontrol
    And I see satisListesi page
    Then I wait satislistesi element 1 seconds at index 1
    And I click element: satislistesi at index 1

    Then I click element: hamburger close at index 1

    And I wait satislistArama element 2 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    And I click element: SurecBasarili at index 1

     #ürünlerim ekranından kontrol
    And I see urun page

    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    Then I wait urunStokdaYokSatildi element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1

     # dashboard'dan ürünlerim sayısını kontrol
    Then I need to just wait
    And I have to refresh the page
    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniStoktakiUrunler element 1 seconds at index 1
    #And I verify Dashboard Value: ozetEkraniStoktakiUrunler at addCount -1
    #And I  get Dashboard Stock Value ozetEkraniStoktakiUrunler

        #işlem bitti çıkış yap.
    And I logout the system
