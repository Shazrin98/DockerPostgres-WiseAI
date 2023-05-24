# Use the official PostgreSQL image as the base image
FROM postgres:12

# Expose the PostgreSQL port (default: 5432)
EXPOSE 5432

# Set environment variables for PostgreSQL configuration
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=prisma

# Copy initialization script, if needed
# COPY init.sql /docker-entrypoint-initdb.d/

# Optionally, mount a volume for persistent data
# VOLUME /var/lib/postgresql/data

# Start the PostgreSQL service automatically when the container starts
CMD ["postgres"]