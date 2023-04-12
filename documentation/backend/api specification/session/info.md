## API Specification

| field name      | remarks              |
| --------------- | -------------------- |
| API url         | \<url\>/session/info |
| API description | getting session info |
| API methods     | POST                 |

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
|            |            |           |           |         |         |

#### Example

```json
{
}
```

### Result

#### Field Table

##### Body

| Field Name     | Field type     | Mandatory | Condition | Remarks | Example |
| -------------- | -------------- | --------- | --------- | ------- | ------- |
| resultContext  | ResultContext  | Y         |           |         |         |
| sessionSummary | SessionSummary | Y         |           |         |         |

##### SessionSummary

| Field Name   | Field type | Mandatory | Condition | Remarks              | Example |
| ------------ | ---------- | --------- | --------- | -------------------- | ------- |
| email        | String     | Y         |           |                      |         |
| isRemembered | Boolean    | Y         |           |                      | true    |
| sessionDt    | Date       | Y         |           | session expired time | true    |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

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
  "sessionSummary": {
    "email": "bruh@bruh.com",
    "sessionDt": Date,
    "isRemembered": false
  },
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  }
}
```
