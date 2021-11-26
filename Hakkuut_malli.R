library(pxweb)
library(dplyr)

#haku <- interactive_pxweb()

#Harjoituksen vuoksi ladataan kaikki taulukoidut muuttujat, vaikka mahdollista olisi ladata vain halutut. 
#Tarkoituksena on myˆs siisti‰ dataa ja valita halutut tiedot mallia varten. 
#Helpointa olisi ladata vain tarvittavat tiedot, mutta se ei nyt ole ideana.

# PXWEB queryt 
pxweb_query_list_hakkuut <- 
  list("Vuosi"=c("1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020"),
       "Omistajaryhm‰"=c("1","2","3"),
       "Puutavaralaji"=c("Kaikki puutavaralajit","Tukkipuu","Kuitupuu","Energiapuu"),
       "Puulaji"=c("Kaikki puulajit","M‰nty","Kuusi","Lehtipuu"))

pxweb_query_list_hinta <- 
  list("Kuukausi"=c("1995M01","1995M02","1995M03","1995M04","1995M05","1995M06","1995M07","1995M08","1995M09","1995M10","1995M11","1995M12","1996M01","1996M02","1996M03","1996M04","1996M05","1996M06","1996M07","1996M08","1996M09","1996M10","1996M11","1996M12","1997M01","1997M02","1997M03","1997M04","1997M05","1997M06","1997M07","1997M08","1997M09","1997M10","1997M11","1997M12","1998M01","1998M02","1998M03","1998M04","1998M05","1998M06","1998M07","1998M08","1998M09","1998M10","1998M11","1998M12","1999M01","1999M02","1999M03","1999M04","1999M05","1999M06","1999M07","1999M08","1999M09","1999M10","1999M11","1999M12","2000M01","2000M02","2000M03","2000M04","2000M05","2000M06","2000M07","2000M08","2000M09","2000M10","2000M11","2000M12","2001M01","2001M02","2001M03","2001M04","2001M05","2001M06","2001M07","2001M08","2001M09","2001M10","2001M11","2001M12","2002M01","2002M02","2002M03","2002M04","2002M05","2002M06","2002M07","2002M08","2002M09","2002M10","2002M11","2002M12","2003M01","2003M02","2003M03","2003M04","2003M05","2003M06","2003M07","2003M08","2003M09","2003M10","2003M11","2003M12","2004M01","2004M02","2004M03","2004M04","2004M05","2004M06","2004M07","2004M08","2004M09","2004M10","2004M11","2004M12","2005M01","2005M02","2005M03","2005M04","2005M05","2005M06","2005M07","2005M08","2005M09","2005M10","2005M11","2005M12","2006M01","2006M02","2006M03","2006M04","2006M05","2006M06","2006M07","2006M08","2006M09","2006M10","2006M11","2006M12","2007M01","2007M02","2007M03","2007M04","2007M05","2007M06","2007M07","2007M08","2007M09","2007M10","2007M11","2007M12","2008M01","2008M02","2008M03","2008M04","2008M05","2008M06","2008M07","2008M08","2008M09","2008M10","2008M11","2008M12","2009M01","2009M02","2009M03","2009M04","2009M05","2009M06","2009M07","2009M08","2009M09","2009M10","2009M11","2009M12","2010M01","2010M02","2010M03","2010M04","2010M05","2010M06","2010M07","2010M08","2010M09","2010M10","2010M11","2010M12","2011M01","2011M02","2011M03","2011M04","2011M05","2011M06","2011M07","2011M08","2011M09","2011M10","2011M11","2011M12","2012M01","2012M02","2012M03","2012M04","2012M05","2012M06","2012M07","2012M08","2012M09","2012M10","2012M11","2012M12","2013M01","2013M02","2013M03","2013M04","2013M05","2013M06","2013M07","2013M08","2013M09","2013M10","2013M11","2013M12","2014M01","2014M02","2014M03","2014M04","2014M05","2014M06","2014M07","2014M08","2014M09","2014M10","2014M11","2014M12","2015M01","2015M02","2015M03","2015M04","2015M05","2015M06","2015M07","2015M08","2015M09","2015M10","2015M11","2015M12","2016M01","2016M02","2016M03","2016M04","2016M05","2016M06","2016M07","2016M08","2016M09","2016M10","2016M11","2016M12","2017M01","2017M02","2017M03","2017M04","2017M05","2017M06","2017M07","2017M08","2017M09","2017M10","2017M11","2017M12","2018M01","2018M02","2018M03","2018M04","2018M05","2018M06","2018M07","2018M08","2018M09","2018M10","2018M11","2018M12","2019M01","2019M02","2019M03","2019M04","2019M05","2019M06","2019M07","2019M08","2019M09","2019M10","2019M11","2019M12","2020M01","2020M02","2020M03","2020M04","2020M05","2020M06","2020M07","2020M08","2020M09","2020M10","2020M11","2020M12","2021M01","2021M02","2021M03","2021M04","2021M05","2021M06","2021M07","2021M08","2021M09","2021M10"),
       "Hinta-alue"=c("9"),
       "Hakkuutapa"=c("0"),
       "Puutavaralaji"=c("M‰ntytukki","Kuusitukki","Koivutukki","M‰ntykuitupuu","Kuusikuitupuu","Koivukuitupuu","M‰ntypikkutukki","Kuusipikkutukki"))

# Datan lataus 
px_data_hakkuut <- 
  pxweb_get(url = "http://statdb.luke.fi/PXWeb/api/v1/fi/LUKE/04%20Metsa/02%20Rakenne%20ja%20tuotanto/10%20Hakkuukertyma%20ja%20puuston%20poistuma/01c_Hakkuukertyma_koko_maa.px",
            query = pxweb_query_list_hakkuut)

px_data_hinta <- 
  pxweb_get(url = "http://statdb.luke.fi/PXWeb/api/v1/fi/LUKE/04%20Metsa/04%20Talous/02%20Teollisuuspuun%20kauppa/02%20Kuukausitilastot/01a_Kantohinnat_kk.px",
            query = pxweb_query_list_hinta)
# Muunnetaan taulukoksi 
hakkuut_taulukko <- as.data.frame(px_data_hakkuut, column.name.type = "text", variable.value.type = "text")
hinta_taulukko <- as.data.frame(px_data_hinta, column.name.type = "text", variable.value.type = "text")

# Valitaan ensin hakkuutaulukoista muuttujien yhteenlasketut arvot. Olisin tietenkin voinut laskea summan myˆs itse manuaalisesti, mutta j‰tet‰‰n se seuraavin harjoitteluihin. 
#Lis‰ksi valitaan vain tiedot vain vuodesta 1995 eteenp‰in, kohta selvi‰‰ miksi. 

hakkuut <- subset(hakkuut_taulukko,
                  Puutavaralaji=='Kaikki puutavaralajit' & Omistajaryhm‰ == 'Kaikki yhteens‰' & Puulaji == 'Kaikki puulajit',
                  select=c('Vuosi','Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-'))
hakkuut$Vuosi <- as.numeric(hakkuut$Vuosi)
hakkuut_valmis <- hakkuut[hakkuut$Vuosi>=1995,]

# Siirryt‰‰n valitsemaan kantohintatiedot


mantytukki <- hinta_taulukko[hinta_taulukko$Puutavaralaji=='M‰ntytukki',c('Kuukausi','Kantohinnat')]
kuusitukki <- hinta_taulukko[hinta_taulukko$Puutavaralaji=='Kuusitukki',c('Kuukausi','Kantohinnat')]
koivutukki <- hinta_taulukko[hinta_taulukko$Puutavaralaji=='Koivutukki',c('Kuukausi','Kantohinnat')]

# Tarvitaan vuosittainen keskiarvo kuukausittaisen kantohinnan sijaan.Lis‰ksi poistetaan vuoden 2021 data, jolle ei ole vastinetta hakkuum‰‰riss‰.

keskiarvo <- function(taulukko){
  vuosittainen_keskiarvo <- aggregate(Kantohinnat~Vuosi, transform(taulukko, Vuosi = sub('/.*', '', Kuukausi)), mean)
  return(vuosittainen_keskiarvo[vuosittainen_keskiarvo$Vuosi<2021,])
}

# Muodostetaan vuosittainen keskikantohinta puutavarlajeittain

manty_vuosittainen <- keskiarvo(mantytukki)
kuusi_vuosittainen <- keskiarvo(kuusitukki)
koivu_vuosittainen <- keskiarvo(koivutukki)

# Muodostetaan lineaariset mallit puutavaralajeittain

manty_malli <- lm(hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`~manty_vuosittainen$Kantohinnat)
kuusi_malli <- lm(hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`~kuusi_vuosittainen$Kantohinnat)
koivu_malli <- lm(hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`~koivu_vuosittainen$Kantohinnat)

summary(manty_malli)
summary(kuusi_malli)

# M‰nty- ja kuusitukin kantohinnan lineaarisen regressiomallin parametrien PNS-estimaatit eroavat tilastollisesti merkitt‰v‰sti nollasta.
# Selitysaste on kuitenkin alle 0.5, joten kantohinta ei v‰ltt‰m‰tt‰ selit‰ hakkuukertym‰‰ riitt‰v‰ll‰ tasolla. 

summary(koivu_malli)

# Koivumallin tapauksessa malli ei selv‰sti ole toimiva, joten hakkuukertym‰‰ ei kannata selitt‰‰ koivutukin hinnalla

# Piirret‰‰n viel‰ hajontakuvat datapisteist‰ ja sovitetaan niihin laskettu lineaarinen regressiomalli. 

par(mfrow=c(2,2))
plot(manty_vuosittainen$Kantohinnat,hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`)
abline(manty_malli,col='red')
plot(kuusi_vuosittainen$Kantohinnat,hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`)
abline(kuusi_malli,col='blue')
plot(koivu_vuosittainen$Kantohinnat,hakkuut_valmis$`Hakkuukertym‰ omistajaryhmitt‰in koko maassa 1985-`)
abline(koivu_malli,col='green')
