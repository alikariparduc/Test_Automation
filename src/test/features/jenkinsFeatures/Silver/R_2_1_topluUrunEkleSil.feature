Feature: R_2_1_topluUrunEkleSil

  Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: R_2_1_topluUrunEkleSil
    And I see urun page

    And I wait urun button element 5 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 5 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1
    And I wait urun arama element 5 seconds at index 1
    Then I enter "666201260111111" text to urun arama at index 1
    Then I clear text to urun arama at index 1
    Then I enter "6941059630883D" text to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 5 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 5 seconds at index 1
    Then I click element: input imei at index 1
    Then I enter "666201260111111" text to input imei at index 1
    And I wait artiEkle element 5 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "666201260111112" text to input imei1 at index 1
    And I wait artiEkle element 5 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "666201260111113" text to input imei2 at index 1
    And I wait Ekle element 5 seconds at index 1
    Then I click element: Ekle at index 1
    Then I need to just wait
    Then I clear text to urun arama at index 1
    Then I enter "666201260111111" text to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "666201260111112" text to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "666201260111113" text to urun arama at index 1
    #And I press Down and Enter buttons
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I get Stock Value toplamAdet
    And I wait Urunsil element 5 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 5 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 666201260111111 at index 1
    And I wait Imesil element 5 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 5 seconds at index 1
    And I wait Urunsil element 5 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 5 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 666201260111112 at index 1
    And I wait Imesil element 5 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 5 seconds at index 1
    And I wait Urunsil element 5 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 5 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 666201260111113 at index 1
    And I wait Imesil element 5 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 5 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "6941059630883D" text to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I verify Stock Value: toplamAdet at deleteCount 3
    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    #işlem bitti çıkış yap.
    And I logout the system