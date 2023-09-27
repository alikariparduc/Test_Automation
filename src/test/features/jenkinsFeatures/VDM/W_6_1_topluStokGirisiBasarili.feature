Feature: W_6_1_topluStokGirisiBasarili

  # hem generic hem normal dealer ile denenmesi gerekiyor.

  Background:
    Given I control "702121212121009" IMEI is deleted in database
    #bir test hata alıp imei silinemediyse, diğerlerinin hata almaması için background'da imei'yi siliyorum.

  @Stok
  Scenario Outline: W_6_1_1_topluStokGirisiBasarili

    Given I control logout with username: <username>
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter <username> text to username text area at index 1
    Then I enter <password> text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    #When I wait topluStokGirisiadd element 5 seconds at index 1
    #Then I click element: topluStokGirisiadd at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Basarili" with random suffix using the: topluStokGirisiComputer at index 1
    Then I have to refresh the page
    Then I need to just wait
    #Then I have to refresh the page

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 10 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #tamamlandı, envantere eklendi, ve stoğa başarılı bir şekilde eklendi yazılarını kontrol et
    And I wait tamamlandiBilgisi element 10 seconds at index 1
    And I wait envantereEklendiBilgisi element 10 seconds at index 1
    And I wait basariliDosyaAdi element 10 seconds at index 1
    And I click element: basariliDosyaAdi at index 1
    And I wait stogaBasariliEklendiAciklamasi element 10 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urun button element 10 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 10 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "702121212121009" text to urun arama at index 1
    #And I wait serch1 element 10 seconds at index 1
    #Then I click element: serch1 at index 1
    And I press Down and Enter buttons

    #sonraki testlerde hata vermemesi için ürünü sil
    And I wait Urunsil element 10 seconds at index 1
    Then I click element: Urunsil at index 1

    And I wait ImeiSec element 10 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 702121212121009 at index 1

    And I wait Imesil element 10 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 10 seconds at index 1

    # işlem bitti çıkış yap.
    And I logout the system

    Examples:
      | username               | password   |
      | "DealerAKirklar5"     | "Voda1234" |
      | "Akpinar Dagitim Vdm1" | "Voda1234" |

  @Stok
  Scenario Outline: W_6_1_2_topluStokGirisiBasarili_Adet2

    Given I control logout with username: <username>
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter <username> text to username text area at index 1
    Then I enter <password> text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page
    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1
    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Basarili_Adet2" with random suffix using the: topluStokGirisiComputer at index 1
    Then I have to refresh the page
    Then I need to just wait
    #Then I have to refresh the page

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 10 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #tamamlandı, envantere eklendi, ve stoğa başarılı bir şekilde eklendi yazılarını kontrol et
    And I wait tamamlandiBilgisi element 10 seconds at index 1
    And I wait envantereEklendiBilgisi element 10 seconds at index 1
    And I wait basariliDosyaAdiAdet2 element 10 seconds at index 1
    And I click element: basariliDosyaAdiAdet2 at index 1
    And I wait stogaBasariliEklendiAciklamasi element 10 seconds at index 1
    And I wait durumBilgisiAdet2 element 10 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urun button element 10 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 10 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "702121212121009" text to urun arama at index 1
    #And I wait serch1 element 10 seconds at index 1
    #Then I click element: serch1 at index 1
    And I press Down and Enter buttons

    #sonraki testlerde hata vermemesi için ürünü sil
    And I wait Urunsil element 10 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 10 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 702121212121009 at index 1
    And I wait Imesil element 10 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 10 seconds at index 1

    # işlem bitti çıkış yap.
    And I logout the system

    Examples:
      | username               | password   |
      | "DealerADelioglu2"     | "Voda1234" |
      | "Akpinar Dagitim Vdm1" | "Voda1234" |

  @Stok
  Scenario Outline: W_6_1_3_topluStokGirisiBasarili_EkstraSheet
    Given I control logout with username: <username>
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter <username> text to username text area at index 1
    Then I enter <password> text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page
    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1
    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Basarili_EkstraSheet" with random suffix using the: topluStokGirisiComputer at index 1
    Then I have to refresh the page
    Then I need to just wait
    #Then I have to refresh the page

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 10 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #tamamlandı, envantere eklendi, ve stoğa başarılı bir şekilde eklendi yazılarını kontrol et
    And I wait tamamlandiBilgisi element 10 seconds at index 1
    And I wait envantereEklendiBilgisi element 10 seconds at index 1
    And I wait basariliDosyaAdiEkstraSheet element 10 seconds at index 1
    And I click element: basariliDosyaAdiEkstraSheet at index 1
    And I wait stogaBasariliEklendiAciklamasi element 10 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urun button element 10 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 10 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "702121212121009" text to urun arama at index 1
    #And I wait serch1 element 10 seconds at index 1
    #Then I click element: serch1 at index 1
    And I press Down and Enter buttons

    #sonraki testlerde hata vermemesi için ürünü sil
    And I wait Urunsil element 10 seconds at index 1
    Then I click element: Urunsil at index 1

    And I wait ImeiSec element 10 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 702121212121009 at index 1

    And I wait Imesil element 10 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait silbasarili element 5 seconds at index 1

     # işlem bitti çıkış yap.
    And I logout the system

    Examples:
      | username               | password   |
      | "DealerADelioglu2"     | "Voda1234" |
      | "Akpinar Dagitim Vdm1" | "Voda1234" |