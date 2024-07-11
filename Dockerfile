# Use the latest stable PostgreSQL image
FROM postgres:13

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=mydb

# Copy the initialization SQL script to the appropriate directory
COPY ./database/init.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432