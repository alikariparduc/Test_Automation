Feature: S_1_10_dashboard_supplier BE Servisi ile sipariş oluşturma

  #@Stok
  Scenario: API Trigger
    Given I control logout with username: "DealerUErsoy3"
    Given Get Token With username "DealerUErsoy3" and password "Voda1234" with "POST".
    Then Send order for storeCode "S002100" with "POST".

# Background: System Login
    Given I control logout with username: "DealerUErsoy3"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerUErsoy3" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: S_1_10_dashboard_supplier
    And I see ozet page

    #Login sonrası DashBorad da Satislarim kontolü

   # And I wait ozetEkraniUrunlerim element 1 seconds at index 1
   # And I  get Dashboard Stock Value ozetEkraniUrunlerim

    # Siparişlerim

    And I see siparisler page

    And I wait siparisler button element 1 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 1 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1

  # Then I click element: hamburger close at index 1

    And I wait teslimatSiparisleriEkraniBasligi element 1 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriAra element 1 seconds at index 1
    Then I click element: teslimatSiparisleriAra at index 1
    And I wait teslimatSiparisleriOnayBeklyr element 1 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 1 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait teslimatSiparisleriOnayla element 1 seconds at index 1
    Then I click element: teslimatSiparisleriOnayla at index 1
    And I wait teslimatSiparisleriEvet element 1 seconds at index 1
    Then I click element: teslimatSiparisleriEvet at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriAra element 1 seconds at index 1
    Then I click element: teslimatSiparisleriAra at index 1
    And I wait teslimatSiparisleriOnaylandi element 1 seconds at index 1
    Then I click element: teslimatSiparisleriOnaylandi at index 1
    And I wait teslimatSiparisleriIncele element 1 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait teslimatSiparisleriCik element 1 seconds at index 1
    Then I click element: teslimatSiparisleriCik at index 1
    And I wait siparisler button element 1 seconds at index 1
    Then I click element: siparisler button at index 1

    And I see urun page

    And I wait urun button element 1 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    And I need to just wait

       #işlem bitti çıkış yap.
    And I logout the system