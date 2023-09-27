Feature: R_3_2_3_faturali_satis Takipli(Bireysel)


  Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

 #@Stok
  Scenario: R_3_2_3_faturali_satis Takipli(Bireysel)
    And I see urun page

      #Login sonrası DashBorad da Satislarim kontolü

    #And I wait SatislerimAdeti element 1 seconds at index 1
    #And I  get Dashboard Stock Value SatislerimAdeti


     #yeni ürün ekle

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

    #And I have to refresh the page

    #Then I wait urun button element 3 seconds at index 1
    #And I click element: urun button at index 1


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

    Then I scroll to the "HuaweiP30" at index 1

    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1


    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Fat.Bireysel.Takipli" text to faturaliSatisLastName at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1

    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1


    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1


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

    Then I need to just wait

    Then I see satisListesi page

    Then I need to just wait

    And I wait satislistArama element 1 seconds at index 1

    And I enter a IMEI number to satislistArama at index 1

    Then I need to just wait

    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1

    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1


    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1

# Fatura detay inceleme
    Then I verify the area ucret125_00 by read only at index 1
    Then I verify the area Kdv20 by read only at index 1
    Then I verify the area KdvTutar by read only at index 1

    And I see urun page

    Then I verify the area HuaweiP30 by read only at index 1

    And I see satis page


    And I see satisListesi page

    Then I scroll to the "TCKN" at index 1

    Then I verify the area TCno by read only at index 1

    Then I verify the area GSMkontorl by read only at index 1


    And I wait Geri element 1 seconds at index 1
    Then I click element: Geri at index 1

    # Surec basarili mi ?


    #Then I have to refresh the page
    And I wait SurecBasarili element 60 seconds at index 1


    And I wait belgeTipi element 1 seconds at index 1
    Then I click element: belgeTipi at index 1





    # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2