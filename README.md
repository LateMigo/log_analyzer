![CI](https://github.com/LateMigo/log-analyzer/actions/workflows/ci.yml/badge.svg)
# log-analyzer

Prosty skrypt w Bashu, który analizuje logi SSH (`auth.log`) i pokazuje, z jakich adresów IP było najwięcej nieudanych prób logowania. Przydaje się do szybkiego wykrywania prób brute-force.

## Jak to działa

Skrypt wyszukuje w logu linie z `Failed password`, wyciąga z nich adres IP, zlicza wystąpienia i wypisuje je od największej liczby prób do najmniejszej:

```
grep "Failed password" plik | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn
```

## Użycie

```bash
chmod +x analyze.sh
./analyze.sh plik_logu
```

Przykład na dołączonym pliku `sample.log`:

```bash
./analyze.sh sample.log
```

Przykładowe wyjście (liczba prób, adres IP):

```
      6 203.0.113.5
      3 203.0.113.7
      2 198.51.100.4
      1 203.0.113.9
```

Skrypt kończy się kodem 1 i wypisuje komunikat, gdy nie podano pliku lub plik nie istnieje.

## Testy

```bash
chmod +x test.sh
./test.sh
```

Test uruchamia analizator na `sample.log` i porównuje wynik z `expected.txt`. Wypisuje `OK` albo pokazuje różnice.

## Zawartość repozytorium

| Plik | Opis |
|------|------|
| `analyze.sh` | właściwy skrypt |
| `sample.log` | przykładowy log z adresami z zakresów dokumentacyjnych (RFC 5737) |
| `expected.txt` | oczekiwany wynik dla `sample.log` |
| `test.sh` | prosty test porównujący wynik z oczekiwanym |

## Plany

- opcja progu (pokazuj tylko IP z co najmniej N próbami)
- liczenie nazw użytkowników, na które próbowano się logować
- GitHub Actions: automatyczne uruchamianie testów
- Docker: obraz z narzędziem i publikacja w GitHub Container Registry
- wersja w C do porównania wydajności

## Autor

Kajetan Puzio
