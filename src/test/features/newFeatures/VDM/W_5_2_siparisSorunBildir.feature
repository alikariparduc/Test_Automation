Feature: W_5_2_siparisSorunBildir

  #@Stok
  Scenario: API Trigger
    Given I control logout with username: "DealerAKirklar5"
    Given Get Token With username "DealerAKirklar5" and password "Voda1234" with "POST".
    Then Send order for storeCode "W000800" with "POST".

  #@Stok
  Scenario: W_5_2_siparisSorunBildir
    Given I control logout with username: "DealerAKirklar5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKirklar5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    #dashboard'un yenilenmesi için bekle
    And I need to just wait
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    And I need to just wait
    And I need to just wait
    And I have to refresh the page

    And I see ozet page
    And I wait ozet button element 10 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 10 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenSiparisler

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1

    #sipariş ile ilgili sorun bildir
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait tedarikciNotuAlani element 3 seconds at index 1
    Then I click element: tedarikciNotuAlani at index 1

    #açıklama girmeden sorun bildire bas alerti gör
    #And I wait sorunBildirBtn element 3 seconds at index 1
    #Then I click element: sorunBildirBtn at index 1
    #And I verify "Lütfen Açıklama Alanını Doldurun!" text in alert
    #And I accept Alert

    #açıklama girmeden sorun bildire bas uyarıyı gör
    And I wait sorunBildirBtn element 3 seconds at index 1
    Then I click element: sorunBildirBtn at index 1
    And I wait lutfenAciklamaAlaniniDoldurun element 3 seconds at index 1
    #Then I click element: lutfenAciklamaAlaniniDoldurun at index 1

    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Siparis iptal test" text to aciklamaInputAlani at index 1
    And I wait sorunBildirBtn element 3 seconds at index 1
    Then I click element: sorunBildirBtn at index 1

    #sorun seçmeden evete bas alerti gör
    #And I wait teslimatSiparisleriEvet element 3 seconds at index 1
    #Then I click element: teslimatSiparisleriEvet at index 1
    #And I verify "Lütfen bir sipariş sorunu seçiniz." text in alert
    #And I accept Alert

    #sorun seçmeden evete bas alerti gör
    And I wait sorunBildirBtn element 3 seconds at index 2
    Then I click element: sorunBildirBtn at index 2
    And I wait lutfenBirSiparisSorunuSeciniz element 3 seconds at index 1
    #Then I click element: lutfenBirSiparisSorunuSeciniz at index 1

    And I wait sorunSecimi element 3 seconds at index 1
    Then I click element: sorunSecimi at index 1
    And I wait digerNedenler element 3 seconds at index 1
    Then I click element: digerNedenler at index 1
    And I wait sorunBildirBtn element 3 seconds at index 2
    Then I click element: sorunBildirBtn at index 2
    Then I need to just wait

    #siparişin iptal edildiğini gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriIptalEdildi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIptalEdildi at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait teslimatSiparisleriCik element 3 seconds at index 1
    Then I click element: teslimatSiparisleriCik at index 1
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1


    #ürünlerin eklenmediğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1
    Then I clear text to urun arama at index 1

    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1
    Then I clear text to urun arama at index 1

    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1
    Then I clear text to urun arama at index 1

    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1
    Then I clear text to urun arama at index 1

    And I need to just wait
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenSiparisler at deleteCount 1

    #işlem bitti çıkış yap.
    #And I see urun page
    #And I wait Logout element 5 seconds at index 1
    #And I scroll to the "Logout"
    #And I click element: Logout at index 1
    And I logout the system