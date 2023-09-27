Feature: R_1_8_dashboard_urunTransfer_Kontolu


   Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


   #@Stok-özet ekranında transfer yok
      Scenario: R_1_8_dashboard da transfer edilen urunun arama ile kontolü
     And I see ozet page

     #Login sonrası DashBorad da Satislarim kontolü


     And I wait ozetEkraniTransferlerim element 1 seconds at index 1
     And I scroll to the "ozetEkraniTransferlerim" at index 1
     And I  get Dashboard Stock Value ozetEkraniTransferlerim


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


     And I wait transferEdenMagzaCode element 1 seconds at index 1
     Then I click element: transferEdenMagzaCode at index 1

     And I wait transferEdilenMagzaCode element 1 seconds at index 1
     Then I click element: transferEdilenMagzaCode at index 1

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