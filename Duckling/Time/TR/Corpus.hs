-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Time.TR.Corpus
  ( corpus
  ) where

import Data.String
import Prelude

import Duckling.Locale
import Duckling.Resolve
import Duckling.Testing.Types hiding (examples)
import Duckling.Time.Corpus
import Duckling.Time.Types hiding (Month)
import Duckling.TimeGrain.Types
    ( Grain(Minute, Hour, Year, Quarter, Week, Month, Day, Second) )

context :: Context
context = testContext {locale = makeLocale TR Nothing}

-- Tuesday Feb 12, 2013 at 4:30am is the "now" for the tests
corpus :: Corpus
corpus = (context, testOptions, allExamples)
allExamples :: [Example]
allExamples = concat
  [ examples (datetime (2013, 2, 12, 4, 30, 0) Second)
             [ "şimdi"
             , "hemen"
             , "anında"
             , "şu an"
             ]
  , examples (datetime (2013, 2, 12, 0, 0, 0) Day)
             [ "bugün"
             ]
  , examples (datetime (2013, 2, 1, 0, 0, 0) Month)
             [ "2/2013",
               "2.2013"
             ]
  , examples (datetime (2014, 1, 1, 0, 0, 0) Year)
             [ "2014",
               "2014 yılında"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Day)
             [ "dün"
             ]
  , examples (datetime (2013, 2, 13, 0, 0, 0) Day)
             [ "yarın"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "yarından sonraki"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "yarından sonraki gün"
             ]
  , examples (datetime (2013, 1, 3, 0, 0, 0) Day)
             [ "ay sonu"
             ]
  , examples (datetime (2014, 1, 1, 0, 0, 0) Day)
             [ "yıl sonu"
             ]
  , examples (datetime (2013, 2, 18, 0, 0, 0) Day)
             [ "pazartesi"
             , "pzts"
             , "bu pazartesi"
             , "18 şubat pazartesi"
             , "şubat 18 pazartesi"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "salı"
             , "sal"
             , "bu salı"
             , "19 şubat salı"
             , "şubat 19 salı"
             ]
  , examples (datetime (2013, 8, 15, 0, 0, 0) Day)
             [ "Thu 15th"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "perşembe"
             , "per"
             ]
  , examples (datetime (2013, 2, 15, 0, 0, 0) Day)
             [ "cuma"
             , "cum"
             ]
  , examples (datetime (2013, 2, 16, 0, 0, 0) Day)
             [ "cumartesi"
             , "cmt"
             ]
  , examples (datetime (2013, 2, 17, 0, 0, 0) Day)
             [ "pazar"
             , "paz"
             ]
  , examples (datetime (2013, 3, 3, 0, 0, 0) Day)
             [ "martın üç"
             , "3 mart"
             ]
  , examples (datetime (2013, 3, 15, 0, 0, 0) Day)
             [ "martın ortası"
             ]
  , examples (datetime (2013, 2, 13, 0, 0, 0) Day)
             [ "şubatın ortası"
             ]
  , examples (datetime (2015, 3, 3, 0, 0, 0) Day)
             [ "mart 3 2015"
             , "mart üç 2015"
             , "3 mart 2015"
             , "üç mart 2015"
             , "3/3/2015"
             , "3/3/15"
             , "2015-3-3"
             , "2015-03-03"
             ]
  , examples (datetime (2013, 8, 8, 0, 0, 0) Day)
             [ "Ağu 8"
             ]
  , examples (datetime (2014, 7, 18, 0, 0, 0) Day)
             [ "cuma temmuz 18"
             , "temmuz 18 cuma"
             ]
  , examples (datetime (2014, 10, 1, 0, 0, 0) Month)
             [ "Ekim 2014"
             , "2014-10"
             , "2014/10"
             ]
  , examples (datetime (2015, 4, 14, 0, 0, 0) Day)
             [ "14 nisan 2015"
             , "nisan 14 2015"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "önümüzdeki salı"
             , "sonraki salı"
             ]
  , examples (datetime (2013, 2, 22, 0, 0, 0) Day)
             [ "sonraki cuma"
             ]
  , examples (datetime (2013, 3, 1, 0, 0, 0) Month)
             [ "önümüzdeki mart"
             , "sonraki mart"
             , "sonraki ay"
             , "önümüzdeki ay"
             ]
  , examples (datetime (2014, 3, 1, 0, 0, 0) Month)
             [ "mart önümüzdeki"
             ]
  , examples (datetime (2013, 2, 10, 0, 0, 0) Day)
             [ "pazar 10 şubat"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Week)
             [ "bu hafta"
             ]
  , examples (datetime (2013, 2, 18, 0, 0, 0) Week)
             [ "önümüzdeki hafta"
             ]
  , examples (datetime (2013, 2, 4, 0, 0, 0) Week)
             [ "geçen hafta"
             , "geçtiğimiz hafta"
             , "önceki hafta"
             ]
  , examples (datetime (2013, 2, 18, 0, 0, 0) Week)
             [ "sonraki hafta"
             , "gelecek hafta"
             , "önümüzdeki hafta"
             ]
  , examples (datetime (2013, 1, 1, 0, 0, 0) Month)
             [ "geçen ay"
             , "geçtiğimiz ay"
             , "önceki ay"
             ]
  , examples (datetime (2013, 3, 1, 0, 0, 0) Month)
             [ "önümüzdeki ay"
             , "sonraki ay"
             , "gelecek ay"
             ]
  , examples (datetime (2013, 1, 1, 0, 0, 0) Quarter)
             [ "bu çeyrek yıl"
             ]
  , examples (datetime (2013, 4, 1, 0, 0, 0) Quarter)
             [ "sonraki çeyrek yıl"
             ]
  , examples (datetime (2013, 7, 1, 0, 0, 0) Quarter)
             [ "üçüncü çeyrek yıl"
             ]
  , examples (datetime (2018, 10, 1, 0, 0, 0) Quarter)
             [ "dördüncü çeyrek yıl"
             ]
  , examples (datetime (2012, 1, 1, 0, 0, 0) Year)
             [ "geçen yıl"
             ]
  , examples (datetime (2013, 1, 1, 0, 0, 0) Year)
             [ "bu yıl"
             ]
  , examples (datetime (2014, 1, 1, 0, 0, 0) Year)
             [ "sonraki yıl"
             ]
  , examples (datetime (2013, 2, 10, 0, 0, 0) Day)
             [ "geçen pazar"
             , "geçen haftanın pazar günü"
             , "geçen hafta pazar"
             ]
  , examples (datetime (2013, 2, 5, 0, 0, 0) Day)
             [ "geçen salı"
             ]
  , examples (datetime (2013, 2, 20, 0, 0, 0) Day)
             [ "önümüzdeki salı"
             , "gelecek salı"
             , "sonraki salı"
             ]
  , examples (datetime (2013, 2, 20, 0, 0, 0) Day)
             [ "gelecek hafta çarşamba"
             ]
  , examples (datetime (2013, 2, 22, 0, 0, 0) Day)
             [ "sonraki cuma"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Day)
             [ "bu haftanın pazartesi günü"
             ]
  , examples (datetime (2013, 2, 12, 0, 0, 0) Day)
             [ "bu haftanın salı günü"
             ]
  , examples (datetime (2013, 2, 13, 0, 0, 0) Day)
             [ "bu haftanın çarşamba günü"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "yarından sonraki gün"
             ]
  , examples (datetime (2013, 2, 14, 17, 0, 0) Hour)
             [ "sonraki gün saat 17"
             ]
  , examples (datetime (2013, 2, 10, 0, 0, 0) Day)
             [ "dün değil evvelsi gün"
             , "dünden önceki gün"
             , "öbürki gün"
             , "öbürsü gün"
             ]
  , examples (datetime (2013, 2, 10, 8, 0, 0) Hour)
             [ "dünden önceki gün saat 8"
             ]
  , examples (datetime (2013, 3, 25, 0, 0, 0) Day)
             [ "martın son pazartesi günü"
             ]
  , examples (datetime (2014, 3, 30, 0, 0, 0) Day)
             [ "2014 martın son pazartesi günü"
             ]
  , examples (datetime (2013, 10, 3, 0, 0, 0) Day)
             [ "ekimin üçüncü günü"
             ]
  , examples (datetime (2014, 10, 6, 0, 0, 0) Week)
             [ "ekim 2014 birinci haftası"
             ]
  , examples (datetime (2015, 10, 31, 0, 0, 0) Day)
             [ "2015 ekimin son günü"
             ]
  , examples (datetime (2014, 9, 22, 0, 0, 0) Week)
             [ "2014 eylülün son haftası"
             ]
  , examples (datetime (2013, 10, 1, 0, 0, 0) Day)
             [ "ekimin birinci salı günü"
             , "ekimin birinci salısı"
             ]
  , examples (datetime (2014, 9, 16, 0, 0, 0) Day)
             [ "2014 eylülün üçünü salı günü"
             ]
  , examples (datetime (2014, 10, 1, 0, 0, 0) Day)
             [ "ekim 2014 birinci çarşambası"
             ]
  , examples (datetime (2014, 10, 8, 0, 0, 0) Day)
             [ "2014 ekimin üçüncü çarşambası"
             ]
  , examples (datetime (2014, 1, 13, 0, 0, 0) Day)
             [ "yılbaşından sonraki üçüncü salı günü"
             ]
  , examples (datetime (2013, 2, 13, 3, 0, 0) Hour)
             [ "saat 3"
             ]
  , examples (datetime (2013, 2, 12, 10, 0, 0) Hour)
             [ "sabah saat 10"
             ]
  , examples (datetime (2013, 2, 13, 3, 18, 0) Minute)
             [ "3:18"
             , "03:18"
             ]
  , examples (datetime (2013, 2, 12, 15, 0, 0) Hour)
             [ "saat 15"
             ]
  , examples (datetime (2013, 2, 12, 15, 0, 0) Minute)
             [ "15:00"
             ]
  , examples (datetime (2013, 2, 12, 15, 15, 0) Minute)
             [ "saat 15:03"
             , "15:03"
             ]
  , examples (datetime (2013, 2, 12, 9, 59, 0) Minute)
             [ "saat dokuz elli dokuz"
             ]
  , examples (datetime (2013, 2, 12, 15, 23, 24) Second)
             [ "15:23:24"
             ]
  , examples (datetime (2013, 9, 20, 19, 30, 0) Minute)
             [ "20 eylül cuma saat 19:30"
             ]
  , examples (datetime (2013, 2, 16, 9, 0, 0) Hour)
             [ "cumartesi saat 9"
             , "cumartesi sabah saat 9"
             ]
  , examples (datetime (2014, 7, 18, 19, 0, 0) Minute)
             [ "18 temmuz 2014 cuma saat 19:00"
             , "18 temmuz 2014 cuma saat 19"
             , "18 temmuz 2014 cuma 19"
             , "saat 19:00 18 temmuz 2014 cuma"
             ]
  , examples (datetime (2013, 2, 12, 4, 30, 1) Second)
             [ "bir saniye içinde"
             , "bir saniye içerisinde"
             , "1 saniye içerisinde"
             , "1 saniye içinde"
             ]
  , examples (datetime (2013, 2, 12, 4, 31, 0) Second)
             [ "bir dakika içinde"
             , "bir dakika içerisinde"
             , "1 dakika içinde"
             , "1 dakika içerisinde"
             ]
  , examples (datetime (2013, 2, 12, 4, 32, 0) Second)
             [ "2 dakika içinde"
             , "2 dakika daha"
             ]
  , examples (datetime (2013, 2, 12, 4, 33, 0) Second)
             [ "in three minutes"
             , "in a few minutes"
             ]
  , examples (datetime (2013, 2, 12, 5, 30, 0) Second)
             [ "60 dakika içinde"
             ]
  , examples (datetime (2013, 2, 12, 5, 30, 0) Minute)
             [ "bir saat içinde"
             ]
  , examples (datetime (2013, 2, 13, 4, 0, 0) Hour)
             [ "bir gün sonra"
             ]
  , examples (datetime (2016, 2, 12, 0, 0, 0) Day)
             [ "bugünden sonraki 3 yıl"
             ]
  , examples (datetime (2013, 2, 19, 4, 0, 0) Hour)
             [ "7 gün içinde"
             ]
  , examples (datetime (2013, 2, 19, 17, 0, 0) Hour)
             [ "7 gün sonra saat 17"
             ]
  , examples (datetime (2017, 2, 1, 17, 0, 0) Hour)
             [ "4 yıl sonra saat 17"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "1 hafta içinde"
             , "1 hafta sonra"
             ]
  , examples (datetime (2013, 2, 12, 5, 0, 0) Second)
             [ "yarım saat civarında"
             ]
  , examples (datetime (2013, 2, 5, 4, 0, 0) Hour)
             [ "7 gün önce"
             ]
  , examples (datetime (2013, 1, 29, 4, 0, 0) Hour)
             [ "14 gün önce"
             , "iki hafta önce"
             ]
  , examples (datetime (2013, 2, 5, 0, 0, 0) Day)
             [ "bir hafta önce"
             , "1 hafta önce"
             ]
  , examples (datetime (2013, 1, 31, 0, 0, 0) Day)
             [ "2 perşembe önce"
             ]
  , examples (datetime (2013, 1, 22, 0, 0, 0) Day)
             [ "üç hafta önce"
             ]
  , examples (datetime (2012, 11, 12, 0, 0, 0) Day)
             [ "üç ay önce"
             ]
  , examples (datetime (2013, 02, 04, 0, 0, 0) Day)
             [ "bu ayın birinci pazartesi günü"
             ]
  , examples (datetime (2011, 2, 1, 0, 0, 0) Month)
             [ "iki yıl önce"
             ]
  , examples (datetime (2013, 2, 19, 4, 0, 0) Hour)
             [ "7 days sonra"
             ]
  , examples (datetime (2013, 2, 26, 4, 0, 0) Hour)
             [ "14 gün sonra"
             , "iki hafta sonra"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "bir hafta sonra"
             , "1 hafta sonra"
             ]
  , examples (datetime (2013, 3, 5, 0, 0, 0) Day)
             [ "üç hafta sonra"
             ]
  , examples (datetime (2013, 5, 12, 0, 0, 0) Day)
             [ "üç ay sonra"
             ]
  , examples (datetime (2015, 2, 1, 0, 0, 0) Month)
             [ "iki yıl sonra"
             ]
  , examples (datetime (2013, 12, 25, 0, 0, 0) Day)
             [ "yılbaşından sonra bir yıl"
             , "yılbaşından bir yıl sonra"
             ]
  , examples (datetimeInterval ((2013, 12, 18, 0, 0, 0), (2013, 12, 29, 0, 0, 0)) Day)
             [ "18 aralıktan itibaren 10 gün boyunca"
             , "18 aralıktan itibaren 10 gün süresince"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 16, 0, 0), (2013, 2, 12, 16, 31, 0)) Minute)
             [ "saat 16'dan 30 dakika sonra"
             ]
  , examples (datetimeInterval ((2013, 6, 21, 0, 0, 0), (2013, 9, 24, 0, 0, 0)) Day)
             [ "bu yaz"
             ]
  , examples (datetimeInterval ((2012, 12, 21, 0, 0, 0), (2013, 3, 21, 0, 0, 0)) Day)
             [ "bu kış"
             ]
  , examples (datetimeInterval ((2012, 9, 23, 0, 0, 0), (2012, 12, 20, 0, 0, 0)) Day)
             [ "geçen kış"
             , "önceki kış"
             ]
  , examples (datetimeInterval ((2013, 3, 20, 0, 0, 0), (2013, 6, 20, 0, 0, 0)) Day)
             [ "sonraki ilkbahar"
             , "gelecek ilkbahar"
             , "önümüzdeki ilkbahar"
             ]
  , examples (datetimeInterval ((2013, 2, 11, 18, 0, 0), (2013, 2, 12, 0, 0, 0)) Hour)
             [ "geçen akşam"
             , "geçen gece"
             ]
  , examples (datetimeHoliday (2013, 12, 25, 0, 0, 0) Day "Yılbaşı")
             [ "yılbaşı"
             ]
  , examples (datetimeHoliday (2013, 12, 25, 18, 0, 0) Hour "Yılbaşı")
             [ "yılbaşı saat 18"
             ]
  , examples (datetimeIntervalHoliday ((2013, 12, 25, 3, 0, 0), (2013, 12, 25, 12, 0, 0)) Hour "Yılbaşı")
             [ "yılbaşı sabahı"
             , "2013 yılbaşı sabahı"
             ]  
  , examples (datetimeInterval ((2013, 2, 12, 18, 0, 0), (2013, 2, 13, 0, 0, 0)) Hour)
             [ "bu akşam"
             ]
  , examples (datetimeInterval ((2013, 2, 8, 18, 0, 0), (2013, 2, 11, 0, 0, 0)) Hour)
             [ "geçen hafta sonu"
             ]
  , examples (datetimeInterval ((2013, 2, 13, 18, 0, 0), (2013, 2, 14, 0, 0, 0)) Hour)
             [ "yarın akşam"
             ]
  , examples (datetimeInterval ((2013, 2, 13, 12, 0, 0), (2013, 2, 13, 14, 0, 0)) Hour)
             [ "yarın öğle yemeği"
             ]
  , examples (datetimeInterval ((2013, 2, 11, 18, 0, 0), (2013, 2, 12, 0, 0, 0)) Hour)
             [ "dün akşam"
             ]
  , examples (datetimeInterval ((2013, 2, 15, 18, 0, 0), (2013, 2, 18, 0, 0, 0)) Hour)
             [ "bu hafta sonu"
             ]
  , examples (datetimeInterval ((2013, 2, 18, 0, 0, 0), (2013, 2, 18, 12, 0, 0)) Hour)
             [ "pazartesi sabah"
             ]
  , examples (datetimeInterval ((2013, 2, 18, 0, 0, 0), (2013, 2, 18, 9, 0, 0)) Hour)
             [ "sabah erkenden"
             , "sabah erken saatte"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 21, 0, 0), (2013, 2, 13, 0, 0, 0)) Hour)
             [ "geçen gece"
             ]
  , examples (datetimeInterval ((2013, 2, 15, 0, 0, 0), (2013, 2, 15, 12, 0, 0)) Hour)
             [ "15 şubat sabahı"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 29, 58), (2013, 2, 12, 4, 30, 0)) Second)
             [ "son 2 saniye"
             , "son iki saniye"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 1), (2013, 2, 12, 4, 30, 4)) Second)
             [ "sonraki 3 saniye"
             , "sonraki üç saniye"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 28, 0), (2013, 2, 12, 4, 30, 0)) Minute)
             [ "son 2 dakika"
             , "son iki dakika"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 3, 0, 0), (2013, 2, 12, 4, 0, 0)) Hour)
             [ "son 1 saat"
             , "son bir saat"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 5, 0, 0), (2013, 2, 12, 8, 0, 0)) Hour)
             [ "sonraki 3 saat"
             , "sonraki üç saat"
             ]
  , examples (datetimeInterval ((2013, 2, 10, 0, 0, 0), (2013, 2, 12, 0, 0, 0)) Day)
             [ "son iki gün"
             , "son 2 gün"
             ]
  , examples (datetimeInterval ((2013, 1, 28, 0, 0, 0), (2013, 2, 11, 0, 0, 0)) Week)
             [ "geçtiğimiz iki hafta"
             , "önceki iki hafta"
             ]
  , examples (datetimeInterval ((2013, 2, 18, 0, 0, 0), (2013, 3, 11, 0, 0, 0)) Week)
             [ "önümüzdeki üç hafta"
             , "sonraki üç hafta"
             ]
  , examples (datetimeInterval ((2012, 12, 1, 0, 0, 0), (2013, 2, 1, 0, 0, 0)) Month)
             [ "son 2 ay"
             , "son iki ay"
             ]
  , examples (datetimeInterval ((2011, 1, 1, 0, 0, 0), (2013, 1, 1, 0, 0, 0)) Year)
             [ "son 2 yıl"
             , "son iki yıl"
             ]
  , examples (datetimeInterval ((2014, 1, 1, 0, 0, 0), (2017, 1, 1, 0, 0, 0)) Year)
             [ "önümüzdeki üç yıl"
             , "önümüzdeki 3 yıl"
             , "gelecek 3 yıl"
             , "gelecek üç yıl"
             ]
  , examples (datetimeInterval ((2013, 7, 13, 0, 0, 0), (2013, 7, 16, 0, 0, 0)) Day)
             [ "Temmuz 13-15"
             ]
  , examples (datetimeInterval ((2013, 8, 8, 0, 0, 0), (2013, 8, 13, 0, 0, 0)) Day)
             [ "8 Ağu - 12 Ağu"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 9, 30, 0), (2013, 2, 12, 11, 1, 0)) Minute)
             [ "9:30 - 11:00"
             ]
  , examples (datetimeInterval
      ((2015, 3, 28, 17, 00, 0), (2015, 3, 29, 21, 0, 1)) Second)
             [ "2015-03-28 17:00:00/2015-03-29 21:00:00"
             ]
  , examples (datetimeInterval ((2013, 2, 14, 9, 30, 0), (2013, 2, 14, 11, 1, 0)) Minute)
             [ "perşembe 9:30 - 11:00"
             ]
  , examples (datetimeInterval ((2013, 2, 13, 1, 0, 0), (2013, 2, 13, 2, 31, 0)) Minute)
             [ "yarın 1-2:30 arası"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 15, 0, 0), (2013, 2, 12, 17, 0, 0)) Hour)
             [ "saat 15-16"]
  , examples (datetimeInterval ((2013, 2, 12, 15, 30, 0), (2013, 2, 12, 18, 1, 0)) Minute)
             [ "saat 15:30 - 18"]
  , examples (datetimeInterval ((2013, 2, 14, 9, 0, 0), (2013, 2, 14, 12, 0, 0)) Hour)
             [ "perşembe saat 9-11"
             , "this Thu 9-11am"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 11, 30, 0), (2013, 2, 12, 13, 31, 0)) Minute)
             [ "saat 11:30-13:30"
             ]
  , examples (datetime (2013, 9, 21, 13, 30, 0) Minute)
             [ "21 eylül cumartesi saat 13:30"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 2, 26, 0, 0, 0)) Second)
             [ "2 hafta içinde"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 2, 13, 0, 0, 0)) Second)
             [ "gün sonuna kadar"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 3, 1, 0, 0, 0)) Second)
             [ "ay sonuna kadar"
             ]
  , examples (datetimeInterval ((2013, 2, 21, 0, 0, 0), (2013, 3, 1, 0, 0, 0)) Day)
             [ "ay sonunda"
             , "ay sonu"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 4, 1, 0, 0, 0)) Second)
             [ "önümüzdeki ay sonuna kadar"
             ]
  , examples (datetime (2013, 2, 12, 10, 30, 0) Minute)
             [ "saat 10:30 civarı"
             , "10:30 civarı"
             , "yaklaşık saat 10:30"
             , "saat yaklaşık 10:30"
             ]
  , examples (datetime (2013, 2, 12, 19, 30, 0) Minute)
             [ "akşam saat 19:30"
             ]
  , examples (datetime (2013, 2, 13, 1, 50, 0) Minute)
             [ "yarın saat 15:00"
             ]
  , examples (datetime (2013, 2, 12, 23, 0, 0) Hour)
             [ "tonight at 11"
             , "this evening at 11"
             , "this afternoon at 11"
             , "tonight at 11pm"
             ]
  , examples (datetime (2013, 2, 12, 4, 23, 0) Minute)
    -- yes, the result is in the past, we may need to revisit
             [ "at 4:23"
             , "4:23am"
             , "four twenty-three a m"
             ]
  , examples (datetime (2013, 10, 7, 0, 0, 0) Day)
             [ "the closest Monday to Oct 5th"
             ]
  , examples (datetime (2013, 9, 30, 0, 0, 0) Day)
             [ "the second closest Mon to October fifth"
             ]
  , examples (datetimeInterval ((2013, 2, 11, 0, 0, 0), (2013, 2, 17, 0, 0, 0)) Day)
             [ "hafta boyunca"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 0, 0, 0), (2013, 2, 17, 0, 0, 0)) Day)
             [ "haftanın geri kalanı"
             ]
  , examples (datetimeInterval ((2013, 7, 26, 18, 0, 0), (2013, 7, 29, 0, 0, 0)) Hour)
             [ "temmuzun son hafta sonu"
             ]
  , examples (datetimeInterval ((2017, 10, 27, 18, 0, 0), (2017, 10, 30, 0, 0, 0)) Hour)
             [ "2017 ekimin son hafta sonu"
             ]
  , examples (datetimeHoliday (1950, 7, 16, 0, 0, 0) Day "Ramazan Bayramı")
             [ "ramazan bayramı 1950"
             , "1950 ramazan bayramı"
             ]
  , examples (datetimeHoliday (1975, 10, 6, 0, 0, 0) Day "Ramazan Bayramı")
             [ "1975 ramazan bayramı"
             ]
  , examples (datetimeHoliday (1988, 5, 16, 0, 0, 0) Day "Ramazan Bayramı")
             [ "1988 ramazan bayramı"
             ]
  , examples (datetimeHoliday (2018, 6, 15, 0, 0, 0) Day "Ramazan Bayramı")
             [ "2018 ramazan bayramı"
             ]
  , examples (datetimeHoliday (2034, 12, 12, 0, 0, 0) Day "Ramazan Bayramı")
             [ "2013 ramazan bayramı"
             ]
  , examples (datetimeHoliday (2046, 8, 4, 0, 0, 0) Day "Ramazan Bayramı")
             [ "2046 ramazan bayramı"
             ]
  , examples (datetimeHoliday (2050, 6, 21, 0, 0, 0) Day "Ramazan Bayramı")
             [ "2050 ramazan bayramı"
             ]
  , examples (datetimeHoliday (2018, 8, 21, 0, 0, 0) Day "Kurban Bayramı")
             [ "2018 kurban bayramı"
             ]
  , examples (datetimeHoliday (1980, 10, 19, 0, 0, 0) Day "Kurban Bayramı")
             [ "1980 kurban bayramı"
             ]
  , examples (datetimeHoliday (1966, 4, 1, 0, 0, 0) Day "Kurban Bayramı")
             [ "1966 kurban bayramı"
             ]
  , examples (datetimeHoliday (1974, 1, 3, 0, 0, 0) Day "Kurban Bayramı")
             [ "1974 kurban bayramı"
             ]
  , examples (datetimeHoliday (2013, 4, 23, 0, 0, 0) Day "Ulusal Egemenlik ve Çocuk Bayramı")
             [ "ulusal egemenlik ve çocuk bayramı"
             , "çocuk bayramı"
             ]
  , examples (datetimeHoliday (2013, 5, 1, 0, 0, 0) Day "Emek ve Dayanışma Günü")
             [ "emek ve dayanışma günü"
             ]
  , examples (datetimeHoliday (2013, 5, 19, 0, 0, 0) Day "Atatürk’ü Anma, Gençlik ve Spor Bayramı")
             [ "atatürk'ü anma gençlik ve spor bayramı"
             , "gençlik ve spor bayramı"
             , "gençlik bayramı"
             , "spor bayramı"
             ]
  , examples (datetimeHoliday (2013, 8, 30, 0, 0, 0) Day "Zafer Bayramı")
             [ "zafer bayramı"
             ]
  , examples (datetimeHoliday (2013, 10, 29, 0, 0, 0) Day "Cumhuriyet Bayramı")
             [ "cumhuriyet bayramı"
             ]
  ]
