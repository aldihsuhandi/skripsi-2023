## API Specification

| field name      | remarks                 |
| --------------- | ----------------------- |
| API url         | \<url\>/session/logout  |
| API description | deactivate user session |
| API methods     | POST                    |

### Request
#### Field Table

##### Head
| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example                          |
| ---------- | ---------- | --------- | --------- | ------- | -------------------------------- |
| sessionId  | String     | Y         |           |         | e39992f3048042aeae2c279074ee40bc |

#### Example

```json
{
    "sessionId": "e39992f3048042aeae2c279074ee40bc"
}
```

### Result
#### Field Table

##### Body


| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |

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
| SESSION_EXPIRED | user is not login               |

#### Example

```json
{
    "resultContext" : {
        "success": true,
        "resultMsg": "SUCCESS",
        "resultCode": "SUCCESS"
    }
}
```
