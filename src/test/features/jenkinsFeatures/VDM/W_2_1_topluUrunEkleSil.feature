Feature: W_2_1_topluUrunEkleSil


  Background: System Login
    Given I control logout with username: "DealerADelioglu2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerADelioglu2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_2_1_topluUrunEkleSil
    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    And I see urun page
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait urun arama element 1 seconds at index 1
    Then I enter "190199221949D" text to urun arama at index 1
    Then I clear text to urun arama at index 1
    Then I enter "IPH0345D" text to urun arama at index 1
    And I press Down and Enter buttons
    And I wait Apple11 element 1 seconds at index 1
    Then I verify the area Apple11 by read only at index 1

    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    Then I enter "777201260883296" text to input imei at index 1
    And I wait artiEkle element 1 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "777201260883297" text to input imei1 at index 1
    And I wait artiEkle element 1 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "777201260883298" text to input imei2 at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1

    Then I need to just wait
    Then I control take in operations in database for IMEI: "777201260883296" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"
    Then I control take in operations in database for IMEI: "777201260883297" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"
    Then I control take in operations in database for IMEI: "777201260883298" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"
    Then I need to just wait
    Then I need to just wait
    Then I need to just wait

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 3
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    And I see urun page
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I clear text to urun arama at index 1
    Then I wait urun arama element 1 seconds at index 1
    Then I enter "777201260883296" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1

    Then I clear text to urun arama at index 1
    Then I enter "777201260883297" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1

    Then I clear text to urun arama at index 1
    Then I enter "777201260883298" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    And I get Stock Value toplamAdet

    And I wait Urunsil element 1 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 1 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 777201260883296 at index 1
    And I wait Imesil element 1 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 1 seconds at index 1
    Then I control delete operations in database for IMEI: "777201260883296" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"

    And I wait Urunsil element 1 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 1 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 777201260883297 at index 1
    And I wait Imesil element 1 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 1 seconds at index 1
    Then I control delete operations in database for IMEI: "777201260883297" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"

    And I wait Urunsil element 1 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 1 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 777201260883298 at index 1
    And I wait Imesil element 1 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 1 seconds at index 1
    Then I control delete operations in database for IMEI: "777201260883298" barkod: "190199221949D" SKU: "IPH0345D" and store code: "W001000-01"

    Then I clear text to urun arama at index 1
    Then I enter "IPH0345D" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I verify Stock Value: toplamAdet at deleteCount 3
    And I need to just wait
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at deleteCount 3

    #işlem bitti çıkış yap.
    And I logout the system