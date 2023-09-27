Feature: W_6_2_topluStokGirisiHatali

   Background: System Login
    Given I control logout with username: "Akpinar Dagitim Vdm1"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "Akpinar Dagitim Vdm1" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: W_6_2_1_topluStokGirisiHatali_16KarakterliImei
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_16KarakterliImei" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdi16KarakteliImei element 3 seconds at index 1
    And I click element: hataliDosyaAdi16KarakteliImei at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait durumBilgisi16KarakterliImei element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "1021212121210090" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    #toplu stok girişine geri dön hatayı düzeltip değişiklikleri kaydet diyerek ürünü ekle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1
    And I wait hataliDosyaAdi16KarakteliImei element 3 seconds at index 1
    And I click element: hataliDosyaAdi16KarakteliImei at index 1

    And I wait topluStokGirisiImeiInputAlani element 3 seconds at index 1
    And I clear text to topluStokGirisiImeiInputAlani at index 1
    And I enter a IMEI number to topluStokGirisiImeiInputAlani at index 1
    And I wait degisiklikleriKaydetBtn element 3 seconds at index 1
    And I click element: degisiklikleriKaydetBtn at index 1

    And I wait guncellemeBasarili element 3 seconds at index 1
    And I wait tamamBtn element 3 seconds at index 1
    And I click element: tamamBtn at index 1

    #toplu stok girişinin başarılı olduğunun kontrolü
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    And I wait tamamlandiBilgisi element 3 seconds at index 1
    And I wait envantereEklendiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdi16KarakteliImei element 3 seconds at index 1
    And I click element: hataliDosyaAdi16KarakteliImei at index 1
    And I wait stogaBasariliEklendiAciklamasi element 3 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1

    Then I click element: serch1 at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_2_topluStokGirisiHatali_BarkodBos
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_BarkodBos" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiBarkodBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodBos at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait durumBilgisiBarkodBos element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "302121212121009" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    #toplu stok girişine geri dön hatayı düzeltip değişiklikleri kaydet diyerek ürünü ekle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1
    And I wait hataliDosyaAdiBarkodBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodBos at index 1

    And I wait topluStokGirisiImeiInputAlani element 3 seconds at index 1
    And I clear text to topluStokGirisiImeiInputAlani at index 1
    And I enter a IMEI number to topluStokGirisiImeiInputAlani at index 1
    And I wait topluStokGirisiBarkodInputAlani element 3 seconds at index 1
    And I enter "6971202177101" text to topluStokGirisiBarkodInputAlani at index 1
    And I wait degisiklikleriKaydetBtn element 3 seconds at index 1
    And I click element: degisiklikleriKaydetBtn at index 1

    And I wait guncellemeBasarili element 3 seconds at index 1
    And I wait tamamBtn element 3 seconds at index 1
    And I click element: tamamBtn at index 1

    #toplu stok girişinin başarılı olduğunun kontrolü
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    And I wait tamamlandiBilgisi element 3 seconds at index 1
    And I wait envantereEklendiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiBarkodBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodBos at index 1
    And I wait stogaBasariliEklendiAciklamasi element 3 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1

    Then I click element: serch1 at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_3_topluStokGirisiHatali_AdetBos
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_AdetBos" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiAdetBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiAdetBos at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait durumBilgisiAdetBos element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "302121212121009" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    #toplu stok girişine geri dön hatayı düzeltip değişiklikleri kaydet diyerek ürünü ekle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1
    And I wait hataliDosyaAdiAdetBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiAdetBos at index 1

    And I wait topluStokGirisiImeiInputAlani element 3 seconds at index 1
    And I clear text to topluStokGirisiImeiInputAlani at index 1
    And I enter a IMEI number to topluStokGirisiImeiInputAlani at index 1
    And I wait topluStokGirisiAdetInputAlani element 3 seconds at index 1
    And I enter "1" text to topluStokGirisiAdetInputAlani at index 1
    And I wait degisiklikleriKaydetBtn element 3 seconds at index 1
    And I click element: degisiklikleriKaydetBtn at index 1

    And I wait guncellemeBasarili element 3 seconds at index 1
    And I wait tamamBtn element 3 seconds at index 1
    And I click element: tamamBtn at index 1

    #toplu stok girişinin başarılı olduğunun kontrolü
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    And I wait tamamlandiBilgisi element 3 seconds at index 1
    And I wait envantereEklendiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiAdetBos element 3 seconds at index 1
    And I click element: hataliDosyaAdiAdetBos at index 1
    And I wait stogaBasariliEklendiAciklamasi element 3 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1

    Then I click element: serch1 at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_4_topluStokGirisiHatali_BosSablon
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_BosSablon" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıt bulunamadı hatası kontrolü
    And I wait kayitBulunamadiHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiBosSablon element 3 seconds at index 1
    And I click element: hataliDosyaAdiBosSablon at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_5_topluStokGirisiHatali_IcciliGönderememe
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_IcciliGonderememe" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar doğru girilmeli hatası kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiIcciliGonderememe element 3 seconds at index 1
    And I click element: hataliDosyaAdiIcciliGonderememe at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait durumBilgisiIcciliGonderememe element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "252625457000000" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_6_topluStokGirisiHatali_BarkodYanlis
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_BarkodYanlis" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, iptal edildi, ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiBarkodYanlis element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodYanlis at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait durumBilgisiBarkodYanlis element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "302121212121009" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    #toplu stok girişine geri dön hatayı düzeltip değişiklikleri kaydet diyerek ürünü ekle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1
    And I wait hataliDosyaAdiBarkodYanlis element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodYanlis at index 1

    And I wait topluStokGirisiImeiInputAlani element 3 seconds at index 1
    And I clear text to topluStokGirisiImeiInputAlani at index 1
    And I enter a IMEI number to topluStokGirisiImeiInputAlani at index 1
    And I wait topluStokGirisiBarkodInputAlani element 3 seconds at index 1
    And I clear text to topluStokGirisiBarkodInputAlani at index 1
    And I enter "6971202177101" text to topluStokGirisiBarkodInputAlani at index 1
    And I wait degisiklikleriKaydetBtn element 3 seconds at index 1
    And I click element: degisiklikleriKaydetBtn at index 1

    And I wait guncellemeBasarili element 3 seconds at index 1
    And I wait tamamBtn element 3 seconds at index 1
    And I click element: tamamBtn at index 1

    #toplu stok girişinin başarılı olduğunun kontrolü
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    And I wait tamamlandiBilgisi element 3 seconds at index 1
    And I wait envantereEklendiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiBarkodYanlis element 3 seconds at index 1
    And I click element: hataliDosyaAdiBarkodYanlis at index 1
    And I wait stogaBasariliEklendiAciklamasi element 3 seconds at index 1

    #ürünlerimden eklenen ürünü kontrol et
    And I see urun page

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1

    Then I click element: serch1 at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_7_topluStokGirisiHatali_ImeiTekrarlayanFarkliUrun
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_ImeiTekrarlayanFarkliUrun" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    #And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    #Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I need to just wait
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, envantere eklenemedi ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiImeiTekrarlayanFarkliUrun element 3 seconds at index 1
    And I click element: hataliDosyaAdiImeiTekrarlayanFarkliUrun at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "102121212121090" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_8_topluStokGirisiHatali_ImeiTekrarlayanAyniUrun
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_ImeiTekrarlayanAyniUrun" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    #And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    #Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I need to just wait
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, envantere eklenemedi ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    #And I wait hataBilgisi element 3 seconds at index 1
    #And I wait envantereEklenemediBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiImeiTekrarlayanAyniUrun element 3 seconds at index 1
    And I click element: hataliDosyaAdiImeiTekrarlayanAyniUrun at index 1
    #And I wait dosyaYuklemeImeiTekrarlayan element 3 seconds at index 1
    #And I wait durumBilgisiImeiTekrarlayan element 3 seconds at index 1
    #And I wait durumBilgisiImeiTekrarlayan element 3 seconds at index 2

    #ürünlerimden ürünün eklenmediğini kontrol et
    And I see urun page

    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1

    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1

    Then I clear text to urun arama at index 1
    Then I enter "102121212121008" text to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    #And I click element: urun Stokda Yok Close at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_9_topluStokGirisiHatali_VarOlanUrun
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_VarOlanUrun" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    #And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    #Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I need to just wait
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, envantere eklenemedi ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait envantereEklenemediBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdiVarOlanUrun element 3 seconds at index 1
    And I click element: hataliDosyaAdiVarOlanUrun at index 1
    And I wait dosyaYuklemeImeiTekrarlayan element 3 seconds at index 1
    #And I wait durumBilgisiImeiTekrarlayan element 3 seconds at index 1

    # işlem bitti çıkış yap.
    And I logout the system

  #@Stok
  Scenario: W_6_2_10_topluStokGirisiHatali_250KarakterdenFazla
    #toplu stok girişi sayfasına gidip excel'i yükle
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1

    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1

    Then I need to just wait
    Then I upload the file "Stock2.0_W_Hatali_250KarakterdenFazla" with random suffix using the: topluStokGirisiComputer at index 1

    #kayıtlar dogru girilmeli hatasi kontrolü
    And I wait kayitlarDogruGirilmeliHatasi element 3 seconds at index 1
    #And I click element: closeBtn at index 1

    Then I have to refresh the page
    #Then I need to just wait

    #dosya arama alanına tıkla dosya adını yaz ara
    And I need to just wait
    And I wait dosyaAdiInput element 3 seconds at index 1
    When I click element: dosyaAdiInput at index 1
    And I enter uploaded excel file name to dosyaAdiInput at index 1

    #hata, envantere eklenemedi ve dosya eklenemedi, durum bilgisi yazılarını kontrol et
    And I wait hataBilgisi element 3 seconds at index 1
    And I wait iptalEdildiBilgisi element 3 seconds at index 1
    And I wait hataliDosyaAdi250KarakterdenFazla element 3 seconds at index 1
    And I click element: hataliDosyaAdi250KarakterdenFazla at index 1
    And I wait dosyaYuklemeIptalBilgisi element 3 seconds at index 1
    And I wait nameAlaniUzunluguBilgisi element 3 seconds at index 1

    # işlem bitti çıkış yap.
    And I logout the system