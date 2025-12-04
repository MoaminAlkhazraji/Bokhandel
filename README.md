Inlämning 1: Databasdesign för Liten Bokhandel
Skapad av: Moamin Al-khazraji, YH25


Denna inlämning presenterar SQL-schemat för en databas, designad för att hantera informationen i en "Liten Bokhandel". Databasen är strukturerad i relaterade tabeller som beskriver böcker, kunder och beställningsprocessen.


Databasen består av fyra huvudtabeller:

Kunder: Lagrar person- och kontaktuppgifter för kunder.

Böcker: Lagrar information om tillgängliga titlar, inklusive pris och lagerstatus.

Beställningar: Håller reda på lagda ordrar med datum och totalbelopp.

Orderrader: En kopplings- och detaljtabell som specificerar exakt vilka böcker som ingår i varje order.    


Relationerna mellan tabellerna säkerställs med hjälp av primärnycklar (PK) och främmande nycklar (FK) för att upprätthålla dataintegritet:

En kund kan göra flera beställningar:
KundID är primärnyckel i Kunder och används som främmande nyckel i Beställningar för att koppla en order till en specifik kund.

En beställning kan innehålla flera orderrader:
Ordernummer är primärnyckel i Beställningar och används som främmande nyckel i Orderrader för att gruppera alla artiklar under en och samma order. 


En bok kan finnas på flera orderrader (i olika beställningar):
ISBN är primärnyckel i Böcker och används som främmande nyckel i Orderrader för att specificera vilken bok som faktiskt beställts.

<img width="781" height="401" alt="Bokhandel" src="https://github.com/user-attachments/assets/f22b197c-f28f-4174-b741-03ac75eff998" />
