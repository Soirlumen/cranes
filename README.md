# SCOTLAND FOREVER !!!
> anyway
## Databáze jeřábů =)
1. potřebujeme docker nebo podman
2. potřebujeme být ve složce s docker-compose.yml a init.sql
3. 
```cmd
docker-compose up -d
```
4. přejdi do SQL
```sql
docker exec -it moje_stavebni_db psql -U postgres
```
5. připojit do app přes: postgresql://postgres:tajneheslo@localhost:5432/postgres
6. přihlašovací údaje
    - Host: localhost
    - Port: 5432
    - Uživatel: postgres
    - Heslo: tajneheslo
    - Výchozí databáze: postgres
