select current_user(); // wyświetlanie zalogowanych użytkowników

select user(); // wyświetlanie zalogowanych użytkowników

select user from mysql.user; // wyświetlanie wszystkich istniejących użytkowników

show GRANTS; // wyświetlanie uprawnień zalogowanego użytkownika

create user 'nazwa_użytkownika'@'localhost'; // tworzenie użytkownika

grant all PRIVILEGES on *.* to 'nazwa_użytkownika'@'localhost' identified by 'qwerty' with grant option; // tworzenie użytkownika z pełnymi uprawnieniami

grant all PRIVILEGES on *.* to 'root'@'localhost' identified by 'qwerty' with grant option; //nadanie hasła rootowi

use mysql;
delete user from mysql.user where user='root'; //usuwanie roota

create user 'bibliotekarz'@'localhost'; //utworzenie użytkownika bibliotekarz
grant all PRIVILEGES on biblioteka.* to 'bibliotekarz'@'localhost' identified by 'qwerty'; // który ma kontrolę nad konkretną bazą biblioteka;

revoke all PRIVILEGES on biblioteka.* from 'bibliotekarz'@'localhost'; // usuwanie uprawnień
flush PRIVILEGES; // czyszczenie/aktualizacja uprawnień 

grant select on biblioteka.autorzy to 'bibliotekarz'@'localhost' // nadawanie uprawnień do wyświetlania danych z bazy 

alter user 'bibliotekarz'@'localhost' identified by 'qwerty123'; //zmiana hasła

alternatywnie:

UPDATE mysql.user SET authentication_string = PASSWORD('nowe_hasło') WHERE User = 'użytkownik' AND Host = 'localhost';
FLUSH PRIVILEGES;

-- ZADANIE 2 

create user '4isuperuser4i'@'localhost';
grant all PRIVILEGES on *.* to '4isuperuser4i'@'localhost' identified by 'qwerty' with grant option;


-- ZADANIE 4

CREATE DATABASE zwierzaki4i

-- ZADANIE 6 


