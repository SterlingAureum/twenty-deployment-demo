# PostgreSQL Password Reset Guide (Preserve Data)

> Note: In the Twenty project, only PostgreSQL (`db`) uses a password. Redis does not require a password by default. Other services read the database password from the `.env` file.  
> This procedure **will not delete any database data**, it only updates the user password.

---

## 1️⃣ Confirm the Database Service Name

In `docker-compose.yml`, PostgreSQL service is usually named `db`:

```bash
services:
  db:
    image: postgres:15
    ...
```
Replace <db_container_name> with the actual container name found via docker ps.

## 2️⃣ Access the PostgreSQL Container
```bash
docker exec -it <db_container_name> psql -U postgres
```

Example:
```bash
docker exec -it twenty-db-1 psql -U postgres
```

- -U postgres logs in as the default superuser

- Once inside psql, you can update the password

## 3️⃣ Change the PostgreSQL Password

Inside the psql prompt:

```bash
ALTER USER postgres PASSWORD 'new_password';
\q
```


- Replace 'new_password' with your desired password

- If another user is used by your services, modify that username instead

## 4️⃣ Update the .env File

Open the project .env file:

```bash
nano .env
### or vim .env
```


Update PG_DATABASE_PASSWORD:
```bash
PG_DATABASE_PASSWORD=new_password
```

Save the file.

## 5️⃣ Restart the Project

Apply the new password:

```bash
docker compose up -d
```

The project will restart all services

twenty-server-1 will use the updated password to connect to PostgreSQL

Database data will remain intact

## 6️⃣ Verify the Password

Check logs to confirm successful connection:

```bash
docker compose logs twenty-server-1
```

There should no longer be any error like:

FATAL: password authentication failed for user "postgres"

## 7️⃣ Important Notes

Do not use docker compose down -v, it will remove volumes and all database data

The .env password must match the actual database password

PostgreSQL is the only service using a password; Redis does not require one by default
