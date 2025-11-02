# Deployment Guide

## Environment Requirements
- Docker >= 20.x
- Docker Compose >= 2.x
- Linux / WSL2 / macOS

## Deployment Steps
1. Clone the repository
2. Run `scripts/install.sh`
3. Start Docker Compose (including the override file)

## Redis Optimization
- **Persistence**: AOF + Docker volume for `/data`
- **Memory Limit**: 512MB to prevent container or host OOM
- **Memory Policy**: `noeviction` for data safety; write errors can be caught

## Verification
- Test Redis key-value storage and ensure data persists after restart
- Use `docker ps` to check service status

