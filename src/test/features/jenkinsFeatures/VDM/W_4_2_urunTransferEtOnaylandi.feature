Feature: W_4_2_urunTransferEtOnaylandi


  Background: System Login
    Given I control logout with username: "DealerAKirklar5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKirklar5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_4_2_urunTransferEtOnaylandi

    #yeni ürün ekle
    And I see urun page
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "6934177761201" text to urun arama at index 1
    And I press Down and Enter buttons

    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 5 seconds at index 1
    Then I click element: Ekle at index 1

    Then I wait urun button element 6 seconds at index 1
    And I click element: urun button at index 1

    #eklenen ürünü Transfer Et
    And I see transfer page
    Then I click element: transfer button at index 1
    And I wait transferOlustur button element 3 seconds at index 1
    Then I click element: transferOlustur button at index 1

    Then I click element: hamburger close at index 1

    And I wait transferOlusturAramaAlani element 3 seconds at index 1
    And I enter a IMEI number to transferOlusturAramaAlani at index 1
    And I wait transferOlusturEkle element 3 seconds at index 1
    Then I click element: transferOlusturEkle at index 1

    # Transfer edilen mağza seç

    And I wait transferOlusturTransferEdilenMagza element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza at index 1
    And I wait transferOlusturTransferEdilenMagza1 element 2 seconds at index 1
    Then I click element: transferOlusturTransferEdilenMagza1 at index 1
    And I wait transferOlusturGonder element 3 seconds at index 1
    Then I click element: transferOlusturGonder at index 1
    And I wait transferOlusturOperasyonBasarili element 3 seconds at index 1
    #Then I click element: transferOlusturBasariliClose at index 1


    And I wait transferListesiAramaAlani element 3 seconds at index 1

    #And I wait VDMtransferEdenMagzaCode element 3 seconds at index 1
    #Then I click element: VDMtransferEdenMagzaCode at index 1
    #And I wait VDMtransferEdilenMagzaCode element 3 seconds at index 1
    #Then I click element: VDMtransferEdilenMagzaCode at index 1
    #And I wait Tumu element 3 seconds at index 1
    #Then I click element: Tumu at index 1
    #And I wait VDMtransferEdenMagzaCodeSecenek element 3 seconds at index 1
    #Then I click element: VDMtransferEdenMagzaCodeSecenek at index 1

    And I enter a IMEI number to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1

    # Surec basarili mi ?
    And I wait transferOnayBekliyor element 3 seconds at index 1

    #arayüzde onay bekliyoru gördükten sonra database i kontrol et
    And I save transfer dokuman numarasi from transferDokumanNumarasi element at index 1
    And I control create transfer operations in database

    Then I click element: hamburger close at index 1
    Then I click element: transfer button at index 1

    #transfere gönderilen urunu kontrol et
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1

    And I wait urun arama element 3 seconds at index 1
    And I enter a IMEI number to urun arama at index 1

    And I see transfer page
    And I wait transferEdilmeyiBekliyor element 3 seconds at index 1
    Then I click element: transferOlusturBasariliClose at index 1

    And I see urun page
    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1
    
    #işlem bitti çıkış yap.
    And I logout the system

    #transfer edilen mağazayla giriş yap
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    Given I control logout with username: "DealerECanbolat"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerECanbolat" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenTransferler element 3 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenTransferler

    #transferin beklemede olduğunu transfer edilen mağazadan onayla
    And I see transfer page
    And I wait transfer button element 3 seconds at index 1
    Then I click element: transfer button at index 1
    And I wait transferListesi button element 3 seconds at index 1
    Then I click element: transferListesi button at index 1

    And I wait transferListesiAramaAlani element 3 seconds at index 1
    And I wait Tumu element 3 seconds at index 1
    Then I click element: Tumu at index 1
    And I wait VDMtransferEdilenMagzaCode element 3 seconds at index 1
    Then I click element: VDMtransferEdilenMagzaCode at index 1
    And I wait W075300 element 3 seconds at index 1
    Then I click element: W075300 at index 1
    And I wait TumuSecenek element 3 seconds at index 1
    Then I click element: TumuSecenek at index 1
    And I enter a IMEI number to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1
    And I wait transferOnayBekliyor element 3 seconds at index 1
    Then I click element: transferOnayBekliyor at index 1

    #transferi transfer edilen mağazadan onayla
    And I wait transferOnaylaBtn element 3 seconds at index 1
    Then I click element: transferOnaylaBtn at index 1

    #burada database'de transfer onay süreçlerini kontrol et
    And I need to just wait
    And I control accept transfer operations in database

    And I wait transferListesiAramaAlani element 3 seconds at index 1
    And I wait Tumu element 3 seconds at index 1
    Then I click element: Tumu at index 1
    And I wait VDMtransferEdilenMagzaCode element 3 seconds at index 1
    Then I click element: VDMtransferEdilenMagzaCode at index 1
    And I wait W075300 element 3 seconds at index 1
    Then I click element: W075300 at index 1
    And I wait TumuSecenek element 3 seconds at index 1
    Then I click element: TumuSecenek at index 1
    And I click element: transferListesiAramaAlani at index 1
    And I clear text to transferListesiAramaAlani at index 1
    And I enter a IMEI number to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1
    And I need to just wait

    And I wait transferOnaylandi element 3 seconds at index 1
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenTransferler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenTransferler at deleteCount 1

    #işlem bitti çıkış yap.
    And I logout the system

    #transfer eden mağazaya tekrar giriş yap
    Given I control logout with username: "DealerAKirklar5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKirklar5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    #transferin onaylandığını transfer eden mağazadan kontrol et
    And I see transfer page
    And I wait transfer button element 3 seconds at index 1
    Then I click element: transfer button at index 1

    And I wait transferListesi button element 3 seconds at index 1
    Then I click element: transferListesi button at index 1

    #And I wait VDMtransferEdenMagzaCode element 3 seconds at index 1
    #Then I click element: VDMtransferEdenMagzaCode at index 1
    #And I wait VDMtransferEdilenMagzaCode element 3 seconds at index 1
    #Then I click element: VDMtransferEdilenMagzaCode at index 1
    #And I wait Tumu element 3 seconds at index 1
    #Then I click element: Tumu at index 1
    #And I wait VDMtransferEdenMagzaCodeSecenek element 3 seconds at index 1
    #Then I click element: VDMtransferEdenMagzaCodeSecenek at index 1

    And I wait transferListesiAramaAlani element 3 seconds at index 1
    And I enter a IMEI number to transferListesiAramaAlani at index 1
    Then I click element: transferOlusturAramaBtn at index 1

    And I wait transferOnaylandi element 3 seconds at index 1

    #işlem bitti çıkış yap.
    And I logout the system