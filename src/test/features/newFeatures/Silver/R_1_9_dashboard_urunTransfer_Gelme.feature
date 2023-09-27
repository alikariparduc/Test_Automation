Feature: R_1_9_dashboard_urunTransfer_Gelme_Kontolu

  Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page

   # @Stok-özet ekranında transfer yok
  Scenario Outline: R_1_9_dashboard_urunTransfer_Gelme onay bekleyen sayıyı al.

    Then I enter "<username>" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    And I see ozet page

     #Login sonrası DashBorad da Onay bekleyen Transfer kontolü


    And I wait ozetEkraniOnayBekleyenTransferler element 1 seconds at index 1
    And I scroll to the "ozetEkraniOnayBekleyenTransferler" at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenTransferler save as <dasboardvaluekey> globalOrlocal:global

             # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2
    Examples:
      | username     | dasboardvaluekey  |
      | DealerSHezer | oldDashBoardValue |


   # @Stok
  Scenario Outline: 1_9_2_S Test edilen usera transfer et.
    Then I enter "<username>" text to username text area at index 1
      #DealerROzgokce3
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
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1

    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1

    And I enter a IMEI number to input imei at index 1

    And I wait Ekle element 5 seconds at index 1
    Then I click element: Ekle at index 1

    And I have to refresh the page

    Then I wait urun button element 6 seconds at index 1
    And I click element: urun button at index 1


      #eklenen ürünü Transfer Et

    And I see transfer page
    Then I click element: transfer button at index 1
    And I wait transferOlustur button element 1 seconds at index 1
    Then I click element: transferOlustur button at index 1

    Then I click element: hamburger close at index 1

    And I wait transferOlusturAramaAlani element 1 seconds at index 1

    And I enter a IMEI number to transferOlusturAramaAlani at index 1


    And I wait transferOlusturEkle element 1 seconds at index 1
    Then I click element: transferOlusturEkle at index 1

    # Transfer edilen mağza seç

    And I wait transferOlusturTransferEdilenMagza element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza at index 1

    And I wait transferOlusturTransferEdilenMagza1 element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza1 at index 1

    And I wait transferOlusturGonder element 1 seconds at index 1
    Then I click element: transferOlusturGonder at index 1

    And I wait transferOlusturOperasyonBasarili element 1 seconds at index 1
    Then I click element: transferOlusturBasariliClose at index 1


    And I wait transferListesiAramaAlani element 1 seconds at index 1


    And I wait transferEdilenMagzaCodeu element 1 seconds at index 1
    Then I click element: transferEdilenMagzaCodeu at index 1

    And I wait transferEdenMagzaCodeu element 1 seconds at index 1
    Then I click element: transferEdenMagzaCodeu at index 1

    And I enter a IMEI number to transferListesiAramaAlani at index 1


    Then I click element: transferOlusturAramaBtn at index 1

    # Surec basarili mi ?
    And I wait transferOnayBekliyor element 1 seconds at index 1

    Then I click element: hamburger close at index 1

    Then I click element: transfer button at index 1
    And I see ozet page

    And I wait ozet button element 1 seconds at index 1
    Then I click element: ozet button at index 1

     # And I wait faturaIptalTamam element 5 seconds at index 1
     # Then I click element: faturaIptalTamam at index 1


     #silinen urunu kontrol et

    And I see urun page

    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    And I wait urun arama element 1 seconds at index 1

    And I enter a IMEI number to urun arama at index 1

    And I see transfer page

    And I wait transferEdilmeyiBekliyor element 1 seconds at index 1
    Then I click element: transferOlusturBasariliClose at index 1

    And I see urun page

    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    And I see ozet page

    And I wait ozet button element 1 seconds at index 1
    Then I click element: ozet button at index 1

    And I wait ozetEkraniUrunlerim element 2 seconds at index 1

    And I scroll to the "ozetEkraniTransferlerim" at index 1

                 # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2

    Examples:
      | username        |
      | DealerROzgokce3 |

  # @Stok
  Scenario Outline: 1_9_3_S Test edilen userda transferi kabul et
    Then I enter "<username>" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    And I see ozet page

    And I wait ozetEkraniOnayBekleyenTransferler element 1 seconds at index 1
    And I scroll to the "ozetEkraniOnayBekleyenTransferler" at index 1

    And I verify Dashboard ValueGlobal: ozetEkraniOnayBekleyenTransferler at addCount 1

    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenTransferler


    And I see transfer page
    And  I wait transfer button element 1 seconds at index 1
    When I click element: transfer button at index 1

    And  I wait transferListesi button element 1 seconds at index 1
    When I click element: transferListesi button at index 1

    And  I wait transferEdenMagzaCode element 1 seconds at index 1
    When I click element: transferEdenMagzaCode at index 1

    And  I wait transferEdenMagzaCodeu element 1 seconds at index 1
    When I click element: transferEdenMagzaCodeu at index 1

    And I enter a IMEI number fromGlobal to transferListesiAramaAlani at index 1

    Then I click element: transferOlusturAramaBtn at index 1

    And I wait transferOnayBekliyor element 1 seconds at index 1
    Then I click element: transferOnayBekliyor at index 1

    And I wait transferOnaylaBtn element 1 seconds at index 1
    Then I click element: transferOnaylaBtn at index 1

    And I see urun page

    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1

    And I wait urun arama element 1 seconds at index 1

    And I enter a IMEI number fromGlobal to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    Then I click element: hamburger close at index 1

    And I see ozet page

    Then I click element: ozet button at index 1


    And I wait ozetEkraniOnayBekleyenTransferler element 1 seconds at index 1
    And I scroll to the "ozetEkraniOnayBekleyenTransferler" at index 1

    And I verify Dashboard Value: ozetEkraniOnayBekleyenTransferler at deleteCount 1


    Examples:
      | username     |
      | DealerSHezer |