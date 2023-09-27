Feature: W_3_3_satisImeisiz


  Background: System Login
    Given I control logout with username: "DealerOAydin23"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerOAydin23" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_3_3_satisImeisiz
    And I see urun page

    # ürün lerim sayfasına giriş.
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

     # Imeisiz urunu bul
    And I wait urun arama element 1 seconds at index 1
    And I enter "8681489391180" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    # ürün sepete urun ekle

    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1

    # sepetim sayfasına git.
    And I see sepet page
    And I wait Sepetim element 1 seconds at index 1
    Then I click element: Sepetim at index 1

    And I wait silverPartnerSecim element 3 seconds at index 1
    Then I click element: silverPartnerSecim at index 1
    #And I wait silverSatisYapilacakBayi element 3 seconds at index 1
    #Then I click element: silverSatisYapilacakBayi at index 1
    And I press Down and Enter buttons

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1

    And I wait satisOnayTamam element 2 seconds at index 1
    Then I click element: satisOnayTamam at index 1

    # imeisiz ürün satışı yapılamadığını onayla

    Then I wait imeisizSatisUyari element 1 seconds at index 1
    And I click element: uyariKapamaCarpi at index 1

    #sonraki testlerin hata vermemesi için ürünü sepetten sil
    Then I wait copKutusuIconlari element 1 seconds at index 1
    And I click element: copKutusuIconlari at index 1

    Then I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #işlem bitti çıkış yap.
    And I logout the system