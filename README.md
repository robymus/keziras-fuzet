# Generator for Hungarian penmanship paper

Simple scripts to generate penmanship lined practice papers according to Hungarian school size specification.

# Kézírás vonalas füzet lap generáló

A program otthoni kézírás gyakorláshoz generál nyomtatható PDF fileokat. A generált lapokon csak a vízszintes vonalak szerepelnek, nincsenek margók.

## Kész PDF fileok

A generált kész PDF fileok az *pdf* mappában találhatóak.

## Típusok

Méret információ forrás: [lurkovilag.hu](https://lurkovilag.hu/vonalas-fuzet-de-milyen/)

### Első osztályos vonalas füzet

- a füzet vonalazása egy vastagabb alapvonalból és két vékonyabb segédvonalból áll
- két alapvonal közti távolság: 12 mm
- füzetkód: 14-32

### Második osztályos vonalas füzet

- a füzet vonalazása szintén egy vastagabb alapvonalból és két vékonyabb segédvonalból áll
- két alapvonal közti távolság azonban csak: 10 mm
- füzetkód: 16-32

### Harmadik osztályos vonalas füzet

- nincs segédvonal, csak alapvonal
- két alapvonal közti távolság: 10 mm
- füzetkód: 12-32

### Negyedik (és felső) osztályos vonalas füzet

- ez a klasszikus vonalas füzet, amit a gyerekek felsőbb osztályban is használni fognak
- itt is csak alapvonal van, amiknek a távolsága: 7 mm
- füzetkód: 31-32

## Használat

A `prawn` gem telepítése szükséges a program futtatásához.

` gem install prawn`

A program két paramétert vár

- méret: [1|2|3|4] hanyadik osztályos füzetet generáljon (a fenti táblázat szerint)
- kimeneti file neve

Példa:

`ruby fuzet.rb 1 elsos.pdf`
