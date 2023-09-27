Feature: W_3_1_satisYapSatisiKontrolEt


  Background: System Login
    Given I control logout with username: "DealerZDermencioglu5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerZDermencioglu5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_3_1_satisYapSatisiKontrolEt

    And I need to just wait
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi


    # ürünlerim sayfasına giriş.
    And I see urun page
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I wait urun arama element 5 seconds at index 1
    Then I enter "8801643510619S" text to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1

    # Imei ile ürün ekle
    And I see urun page
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1
    Then I need to just wait
    And I control take in operations in database for IMEI: "RANDOM" barkod: "8801643510619S" SKU: "SA00658S" and store code: "W000700"
    #Then I have to refresh the page

    And I wait urun arama element 1 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1
    And I need to just wait

    # ürün sepete urun ekle

    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 1 seconds at index 1
    Then I click element: ImeiSecme at index 1

    Then I select a IMEI number from sepet randomImei at index 1
    And I wait serchtamam element 1 seconds at index 1
    Then I click element: serchtamam at index 1
    And I need to just wait
    And I need to just wait
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # sepetim sayfasına git.
    And I see sepet page
    And I wait satis element 1 seconds at index 1
    Then I click element: satis at index 1
    And I wait satisOlustur element 1 seconds at index 1
    Then I click element: satisOlustur at index 1

    And I wait silverPartnerSecim element 3 seconds at index 1
    Then I click element: silverPartnerSecim at index 1
    And I press Down and Enter buttons

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1
    And I wait satisOnayTamam element 2 seconds at index 1
    Then I click element: satisOnayTamam at index 1

    # satışın başarılı olduğunu kontrol et
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
    Then I click element: SurecBasarili at index 1
    #fatura işlemleri ve erp işlemlerini kontrol et
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    And I wait faturaGonderildi element 2 seconds at index 1
    And I wait faturaOlusturuldu element 2 seconds at index 1
    And I wait Geri element 1 seconds at index 1
    Then I click element: Geri at index 1

    #burada db üzerinden satışı kontrol et
    #Then I click element: SurecBasarili at index 1
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

    And I see urun page
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    Then I wait urunStokdaYokSatildi element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at deleteCount 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    #işlem bitti çıkış yap.
    And I logout the system

    #silver ile giriş yap.
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    Given I control logout with username: "R000332"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "R000332" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    And I see urun page

    # ürün lerim sayfasında ürünün geldiğinin kontrolü
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait urunlerimEkraniBasligi element 1 seconds at index 1
    And I wait urun arama element 1 seconds at index 1

    Then I enter a IMEI number to urun arama at index 1
    Then I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1


    #satisi kontrol etme
    And I see satis page
    Then I wait satis element 1 seconds at index 1
    And I click element: satis at index 1
    And I see satisListesi page
    Then I wait satislistesi element 1 seconds at index 1
    And I click element: satislistesi at index 1

    Then I click element: hamburger close at index 1

    Then I wait satisTipi element 1 seconds at index 1
    And I click element: satisTipi at index 1
    And I press Down and Enter buttons

    Then I wait satislistArama element 1 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1

    Then I click element: hamburger close at index 1

    #işlem bitti çıkış yap.
    And I logout the system