Feature: S_1_9_dashboard_urunTransfer_Gelme_Kontolu

  Background: System Login
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page


  @Stok
  Scenario Outline: S_1_9_1 Test edilen usera transfer et.
    Given I control logout with username: "<username>"
    Then I enter "<username>" text to username text area at index 1
    #DealerBKocak11
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    # yeni ürün eklemeden kontrol et. sonra yeni değeri al aşağıda kontrol et.

     #yeni ürün ekle

    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "6901443292844S" text to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 10 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 10 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 5 seconds at index 1
    Then I click element: Ekle at index 1
    And I need to just wait
    Then I wait urun button element 6 seconds at index 1
    And I click element: urun button at index 1

    #eklenen ürünü Transfer Et

    And I see transfer page
    Then I click element: transfer button at index 1
    And I wait transferOlustur button element 10 seconds at index 1
    Then I click element: transferOlustur button at index 1
    Then I click element: hamburger close at index 1
    And I wait transferOlusturAramaAlani element 10 seconds at index 1

    And I enter a IMEI number to transferOlusturAramaAlani at index 1
    And I wait transferOlusturEkle element 10 seconds at index 1
    Then I click element: transferOlusturEkle at index 1

    # Transfer edilen mağza seç

    And I wait transferOlusturTransferEdilenMagza element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza at index 1
    And I wait transferOlusturTransferEdilenMagza1 element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza1 at index 1
    And I wait transferOlusturGonder element 10 seconds at index 1
    Then I click element: transferOlusturGonder at index 1
    And I wait transferOlusturOperasyonBasarili element 10 seconds at index 1
    Then I click element: transferOlusturBasariliClose at index 1


    And I wait transferListesiAramaAlani element 10 seconds at index 1

    And I wait ShoptransferEdenMagzaCode element 3 seconds at index 1
    Then I click element: ShoptransferEdenMagzaCode at index 1
    And I wait ShoptransferEdilenMagzaCode element 3 seconds at index 1
    Then I click element: ShoptransferEdilenMagzaCode at index 1
    And I wait Tumu element 3 seconds at index 1
    Then I click element: Tumu at index 1
    And I wait ShoptransferEdenMagzaCodeSecenek element 3 seconds at index 1
    Then I click element: ShoptransferEdenMagzaCodeSecenek at index 1

    And I enter a IMEI number to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1

    # Surec basarili mi ?
    And I wait transferOnayBekliyor element 10 seconds at index 1
    And I save transfer dokuman numarasi from transferDokumanNumarasi element at index 1
    And I control create transfer operations in database
    Then I click element: hamburger close at index 1
    Then I click element: transfer button at index 1

    And I see ozet page

    And I wait ozet button element 10 seconds at index 1
    Then I click element: ozet button at index 1

     # And I wait faturaIptalTamam element 5 seconds at index 1
     # Then I click element: faturaIptalTamam at index 1

 #silinen urunu kontrol et

    And I see urun page

    And I wait urun button element 10 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 10 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 10 seconds at index 1
    Then I click element: hamburger close at index 1
    And I wait urun arama element 10 seconds at index 1
    And I enter a IMEI number to urun arama at index 1

    And I see transfer page

    And I wait transferEdilmeyiBekliyor element 10 seconds at index 1
    Then I click element: transferOlusturBasariliClose at index 1

    And I see urun page

    And I wait hamburger close element 10 seconds at index 1
    Then I click element: hamburger close at index 1


      #işlem bitti çıkış yap.
    And I logout the system

    Examples:
      | username     |
      | DealerSHezer |

  @Stok
  Scenario Outline: S_1_9_2 Test edilen userda transferi kabul et
    Given I control logout with username: "<username>"
    Then I enter "<username>" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

   # And I see ozet page

    And I see ozet page
    And  I wait onayimiBekleyenTransferlerLink element 10 seconds at index 1
    When I click element: onayimiBekleyenTransferlerLink at index 1

    And I see transfer page
    And I wait transferListesiAramaAlani element 10 seconds at index 1
    And I enter a IMEI number fromGlobal to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1
    And I need to just wait
    And I wait transferOnayBekliyor element 10 seconds at index 2
    Then I click element: transferOnayBekliyor at index 2

    And I save transfer dokuman numarasi from transferDokumanNumarasi element at index 1

    And I wait transferOnaylaBtn element 10 seconds at index 1
    Then I click element: transferOnaylaBtn at index 1

    And I need to just wait
    And I control accept transfer operations in database

    And I see urun page

    And I wait urun button element 10 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 10 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 10 seconds at index 1
    Then I click element: hamburger close at index 1
    And I wait urun arama element 10 seconds at index 1
    And I enter a IMEI number fromGlobal to urun arama at index 1
    And I wait serch1 element 10 seconds at index 1
    Then I click element: serch1 at index 1
    Then I click element: hamburger close at index 1

    And I see ozet page


    Examples:
      | username       |
      | DealerBKocak11 |