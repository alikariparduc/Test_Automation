Feature: W_3_4_hataliSatisKontrol


  Background: System Login
    Given I control logout with username: "DealerEKilic26"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerEKilic26" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: W_3_4_hataliSatisKontrol
    And I see urun page

    # ürün lerim sayfasına giriş.
    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait urun arama element 1 seconds at index 1
    And I enter "8681489391180" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    # ürünü 4 kez sepete ekle hata mesajını gör (üründen 3 tane var)

    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1
    Then I wait urunSepeteEklendi element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    Then I wait urunSepeteEklendi element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    Then I wait urunSepeteEklendi element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    Then I wait yeterliStokYok element 3 seconds at index 1
    And I click element: uyariKapamaCarpi at index 1

    # sepetim sayfasına git.
    And I see sepet page
    And I wait sepetimBtn element 1 seconds at index 1
    Then I click element: sepetimBtn at index 1

    # adeti 3 ten fazla ve 0 girip hatayı gör, silveri seçmeden satışı tamamla diyip hatayı gör,
      # sepeti boşaltıp hatayı gör

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1
    And I wait gerekliAlanEksikUyari element 3 seconds at index 1
    Then I click element: uyariKapamaCarpi at index 1

    And I click element: urunSepetAdeti at index 1
    And I clear text to urunSepetAdeti at index 1
    And I enter "4" text to urunSepetAdeti at index 1
    And I wait sepetAdetUyari element 1 seconds at index 1
    And I clear text to urunSepetAdeti at index 1
    And I enter "0" text to urunSepetAdeti at index 1
    And I wait sepetAdetUyari element 1 seconds at index 1

    And I click element: sepettenUrunuSilBtn at index 1
    And I wait Tamam element 3 seconds at index 1
    Then I click element: Tamam at index 1
    And I wait sepetBosUyari element 1 seconds at index 1
    Then I click element: uyariKapamaCarpi at index 1

    # işlem bitti çıkış yap.

    Then I wait usermenu element 5 seconds at index 1
    And I click element: usermenu at index 1
    And I wait Logout element 5 seconds at index 2
    And I click element: Logout at index 2
