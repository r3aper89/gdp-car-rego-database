# PostgreSQL Development Environment

This repository contains the configuration files and setup instructions for a PostgreSQL development environment using Docker and Visual Studio Code (VSCode).

## Starting the Dev Container

Open VSCode Command Palette (F1) and select:

-   `Dev Container: Reopen in Container`
-   OR
-   `Dev Container: Rebuild Without Cache and Reopen in Container`

## Prerequisites

Ensure you have the following installed:

-   [Docker](https://www.docker.com/get-started)
-   [Docker Compose](https://docs.docker.com/compose/install/)
-   [Visual Studio Code](https://code.visualstudio.com/)
-   [Remote - Containers VSCode Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Directory Structure

The project directory should look like this:

```plaintext
.
├── .devcontainer
│   └── devcontainer.json
├── database
│   └── init.sql
├── Dockerfile
└── docker-compose.yml
```

## Configuration Files

### [.devcontainer/devcontainer.json](./devcontainer.json)

Configures the development environment for PostgreSQL. It specifies settings for connecting to a PostgreSQL container, including the server, port, database, username, and password. It also forwards ports 5432 and 5050, and executes a post-create command to check the PostgreSQL version.

### [Dockerfile](../Dockerfile)

Sets up a PostgreSQL database container:

This is a Dockerfile that sets up a PostgreSQL database container. It uses the latest version of the PostgreSQL image. It sets the environment variables POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB to admin, admin, and mydb respectively. It copies the init.sql file from the ./database directory to the /docker-entrypoint-initdb.d/ directory in the container. Finally, it exposes port 5432, which is the default port for PostgreSQL.

### [docker-compose.yml](../docker-compose.yml)

Builds and runs PostgreSQL and pgAdmin containers:

This is a docker-compose.yml file that sets up a PostgreSQL database container and a pgAdmin container.

The db service is built from the Dockerfile in the current directory and named postgres-db. It exposes port 5432 and sets the environment variables POSTGRES_USER, POSTGRES_PASSWORD, and POSTGRES_DB to admin, admin, and mydb respectively. It also mounts a volume named db-data to /var/lib/postgresql/data in the container. The healthcheck section checks if the PostgreSQL server is ready by running the command pg_isready -U $${POSTGRES_USER}.

The pgadmin service uses the dpage/pgadmin4 image and is named pgadmin. It exposes port 5050 and sets the environment variables PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD to admin@admin.com and admin respectively. It depends on the db service to start only when the PostgreSQL server is healthy.

The volumes section defines a volume named db-data that uses the local driver for persistent storage.

## Database Initialization Script

### database/init.sql

Creates tables and inserts sample data:

## Accessing the Database

### pgAdmin

Access pgAdmin at [http://localhost:5050](http://localhost:5050) with credentials:

-   Email: `admin@admin.com`
-   Password: `admin`

### PostgreSQL Client Tools

Install the [PostgreSQL Client Tools for VSCode](https://marketplace.visualstudio.com/items?itemName=ms-ossdata.vscode-postgresql).

Open the Command Palette (Ctrl + Shift + P) and select `PostgreSQL: New Query`.

### Connect to Docker Container

```sh
# Get the container ID
docker ps

# Open a shell in the container from outside container
docker exec -it container_id sh

# Log in to PostgreSQL
psql -h localhost -U admin -d mydb

# List tables
\dt

# Query the table to verify the data
SELECT * FROM fleet_cars;
SELECT * FROM car_models;
SELECT * FROM car_brands;
```

## References

-   [PostgreSQL Docker Official Image](https://hub.docker.com/_/postgres)
-   [Creating a PostgreSQL Docker Container](https://forums.docker.com/t/how-to-make-a-docker-file-for-your-own-postgres-container/126526)
-   [Using the PostgreSQL Docker Image](https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/)
-   [Setting Up PostgreSQL with Docker](https://www.dbvis.com/thetable/how-to-set-up-postgres-using-docker/)
-   [Creating a PostgreSQL Database with Docker](https://dev.to/andre347/how-to-easily-create-a-postgres-database-in-docker-4moj)
-   [awesome-compose repository](https://github.com/docker/awesome-compose/blob/master/postgresql-pgadmin/README.md).
