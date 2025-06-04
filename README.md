# Simple JSON Bin API with FastAPI and TinyDB

This is a minimal REST API built with [FastAPI](https://fastapi.tiangolo.com/) and [TinyDB](https://tinydb.readthedocs.io/). It allows storing and retrieving JSON data using a unique identifier (`bin_id`). Data is persisted locally in a JSON file.

## API Documentation

This API allows you to store and retrieve JSON data using a unique identifier (`bin_id`). Data is saved in a local JSON file via TinyDB.

## GET `/bins/{bin_id}`

### Description
Retrieves the data associated with the given `bin_id`.

### Path Parameters

| Parameter | Type   | Required | Description                     |
| --------- | ------ | -------- | ------------------------------- |
| `bin_id`  | string | Yes      | The unique ID of the data entry |

## POST `/bins/{bin_id}`

### Description
Creates a new bin or updates an existing one with the specified `bin_id`. The data must be provided as a JSON object in the request body.

### Path Parameters

| Parameter | Type   | Required | Description                     |
| --------- | ------ | -------- | ------------------------------- |
| `bin_id`  | string | Yes      | The unique ID of the data entry |

### Request Body

| Field     | Type | Required | Description                        |
| --------- | ---- | -------- | ---------------------------------- |
| (any key) | any  | Yes      | JSON object with arbitrary content |

The request body must be a valid JSON object. Example:

```json
{
  "foo": "bar",
  "number": 123
}
```

## Running the API with Docker Compose

You can easily containerize and run this FastAPI + TinyDB app using Docker Compose.

### `docker-compose.yml`

```yaml
services:
  app:
    image: varhegyisz/jsonbin-server
    volumes:
      - ./db.json:/app/db.json
    ports:
      - 8000:8000
```

