Feature: S_3_3_1_KampanyaliSatis


  Background: System Login
    Given I control logout with username: "DealerFToker2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerFToker2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: S_3_3_1_KampanyaliSatis
    And I see urun page

      #Login sonrası DashBorad da Satislarim kontolü

   # And I wait SatislerimAdeti element 1 seconds at index 1
   # And I  get Dashboard Stock Value SatislerimAdeti

     #yeni ürün ekle

    And I see satis page
    Then I click element: satis at index 1
    And I wait kampanyaliSatis element 1 seconds at index 1
    Then I click element: kampanyaliSatis at index 1
    Then I click element: hamburger close at index 1
    And I wait kampanyaliSatisAramaAlani element 1 seconds at index 1
    Then I enter "357698319800809" text to kampanyaliSatisAramaAlani at index 1
    Then I click element: kampanyaliSatisARA at index 1
    And I wait kampanyaliSatisFaturaOlustur element 1 seconds at index 1
    Then I click element: kampanyaliSatisFaturaOlustur at index 1
    Then I scroll to the "district" at index 1
    Then I click element: faturaliSatisCitydown at index 1
    Then I click element: kampanyaliSatisCity at index 1
    Then I click element: district at index 1
    Then I click element: kampanyaliSatisDistrict at index 1
    And I wait kampanyaliSatisFaturaOlustur element 1 seconds at index 1
    Then I click element: kampanyaliSatisFaturaOlustur at index 1
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1

    Then I need to just wait


    # FATURALI SATIŞ ONAYI

    Then I see satisListesi page

    Then I need to just wait

    And I wait satislistArama element 1 seconds at index 1
    Then I enter "357698319800809" text to satislistArama at index 1

    Then I need to just wait

    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait Incele element 1 seconds at index 1
    Then I click element: Incele at index 1

# Fatura detay inceleme

    Then I verify the area Kdv20 by read only at index 1

    And I see satisListesi page

    And I wait Geri element 1 seconds at index 1
    Then I click element: Geri at index 1

    # Surec basarili mi ?

 And I wait SurecBasarili element 60 seconds at index 1
    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    And I see urun page

    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1
    And I wait urun arama element 1 seconds at index 1
    Then I enter "357698319800809" text to urun arama at index 1
    And I wait urun Stokda Yok element 1 seconds at index 1
    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    And I see satis page

    Then I click element: satis at index 1

   # And I see ozet page

   # And I wait ozet button element 1 seconds at index 1
   # Then I click element: ozet button at index 1
   # And I wait ozetEkraniUrunlerim element 1 seconds at index 1

   # And I see urun page

   # And I wait SatislerimAdeti element 1 seconds at index 1
   # And I verify Dashboard Value: SatislerimAdeti at addCount 1

    And I see satis page

    Then I click element: satis at index 1

    And I see satisListesi page

    And I wait satislistesi element 1 seconds at index 1
    Then I click element: satislistesi at index 1
    And I wait satislistArama element 1 seconds at index 1
    Then I enter "357698319800809" text to satislistArama at index 1
    And I wait satislistAramaBtn element 1 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait faturaIptal element 1 seconds at index 1
    Then I click element: faturaIptal at index 1
    And I wait faturaIptalTamam element 1 seconds at index 1
    Then I click element: faturaIptalTamam at index 1

        #işlem bitti çıkış yap.
    And I logout the system