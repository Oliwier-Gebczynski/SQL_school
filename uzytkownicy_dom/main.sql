
--1. Zaloguj się na konto ROOT
--2. Utwórz super-usera z pełnymi prawami do wszystkiego (nazwa to 4superuser4).
Create user '4superuser4'@'localhost' identified by 'qwerty';
grant all privileges on *.* to '4superuser4'@'localhost' with grant option;
--3. Zaloguj się na konto 4bsuperuser4b.
--4. Utwórz bazę "zwierzaki4b".
create database zwierzaki4b;
--5. Do bazy dodaj 3 tabele (kopiuj-wklej):
--6. Do tabel dodaj rekordy (kopiuj-wklej):
--7. Utwórz uzytkownikow:
	--7.1. admin_zwierzaki mający pełne praca do całej bazy zwierzaki;
    create user 'admin_zwierzaki'@'localhost' identified by 'qwerty';
    grant all privileges on zwierzaki4b.* to 'admin_zwierzaki'@'localhost' with grant option;
	--7.2. admin_kotki mający pełne prawa do tabeli kotki;
    create user 'admin_kotki'@'localhost' identified by 'qwerty';
    grant all privileges on zwierzaki4b.kotki to 'admin_kotki'@'localhost';
	--7.3. admin_pieski mający pełne prawa do tabeli pieski;
    create user 'admin_pieski'@'localhost' identified by 'qwerty';
    grant all privileges on zwierzaki4b.pieski to 'admin_pieski'@'localhost';
	--7.4. admin_swinki mający pełne prawa do tabeli swinki;
    create user 'admin_swinki'@'localhost' identified by 'qwerty';
    grant all privileges on zwierzaki4b.swinki to 'admin_swinki'@'localhost';
	--7.5. maniek mający prawo do wyświetlania danych z tabeli kotki;
    create user 'maniek'@'localhost' identified by 'qwerty';
    grant select on zwierzaki4b.kotki to 'maniek'@'localhost';
	--7.6. jozek mający prawo do dodawania, usuwania oraz wyswietlania danych z tabeli pieski;
    create user 'jozek'@'localhost' identified by 'qwerty';
    grant insert, delete, select on zwierzaki4b.pieski to 'jozek'@'localhost';
	--7.7. bronek mający prawo do tworznia, aktualizowania tabel w bazie, oraz do wyświetlania danych z tabeli kotki i swinki.
    create user 'bronek'@'localhost' identified by 'qwerty';
    grant create, update on zwierzaki4b.* to 'bronek'@'localhost';
    grant select on zwierzaki4b.kotki to 'bronek'@'localhost';
    grant select on zwierzaki4b.swinki to 'bronek'@'localhost';