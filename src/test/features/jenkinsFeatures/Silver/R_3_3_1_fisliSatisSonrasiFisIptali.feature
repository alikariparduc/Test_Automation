Feature: R_3_3_1_fisliSatisSonrasiFisIptali


  Background: System Login
    Given I control logout with username: "R000877"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "R000877" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: R_3_3_1_fisliSatisSonrasiFisIptali
    And I see urun page
    Then I wait urun button element 3 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 3 seconds at index 1
    And I click element: urunlerim button at index 1
    
    And I generate an IMEI list with count: 3
    
    Then I enter "8801643873066D" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 1. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    Then I enter "8801643873066D" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 2. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    Then I enter "6972453161260" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 3. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    Then I enter "8681900414184" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait eklenecekUrunAdedi element 1 seconds at index 1
    Then I click element: eklenecekUrunAdedi at index 1
    And I enter "2" text to eklenecekUrunAdedi at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    Then I wait urun button element 3 seconds at index 1
    And I click element: urun button at index 1


    # Ürünlerin fişli satışını gerçekleştir.

    And I see satis page
    Then I click element: satis at index 1
    And I wait fisliSatis element 1 seconds at index 1
    Then I click element: fisliSatis at index 1
    Then I click element: hamburger close at index 1

    And I wait fisliSatisArama element 1 seconds at index 1
    And I enter 1. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I clear text to fisliSatisArama at index 1
    And I enter 2. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I clear text to fisliSatisArama at index 1
    And I enter 3. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I clear text to fisliSatisArama at index 1
    And I enter "8681900414184" text to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I scroll to the "birimFiyat" at index 1
    And I wait birimFiyat element 3 seconds at index 1
    And I clear text to birimFiyat at index 1
    Then I enter "300" text to birimFiyat at index 1

    And I scroll to the "birimFiyat" at index 2
    And I wait birimFiyat element 3 seconds at index 2
    And I click element: birimFiyat at index 2
    And I clear text to birimFiyat at index 2
    Then I enter "250" text to birimFiyat at index 2

    And I scroll to the "birimFiyat" at index 3
    And I wait birimFiyat element 3 seconds at index 3
    And I click element: birimFiyat at index 3
    And I clear text to birimFiyat at index 3
    Then I enter "250" text to birimFiyat at index 3

    #And I wait birimFiyat element 1 seconds at index 4
    #Then I clear text to birimFiyat at index 4
    #Then I enter "2" text to birimFiyat at index 5

    And I scroll to the "birimFiyat" at index 4
    And I wait birimFiyat element 3 seconds at index 4
    And I click element: birimFiyat at index 4
    And I clear text to birimFiyat at index 4
    Then I enter "100" text to birimFiyat at index 4

    Then I scroll to the "fisliSatisNakitButon" at index 1
    And I wait fisliSatisNakitButon element 1 seconds at index 1
    Then I click element: fisliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I enter "900" text to Nakitgirisinput at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    Then I scroll to the "fisliSatistckn" at index 1
    Then I enter "33212312342" text to fisliSatistckn at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Fişli birdenFazlaImeiVeImeisiz" text to faturaliSatisLastName at index 1
   # Then I click element: fisliSatisSatisTamamla at index 1
   # Then I verify the area eksikAlanKntrol by read only at index 1
   # Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1

    And I wait faturaliSatisCitydown element 1 seconds at index 1
    Then I click element: faturaliSatisCitydown at index 1
    And I wait Citydown1 element 1 seconds at index 1
    Then I click element: Citydown1 at index 1
    And I wait district element 1 seconds at index 1
    Then I click element: district at index 1
    And I wait Citydown1 element 1 seconds at index 1
    Then I click element: Citydown1 at index 1

     # FİŞLİ SATIŞ TAMAMLAMA

    And I wait fisliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1

    # FİŞLİ SATIŞ ONAYI


    Then I need to just wait
    Then I see satisListesi page
    Then I need to just wait
    And I wait satislistArama element 1 seconds at index 1
    And I enter 1. IMEI number from generated IMEI list to satislistArama at index 1
    Then I need to just wait

    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait belgeTipiFisli element 1 seconds at index 1
    Then I click element: belgeTipiFisli at index 1

    # Fatura detay inceleme
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1

    And I see urun page
    And I see satis page
    And I see satisListesi page
    Then I scroll to the "TCKN" at index 1
    Then I verify the area TCno by read only at index 1
    Then I verify the area GSMkontorl by read only at index 1
    And I see fatura page
    And I wait fisOlusturuldu element 2 seconds at index 1
    And I see satisListesi page
    And I wait Geri element 1 seconds at index 1
    Then I click element: Geri at index 1
    Then I click element: hamburger close at index 1

    # satılan ürünlerin stokta olmadığını kontrol et.

    And I see urun page
    Then I wait urun button element 3 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 3 seconds at index 1
    And I click element: urunlerim button at index 1

    And I enter 1. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 1 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 2. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 1 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 1 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    Then I wait urun button element 3 seconds at index 1
    And I click element: urun button at index 1

    # Satış listesinden fişli satışı iptal et
    Then I see satisListesi page
    And I wait satislistesi element 1 seconds at index 1
    Then I click element: satislistesi at index 1
    And I wait satislistArama element 1 seconds at index 1
    And I enter 1. IMEI number from generated IMEI list to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait belgeTipiFisli element 1 seconds at index 1
    Then I click element: belgeTipiFisli at index 1
    And I wait faturaIptalEt element 1 seconds at index 1
    Then I click element: faturaIptalEt at index 1
    And I wait Tamam element 1 seconds at index 1
    Then I click element: Tamam at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait BasariliIptal element 1 seconds at index 1
    Then I click element: BasariliIptal at index 1
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait fisOlusturuldu element 2 seconds at index 1
    And I wait iptalSureciBasladi element 2 seconds at index 1
    And I wait fisliSatisIptalEdildiUrunlerEnvantereAlindi element 2 seconds at index 1
    And I see satisListesi page

    # urunlerim ekranına git ve stoğa geri geldiğini konrol et.
    And I see urun page

    Then I wait urun button element 2 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1
    And I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    #işlem bitti çıkış yap.
    And I logout the system