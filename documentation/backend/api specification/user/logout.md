## API Specification

| field name      | remarks                 |
| --------------- | ----------------------- |
| API url         | \<url\>/user/logout     |
| API description | deactivate user session |
| API methods     | POST                    |

### Request
#### Field Table

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
| isSuccess  | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code
| Result Code          | Remarks                         |
| -------------------- | ------------------------------- |
| SUCCESS              | api call success                |
| PARAM_ILLEGAL        | parameter value is not expected |
| SYSTEM_ERROR         | unexpected system error         |
| AUTHENTICATION_ERROR | user is not login               |

#### Example

```json
{
    "resultContext" : {
        "isSuccess": true,
        "resultMsg": "SUCCESS",
        "resultCode": "SUCCESS"
    }
}
```