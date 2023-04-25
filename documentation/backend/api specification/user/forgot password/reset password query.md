## API Specification

| field name      | remarks                            |
| --------------- | ---------------------------------- |
| API url         | \<url\>/user/forgot_password/query |
| API description | query forgot password request      |
| API methods     | POST                               |

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
| uuid       | String     | Y         |           |         |         |

#### Example

```json
{
  "uuid": "uuid"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| email         | String        | Y         |           |         |         |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code

| Result Code       | Remarks                         |
| ----------------- | ------------------------------- |
| SUCCESS           | api call success                |
| PARAM_ILLEGAL     | parameter value is not expected |
| SYSTEM_ERROR      | unexpected system error         |
| SESSION_EXPIRED   | session is expired              |
| REQUEST_NOT_FOUND | uuid request is not found       |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "email": "email"
}
```
