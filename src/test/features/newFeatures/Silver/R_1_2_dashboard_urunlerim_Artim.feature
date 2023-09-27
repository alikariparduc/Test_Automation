Feature: R_1_2_dashboard_urunlerim_Artim_kontrolu


  Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  #@Stok
  Scenario: R_1_2_dashboard_urunlerim_Artim kontolü
    And I see urun page

    And I wait UrunlerimTest element 1 seconds at index 1
    And I  get Dashboard Stock Value UrunlerimTest

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1


    Then I enter "4718487637379" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1

    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1

    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    And I have to refresh the page
    And I see ozet page

    And I wait ozet button element 1 seconds at index 1
    Then I click element: ozet button at index 1

    And I wait ozetEkraniUrunlerim element 2 seconds at index 1
    And I see urun page

    And I wait UrunlerimTest element 1 seconds at index 1
    And I verify Dashboard Value: UrunlerimTest at addCount 1

    # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2