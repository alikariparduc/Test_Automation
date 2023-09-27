Feature: R_2_4_Urun fiyat indirim tanımı
   # random IMEI üretir bunu ürünlerim ekranından aratır ve
   # ürünün stokda olmadığını bilgi mesajı ile
   # kullancıcıya gösterir


  Background: System Login
    Given I control logout with username: "DealerAKaraduman2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKaraduman2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  #@Stok
  Scenario: R_2_4_Urun fiyat indirim tanımı
    #Stokda Olmayan Urun sorgulama
    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1

    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1

    Then I enter "OPPO RX17 Pro 128GB Yeşil" text to urun arama at index 1

    Then I click element: serch1 at index 1

    Then I wait TestItem3 element 1 seconds at index 1
    Then I wait 6944284633926 element 1 seconds at index 1
    Then I wait OPP0001 element 1 seconds at index 1
    Then I click element: urunFiyatIndirim at index 1
    Then I wait urunYeniFiyatEkleAlani element 1 seconds at index 1
    Then I click element: urunYeniFiyatEkleAlani at index 1
    Then I clear text to urunYeniFiyatEkleAlani at index 1
    Then I click element: urunYeniFiyatEkleAlani at index 1
    Then I enter "7999" text to urunYeniFiyatEkleAlani at index 1
    Then I click element: Ekle at index 1

    Then I enter "OPPO RX17 Pro 128GB Yeşil" text to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I click element: urunFiyatIndirim at index 1
    Then I clear text to urunYeniFiyatEkleAlani at index 1
    Then I enter "0" text to urunYeniFiyatEkleAlani at index 1
    Then I click element: Ekle at index 1

    Then I enter "OPPO RX17 Pro 128GB Yeşil" text to urun arama at index 1
    Then I click element: serch1 at index 1

    #işlem bitti çıkış yap.
    And I logout the system