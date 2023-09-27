Feature: S_2_5_Urun SKU ile ürün Arama
   # random IMEI üretir bunu ürünlerim ekranından aratır ve
   # ürünün stokda olmadığını bilgi mesajı ile
   # kullancıcıya gösterir

  Background: System Login
    Given I control logout with username: "DealerSHezer"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerSHezer" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    @Stok
  Scenario: S_2_5_Urun SKU ile ürün arama
    #Stokda Olmayan Urun sorgulama
    And I see urun page

    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    Then I enter "IXT0001" text to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I wait TestItem4 element 1 seconds at index 1
    Then I wait 6971202177101 element 1 seconds at index 1
    Then I wait IXT0001 element 1 seconds at index 1

        #işlem bitti çıkış yap.
      And I logout the system