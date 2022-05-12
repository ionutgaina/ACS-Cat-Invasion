# ACS-Cat-Invasion

# TASK 1    - Simple

Am folosit în plus doar registrul EAX
Iau litera din plain
o adun cu cheia ( ASCI )
Verific dacă a trecut peste litera Z
Daca da, scad cu 26, astfel raman in raza 'A' - 'Z'



# TASK 2.1  - Points distance

Am folosit registrele ESI și EDI
Mai exact pe 16 biți ( SI ) și ( DI )
Am verificat daca sunt egale pentru că știm că x sau y pot fi paralele pe axa lor 
formula fiind sqrt((x_2-x_1)^2 + (y2-y1)^2) vom ramane doar cu sqrt((x_2-x_1)^2) sau cu sqrt((y_2-y_1)^2), astfel vom ramane pana la urma cu 
abs(x_2-x_1) sau abs(y_2-y_1), de asta vom compara cu 0 și vom nega valoarea dacă aceasta e negativă



# Task 2.2  - Road

Folosim functia points_distance din task2.1 intr-un while
si trecem prin vectorii de elemente



# Task 2.3   - Is square

Mai intai avem un while care trece prin toate elemente poi
Am mai facut un fel de for transformat in while ( sau e aceeasi chestie in assembly)
care face for ( i = 1 ; i * i <= (distance value) ; i++)



# Task 3     - Beaufort

Ne folosim de niste formule, pentru care nu mai va fi nevoie să parcurgem și
să lucrăm cu matrice, astfel dacă avem
Litera cheie notată cu a
Litera din plain notată cu b

Dacă în ASCI a >= b ( deasupra diagonala secundara inclusiv diagonala )
atunci vom avea formula a - b + 'A' rezultand litera criptata

pentru a < b  ( sub diagonala secundara fara diagonala)
vom avea formula 'Z' - b + a + 1 rezultand litear criptata



# Task 4    - Spiral

Am observat că trebuie să parcurgem pe cadrane și vor fi floor(n/2) cadrane, dar dacă n e impar nu va lua și elementul din mijloc
care este luat în seamă la sfârșit

În cadran vom avea de parcurs 4 laturi ( sus , dreapta , jos , stanga )

vom avea registre salvate care vor fi variabile in intermediul trecerii laturilor

C/C++ :
for ( int i = 0 ; i < n/2 ; i ++ )

pentru latura de sus
vom parcurge matricea cheie lucrand doar pe adresa
astfel noi stiind ca avem nevoie de urmatorul element din rand ( urmatoarea coloana ),
astfel doar adunam adresa cu 4 si lucram pe element de la i pana la n-i  ori
i < n-i
i++


pentru latura din dreapta
vom parcurge matricea cheie lucrand doar pe adresa
astfel noi stiind ca avem nevoie de urmatorul element din coloana ( urmatorul rand ),
astfel doar adunam adresa cu 4 * n si lucram pe element de la i pana la n-i ori
i < n-i
i++


pentru latura de jos
vom parcurge matricea cheie lucrand doar pe adresa
astfel noi stiind ca avem nevoie de elementul din stanga din rand ( coloana din stanga ),
astfel doar scadem adresa cu 4 si lucram pe element de la i pana la n-i ori
i < n-i
i++


pentru latura din stanga
vom parcurge matricea cheie lucrand doar pe adresa
astfel noi stiind ca avem nevoie de elementul de mai sus din coloana ( randul de mai sus ),
astfel doar scadem adresa cu 4 * n si lucram pe element de la i pana la n-i ori
i < n-i
i++


Dupa ce facem operatiile de mai sus
Ne ducem la urmatorul cadran, intrucat noi
acum vom fi in pozitia inceputului al primului cadran

astfel vom aduna adresa ecx cu 4*n + 4
( urmatorul rand si urmatoarea coloana )

cam atat pentru matrice si cadrane ( while ul mare - while_matrix )

daca n%2 == 1 ( restul va fi pastrat in edx)

vom face pur si simplu criptarea, intrucat noi deja suntem pe pozitia care trebuie din operatiile anterioare.

# Cam atât

