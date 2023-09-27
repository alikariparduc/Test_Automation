Feature: W_5_3_siparisOtomatikOnaylama


  #@Stok
  Scenario Outline: W_5_3_siparisOtomatikOnaylama
    Given I control logout with username: <username>
    Given Get Token With username <username> and password <password> with "POST".
    Then Send order for storeCode "W001500" with "POST".
    Given I control logout with username: <username>
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter <username> text to username text area at index 1
    Then I enter <password> text to password text area at index 1
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

    #siparişin onay beklediğini gör
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1

    # database'e gidip ilgili siparişin created date'ini 24 saat geriye çek
    And I change the created date of the delivery order

    # Siparişin otomatik kabul olması için bekle
    And I wait to accept the delivery automatically
    And I have to refresh the page
    And I need to just wait

    #siparişin onaylandığını gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait onaylayanPersonelAuto element 3 seconds at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnaylandi at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1

    And I wait teslimatSiparisleriCik element 3 seconds at index 1
    Then I click element: teslimatSiparisleriCik at index 1
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1

    #ürünlerin eklendiğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
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
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenSiparisler at deleteCount 1

    #işlem bitti çıkış yap.
    And I logout the system

    Examples:
      | username               | password   |
      | "DealerEKilic26"       | "Voda1234" |
      | "Pamuk Telekom Vdm"    | "Voda1234" |
