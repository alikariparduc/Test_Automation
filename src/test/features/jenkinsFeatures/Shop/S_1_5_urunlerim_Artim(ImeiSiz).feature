Feature: S_1_5_dashboard_urunlerim_Artim(ImeiSiz)_kontrolu Imesiz


  Background: System Login
    Given I control logout with username: "DealerFSinen2"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerFSinen2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: S_1_5_urunlerim_Artim(ImeiSiz) kontolü
    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "8681900408008" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait urunEkranBarkodEkle element 1 seconds at index 1
    Then I enter "3" text to urunEkranBarkodEkle at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1

    And I need to just wait

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    And I see ozet page

    And I wait ozet button element 1 seconds at index 1
    Then I click element: ozet button at index 1

         #işlem bitti çıkış yap.
    And I logout the system