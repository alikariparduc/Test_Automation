Feature: W_3_1_satisYapSatisiKontrolEt


  Background: System Login
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerADelioglu2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  #@Stok
  Scenario: W_3_1_satisYapSatisiKontrolEt
    And I see urun page

    # ürün lerim sayfasına giriş.
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

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
    Then I have to refresh the page


    And I wait urun arama element 1 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    # ürün sepete urun ekle

    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 1 seconds at index 1
    Then I click element: ImeiSecme at index 1

    Then I select a IMEI number from sepet randomImei at index 1
    And I wait serchtamam element 1 seconds at index 1
    Then I click element: serchtamam at index 1

    # sepetim sayfasına git.
    And I see sepet page
    And I wait Sepetim element 1 seconds at index 1
    Then I click element: Sepetim at index 1

    And I wait silverPartnerSecim element 3 seconds at index 1
    Then I click element: silverPartnerSecim at index 1

    And I press Down and Enter buttons

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1

    And I wait satisOnayTamam element 2 seconds at index 1
    Then I click element: satisOnayTamam at index 1

    # satışın başarılı olduğunu kontrol et

    Then I need to just wait

    And I see urun page

    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1

    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1

    And I enter a IMEI number to urun arama at index 1

    Then I wait urunStokdaYokSatildi element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1

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

    # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2

    #silver ile giriş yap.
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
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
    Then I click element: SurecBasarili at index 1


    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1


    #işlem bitti çıkış yap
    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2
