Feature: S_1_2_urunlerim_Artim_kontrolu

  Background: System Login
    Given I control logout with username: "DealerZKarakaya7"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerZKarakaya7" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: S_1_2_urunlerim_Artim kontolü
    And I see ozet page

    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "190198044167S" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1
    And I wait urunMiktarlariDegisti element 10 seconds at index 1

        #işlem bitti çıkış yap.
    And I logout the system