# Troubleshooting & Optimization Notes

## Redis Container Restart or OOM
- Check the `maxmemory` configuration
- Check available memory on the host machine

## Data Loss
- Ensure the volumes are mapped correctly
- AOF persistence is enabled

## Docker Compose Issues
- Use `docker compose logs -f` to view logs
- Ensure the official `docker-compose.yml` has been fully downloaded

## Optimization Recommendations
- **Redis**: Use a combination of AOF and RDB snapshots for stronger persistence. Monitor memory usage and adjust `maxmemory` as needed for production workloads.
- **Database**: Consider regular backups of PostgreSQL data volume to prevent accidental data loss during updates or migrations.
- **Application**: Keep environment variables in a `.env` file and avoid hardcoding secrets in the docker-compose.yml. Use `APP_SECRET` and database passwords securely.
- **Performance**: For production, consider running Redis and PostgreSQL on dedicated resources or separate nodes to reduce resource contention.

