Feature: R_3_2_6_hataliFaturaliSatisSonrasiBasariliSatis


  Background: System Login
    Given I control logout with username: "DealerCSan2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerCSan2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: R_3_2_6_hataliFaturaliSatisSonrasiBasariliSatis
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

    #urun ekle
    And I see urun page
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1

    Then I enter "6901443292844S" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    #eklenen ürünü sat

    And I see satis page
    Then I click element: satis at index 1
    And I wait faturaliSatis element 1 seconds at index 1
    Then I click element: faturaliSatis at index 1

    Then I click element: hamburger close at index 1

    And I wait faturaliSatisArama element 1 seconds at index 1
    And I enter a IMEI number to faturaliSatisArama at index 1
    And I wait faturaliSatisEkle element 1 seconds at index 1
    Then I click element: faturaliSatisEkle at index 1
    Then I verify the area HuaweiP30 by read only at index 1
    And I wait birimFiyat element 1 seconds at index 1
    Then I enter "9999" text to birimFiyat at index 1
    Then I clear text to birimFiyat at index 1
    Then I enter "150" text to birimFiyat at index 1
    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 1 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I enter "50" text to Nakitgirisinput at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1
    And I wait faturaliSatisSatisTamamla element 1 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    And I wait eksiktutar element 1 seconds at index 1
    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 1 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I clear text to Nakitgirisinput at index 1
    Then I enter "150" text to Nakitgirisinput at index 1
    Then I scroll to the "NakitgirisTutar" at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    And I wait faturaliSatisSatisTamamla element 1 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    And I wait eksikAlanKntrol element 1 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "HuaweiP30" at index 1

    And I wait faturaliSatisBireysel element 1 seconds at index 1
    Then I click element: faturaliSatisBireysel at index 1
    And I wait faturaliSatisSahis element 1 seconds at index 1
    Then I click element: faturaliSatisSahis at index 1

    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Fat.Şahıs.Şir.Takipli" text to faturaliSatisLastName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1
    Then I scroll to the "faturaliSatisVergiD" at index 1
    Then I enter "0076308592" text to faturaliSatisVergiD at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisEMail" at index 1
    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisStreet" at index 1
    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
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

    # FATURALI SATIŞ TAMAMLAMA

    And I wait faturaliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I need to just wait
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1
    Then I need to just wait

    #satışın hatalı olduğunu gör
    Then I see satisListesi page
    Then I need to just wait
    And I wait satislistArama element 1 seconds at index 1
    And I enter a IMEI number to satislistArama at index 1
    Then I need to just wait
    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecHatali element 1 seconds at index 1
    Then I click element: SurecHatali at index 1

    Then I click element: hamburger close at index 1
    And I see satis page
    Then I click element: satis at index 1


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

    #eklenen ürünü tekrar sat

    And I see satis page
    Then I click element: satis at index 1
    And I wait faturaliSatis element 1 seconds at index 1
    Then I click element: faturaliSatis at index 1

    Then I click element: hamburger close at index 1

    And I wait faturaliSatisArama element 1 seconds at index 1
    And I enter a IMEI number to faturaliSatisArama at index 1
    And I wait faturaliSatisEkle element 1 seconds at index 1
    Then I click element: faturaliSatisEkle at index 1
    Then I verify the area HuaweiP30 by read only at index 1
    And I wait birimFiyat element 1 seconds at index 1
    Then I enter "9999" text to birimFiyat at index 1
    Then I clear text to birimFiyat at index 1
    Then I enter "150" text to birimFiyat at index 1
    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 1 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I enter "50" text to Nakitgirisinput at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1
    And I wait faturaliSatisSatisTamamla element 1 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    And I wait eksiktutar element 1 seconds at index 1
    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 1 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 1 seconds at index 1
    Then I clear text to Nakitgirisinput at index 1
    Then I enter "150" text to Nakitgirisinput at index 1
    Then I scroll to the "NakitgirisTutar" at index 1
    And I wait NakitgirisTutar element 1 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    And I wait faturaliSatisSatisTamamla element 1 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    And I wait eksikAlanKntrol element 1 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "HuaweiP30" at index 1

    And I wait faturaliSatisBireysel element 1 seconds at index 1
    Then I click element: faturaliSatisBireysel at index 1
    And I wait faturaliSatisSahis element 1 seconds at index 1
    Then I click element: faturaliSatisSahis at index 1

    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Fat.Şahıs.Şir.Takipli" text to faturaliSatisLastName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1
    Then I scroll to the "faturaliSatisVergiD" at index 1
    Then I enter "0076308592" text to faturaliSatisVergiD at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisEMail" at index 1
    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisStreet" at index 1
    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
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

    # FATURALI SATIŞ TAMAMLAMA

    And I wait faturaliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I need to just wait
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1
    Then I need to just wait

    #satışın başarılı olduğunu gör
    Then I see satisListesi page
    Then I need to just wait
    And I wait satislistArama element 1 seconds at index 1
    And I enter a IMEI number to satislistArama at index 1

    Then I need to just wait
    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1

    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1

    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    #Ürünün stoktan çıktığını gör
    And I see urun page
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait urun arama element 1 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait urun Stokda Yok element 1 seconds at index 1

    #işlem bitti çıkış yap.
    And I logout the system