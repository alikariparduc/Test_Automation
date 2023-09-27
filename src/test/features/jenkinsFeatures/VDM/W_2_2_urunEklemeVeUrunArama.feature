Feature: W_2_2_urun Ekleme Ve Urun Arama
   # random IMEI üretir bunu ürünlerim ekranından aratır ve
   # ürünün stokda olmadığını bilgi mesajı ile
   # kullancıcıya gösterir


  Background: System Login
    Given I control logout with username: "DealerADelioglu2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerADelioglu2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: W_2_2_1 Stokda olmayan urunu sorgulama.
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

  #@Stok
  Scenario: W_2_2_2_Stokda olmayan urunu sorgulama ve ekleme.
    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    #Stoğa ürün ekleme
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
    Then I click element: Ekle at index 1
    Then I need to just wait
    Then I control take in operations in database for IMEI: "RANDOM" barkod: "190198044167S" SKU: "IPH0175S" and store code: "W001000-01"

    Then I clear text to urun arama at index 1

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 1

    #işlem bitti çıkış yap.
    And I logout the system