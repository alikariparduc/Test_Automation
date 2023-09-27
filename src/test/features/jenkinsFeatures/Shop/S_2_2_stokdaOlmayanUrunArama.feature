Feature: S_2_2_stokda olmayan urunu arama
   # random IMEI üretir bunu ürünlerim ekranından aratır ve
   # ürünün stokda olmadığını bilgi mesajı ile
   # kullancıcıya gösterir

  Background: System Login
    Given I control logout with username: "DealerSTimur7"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerSTimur7" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok

  Scenario: S_2_2_1 stokda olmayan urunu arama
    #Stokda Olmayan Urun sorgulama
    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    Then I wait urun Stokda Yok Close element 1 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1


         #işlem bitti çıkış yap.
    And I logout the system

  @Stok
  Scenario: S_2_2_2_Stokda olmayan urunu sorgulama.
    #Sotoğa ürün ekleme
    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    Then I wait urun Stokda Yok Close element 1 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1
    Then I enter "190198044167S" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 1 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait Ekle element 1 seconds at index 1
    And I click element: Ekle at index 1
    And I need to just wait

    And I wait urun arama element 5 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1



       #işlem bitti çıkış yap.
    And I logout the system