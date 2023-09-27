Feature: S_6_1_topluStokGirisiBasarili


   Background: System Login
    Given I control logout with username: "DealerNDirek"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerNDirek" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: S_6_1_topluStokGirisiBasarili_Imeisiz_100_Farkli_Urun
    #özet sayfasından mevcut ürün sayısını kaydet
    #And I see ozet page
    #And I wait ozet button element 1 seconds at index 1
    #And I click element: ozet button at index 1
    #And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    #And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi


    And I see urun page
    Then I wait urun button element 3 seconds at index 1
    And I click element: urun button at index 1
    Then I wait urunlerim button element 3 seconds at index 1
    And I click element: urunlerim button at index 1
    Then I enter "8681489393269" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_S_Basarili_Imeisiz_100_Farkli_Urun" with random suffix using the: topluStokGirisiComputer at index 1
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 1 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #tamamlandı, envantere eklendi, ve stoğa başarılı bir şekilde eklendi yazılarını kontrol et
    And I wait tamamlandiBilgisi element 1 seconds at index 1
    And I wait envantereEklendiBilgisi element 1 seconds at index 1
    And I wait basariliDosyaAdiImeisiz100FarkliUrun element 1 seconds at index 1
    And I click element: basariliDosyaAdiImeisiz100FarkliUrun at index 1
    And I wait stogaBasariliEklendiAciklamasi element 1 seconds at index 1
    And I need to just wait
    And I need to just wait
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 1 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 1 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 100

       #işlem bitti çıkış yap.
    And I logout the system