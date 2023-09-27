Feature: S_3_2_1_faturali_satis Takipsiz(Bireysel)


  Background: System Login
    Given I control logout with username: "DealerSHezer"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerSHezer" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: S_3_2_1_faturali_satis Takipsiz(Bireysel)
    And I see urun page

      #ürünü sat

    And I see satis page
    Then I click element: satis at index 1
    And I wait faturaliSatis element 1 seconds at index 1
    Then I click element: faturaliSatis at index 1
    Then I click element: hamburger close at index 1
    And I wait faturaliSatisArama element 1 seconds at index 1
    Then I enter "8681900408008" text to faturaliSatisArama at index 1
    Then I click element: faturaliSatisEkle at index 1
    And I wait birimFiyat element 1 seconds at index 1
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
   # Then I verify the area eksiktutar by read only at index 1

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
    Then I scroll to the "faturaliSatistckn" at index 1
    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1
    #Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I enter random text to faturaliSatisFirstName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Takipsiz ürün" text to faturaliSatisLastName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1

    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    #Then I verify the area eksikAlanKntrol by read only at index 1
    And I wait eksikAlanKntrol element 3 seconds at index 1
    Then I click element: eksikAlanKntrolclose at index 1

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

       # FATURALI SATIŞ ONAYI

    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1

    Then I see satisListesi page

    Then I need to just wait
    Then I need to just wait

    And I wait satislistArama element 1 seconds at index 1

    Then I need to just wait
    Then I need to just wait

    #Then I enter "8681900408008" text to satislistArama at index 1
    Then I enter random text to cariBilgiler at index 1

    Then I need to just wait
    Then I need to just wait

    #And I wait satislistAramaBtn element 1 seconds at index 1
    #Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1

# Fatura detay inceleme
    Then I verify the area ucret125_00 by read only at index 1
    Then I verify the area Kdv20 by read only at index 1
    Then I verify the area KdvTutar by read only at index 1

    And I see satisListesi page

    Then I scroll to the "TCKN" at index 1
    Then I verify the area TCno by read only at index 1
    Then I verify the area GSMkontorl by read only at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    And I wait faturaGonderildi element 2 seconds at index 1
    And I wait faturaOlusturuldu element 2 seconds at index 1
    And I wait erpServiseGonderilecek element 2 seconds at index 1
    And I wait erpServiseGonderildi element 2 seconds at index 1
    And I wait erpServiseKaydedildi element 2 seconds at index 1
    And I see satisListesi page
    And I wait Geri element 5 seconds at index 1
    Then I click element: Geri at index 1

    # Surec basarili mi ?

    And I wait SurecBasarili element 60 seconds at index 1
    And I wait belgeTipi element 5 seconds at index 1
    Then I click element: belgeTipi at index 1

    Then I click element: hamburger close at index 1

        #işlem bitti çıkış yap.
    And I logout the system