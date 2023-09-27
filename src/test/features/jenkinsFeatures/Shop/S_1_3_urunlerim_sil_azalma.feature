Feature: S_1_3_urunlerim_sil_azalma_kontrolu


  Background: System Login
    Given I control logout with username: "DealerMBaysal12"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerMBaysal12" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: S_1_3_urunlerim_sil_azalma yapıldığında doğru değiştiğinin kontolü

      #urun ekleme ve ana ekran konrolu
    And I see urun page

    Then I wait urun button element 1 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 1 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "6944284633926D" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1

    And I need to just wait

    Then I wait urun button element 1 seconds at index 1
    And I click element: urun button at index 1

    And I see ozet page

    And I wait ozet button element 1 seconds at index 1
    Then I click element: ozet button at index 1
     #urun silme ve ana ekran konrolu

    And I see urun page

    Then I wait urun button element 1 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait Urunsil element 1 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 1 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I select a IMEI number from variables randomImei at index 1
    And I wait Imesil element 1 seconds at index 1
    Then I click element: Imesil at index 1

    And I need to just wait

     #işlem bitti çıkış yap.
    And I logout the system