Feature: S_2_1_topluUrunEkleSil

# 111201360883296,111201360883297,111201360883298 ürünleri eklenmiş ise islinmeli
  Background: System Login
    Given I control logout with username: "DealerRAydin13"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerRAydin13" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  #toplam adeti değişkende tut 3 artmış mı kontrol et
  @Stok
  Scenario: S_2_1_topluUrunEkleSil
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1
    And I wait urun arama element 3 seconds at index 1
    Then I enter "IPH0343" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    #And I wait Apple11 element 3 seconds at index 1
    #Then I verify the area Apple11 by read only at index 1
    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    Then I enter "111201360883296" text to input imei at index 1
    And I wait artiEkle element 3 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "111201360883297" text to input imei1 at index 1
    And I wait artiEkle element 3 seconds at index 1
    Then I click element: artiEkle at index 1
    Then I enter "111201360883298" text to input imei2 at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1
    Then I clear text to urun arama at index 1
    Then I enter "111201360883296" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "111201360883297" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "111201360883298" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I need to just wait
    And I get Stock Value toplamAdet
    And I wait Urunsil element 3 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 3 seconds at index 1
    Then I click element: ImeiSec at index 1
    And I wait 111201360883296 element 3 seconds at index 1
    Then I click element: 111201360883296 at index 1
    And I wait Imesil element 3 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 3 seconds at index 1
    And I wait Urunsil element 3 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 3 seconds at index 1
    Then I click element: ImeiSec at index 1
    And I wait 111201360883297 element 3 seconds at index 1
    Then I click element: 111201360883297 at index 1
    And I wait Imesil element 3 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 3 seconds at index 1
    And I wait Urunsil element 3 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 3 seconds at index 1
    Then I click element: ImeiSec at index 1
    And I wait 111201360883298 element 3 seconds at index 1
    Then I click element: 111201360883298 at index 1
    And I wait Imesil element 3 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter "IPH0343" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I need to just wait
    And I verify Stock Value: toplamAdet at deleteCount 3
    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1

    #işlem bitti çıkış yap.
    And I logout the system