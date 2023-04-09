## API Specification

| field name      | remarks                |
| --------------- | ---------------------- |
| API url         | \<url\>/image/download |
| API description | to download image      |
| API methods     | POST                   |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
| imageId    | String     | Y         |           |         |         |

#### Example

```json
{
  "imageId": "imageId"
}
```

### Result

#### Field Table

#### Headers

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
| success    | Boolean    | Y         |           |         |         |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
| image      | byte[]     | Y         |           |         |         |

###### Possible Result Code

| Result Code     | Remarks                         |
| --------------- | ------------------------------- |
| SUCCESS         | api call success                |
| PARAM_ILLEGAL   | parameter value is not expected |
| SYSTEM_ERROR    | unexpected system error         |
| SESSION_EXPIRED | session is expired              |

#### Example

```json
{
  "image": [
    -123, 123, -123, 123, -123 
  ]
}
```
