Feature: W_3_6_satisHataDurumuSonrasiKontrolu


  Background: System Login
    Given I control logout with username: "DealerVSari"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerVSari" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_3_6_satisHataDurumuSonrasiKontrolu
    # entegratör bilgilerini hatalı bir şekilde güncelle
    And I see entegrator page

    Then I wait ent BilgiGun element 5 seconds at index 1
    Then I click element: ent BilgiGun at index 1
    Then I wait ent EkraniBasligi element 2 seconds at index 1
    Then I wait ent Alandi element 2 seconds at index 1
    Then I wait ent LOGO element 2 seconds at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 1
    #And I click element: entegrator radio buttons at index 1
    Then I wait ent KulAdi element 2 seconds at index 1
    And I clear text to ent KulAdi at index 1
    And I enter "0076308592" text to ent KulAdi at index 1

    Then I wait ent Sifre element 2 seconds at index 1
    And I clear text to ent Sifre at index 1
    And I enter "123abc" text to ent Sifre at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 2
    #And I click element: entegrator radio buttons at index 2
    Then I wait ent VkNo element 2 seconds at index 1
    And I clear text to ent VkNo at index 1
    And I enter "1111111111" text to ent VkNo at index 1

    Then I wait ent UNVAN element 2 seconds at index 1
    And I clear text to ent UNVAN at index 1
    And I enter "otomasyonHataliTestUnvan" text to ent UNVAN at index 1

    Then I wait ent VeriDairesi element 2 seconds at index 1
    And I clear text to ent VeriDairesi at index 1
    And I enter "otomasyonHataliTestVergiDairesi" text to ent VeriDairesi at index 1

    Then I wait ent Mersis element 2 seconds at index 1
    And I clear text to ent Mersis at index 1
    And I enter "otomasyonHataliTestMersis" text to ent Mersis at index 1

    Then I wait ent SicilNo element 2 seconds at index 1
    Then I scroll to the "ent SicilNo"
    And I clear text to ent SicilNo at index 1
    And I enter "otomasyonHataliTestSicilNo" text to ent SicilNo at index 1

    Then I wait ent KaydetBtn element 2 seconds at index 1
    Then I scroll to the "ent KaydetBtn"
    And I click element: ent KaydetBtn at index 1
    Then I wait tamamBtn element 2 seconds at index 1
    And I click element: tamamBtn at index 1

    # ürün lerim sayfasına giriş.
    And I see urun page
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I wait urun arama element 5 seconds at index 1
    Then I enter "6934177761201" text to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1

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
    And I control take in operations in database for IMEI: "RANDOM" barkod: "6934177761201" SKU: "XIA0214" and store code: "W314100"

    #ürünü sepete ekle
    Then I wait urun arama element 5 seconds at index 1
    Then I enter "6934177761201" text to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1
    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 1 seconds at index 1
    Then I click element: ImeiSecme at index 1
    Then I select a IMEI number from sepet randomImei at index 1
    And I wait serchtamam element 1 seconds at index 1
    Then I click element: serchtamam at index 1

    # sepetim sayfasına git ve satışı tamamla
    And I see sepet page
    And I wait satis element 3 seconds at index 1
    Then I click element: satis at index 1
    And I wait satisOlustur element 3 seconds at index 1
    Then I click element: satisOlustur at index 1

    And I wait silverPartnerSecim element 5 seconds at index 1
    Then I click element: silverPartnerSecim at index 1

    And I press Down and Enter buttons

    And I wait satisiTamamlaBtn element 5 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1

    And I wait satisOnayTamam element 5 seconds at index 1
    Then I click element: satisOnayTamam at index 1

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
    Then I click element: SurecHatali at index 1
    #fatura işlemleri ve erp işlemlerini kontrol et
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    And I wait faturaEntegratoreGonderilirkenHataOlustu element 2 seconds at index 1
    And I wait faturaTamamlanamadiERPServiseGonderilemedi element 2 seconds at index 1
    And I wait Geri element 1 seconds at index 1
    Then I click element: Geri at index 1

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

    Then I need to just wait
    Then I click element: hamburger close at index 1

      # ürünlerim ekranından ürünün geldiğini kontrol
    And I see urun page
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1
    #---Burada akış değişti vdm hatalı bile satsa ürünün silvera geçmesi gerekiyor.
    #And I enter a IMEI number to urun arama at index 1
    #Then I wait serch1 element 2 seconds at index 1
    #And I click element: serch1 at index 1
    #----------------------------------------------------------------------------
    And I enter a IMEI number to urun arama at index 1
    Then I wait urunStokdaYokSatildi element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1

    #entegratör bilgilerini doğru bir şekilde güncelle
    And I see entegrator page

    Then I wait ent BilgiGun element 5 seconds at index 1
    Then I click element: ent BilgiGun at index 1
    Then I wait ent EkraniBasligi element 2 seconds at index 1
    Then I wait ent Alandi element 2 seconds at index 1
    Then I wait ent LOGO element 2 seconds at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 1
    #And I click element: entegrator radio buttons at index 1
    Then I wait ent KulAdi element 2 seconds at index 1
    And I clear text to ent KulAdi at index 1
    And I enter "0076308592" text to ent KulAdi at index 1

    Then I wait ent Sifre element 2 seconds at index 1
    And I clear text to ent Sifre at index 1
    And I enter "123abc" text to ent Sifre at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 2
    #And I click element: entegrator radio buttons at index 2
    Then I wait ent VkNo element 2 seconds at index 1
    And I clear text to ent VkNo at index 1
    And I enter "0076308592" text to ent VkNo at index 1

    Then I wait ent UNVAN element 2 seconds at index 1
    And I clear text to ent UNVAN at index 1
    And I enter "otomasyonTestUnvan" text to ent UNVAN at index 1

    Then I wait ent VeriDairesi element 2 seconds at index 1
    And I clear text to ent VeriDairesi at index 1
    And I enter "otomasyonTestVergiDairesi" text to ent VeriDairesi at index 1

    Then I wait ent Mersis element 2 seconds at index 1
    And I clear text to ent Mersis at index 1
    And I enter "otomasyonTestMersis" text to ent Mersis at index 1

    Then I wait ent SicilNo element 2 seconds at index 1
    Then I scroll to the "ent SicilNo"
    And I clear text to ent SicilNo at index 1
    And I enter "otomasyonTestSicilNo" text to ent SicilNo at index 1

    Then I wait ent KaydetBtn element 2 seconds at index 1
    Then I scroll to the "ent KaydetBtn"
    And I click element: ent KaydetBtn at index 1
    Then I wait tamamBtn element 2 seconds at index 1
    And I click element: tamamBtn at index 1

    # işlem bitti çıkış yap.
    And I logout the system