# ELASTIC SEARCH DEPLOYMENT

- It has two elastic search nodes, one kibana

## Update your v-ram for the deployment ( linux )

```
sudo sysctl -w vm.max_map_count=262144
```

## How To start

```
docker compose up -d
```

## Stop the Container

```
docker compose down
```

## Run with Enterprise server

```
cd enterprize_server
docker compose up -d
```

### Note

    If you r running without enterprize server then make sure to clear volumns before restarting the deployment
