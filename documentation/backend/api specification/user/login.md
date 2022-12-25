## API Specification

| field name      | remarks                       |
| --------------- | ----------------------------- |
| API url         | \<url\>/user/login            |
| API description | create login session for user |
| API methods     | POST                          |

### Request
#### Field Table

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks                         | Example        |
| ------------ | ---------- | --------- | --------- | ------------------------------- | -------------- |
| email        | String     | Y         |           | must be formatted like an email | test@gmail.com |
| password     | String     | Y         |           |                                 | password       |
| isRemembered | Boolean    | N         |           | default value is false          | false          |

#### Example

```json
{
    "email": "test@gmail.com",
    "password": "password"
}
```

### Result
#### Field Table

##### Body


| Field Name  | Field type | Mandatory | Condition | Remarks                                                                                       | Example                          |
| ----------- | ---------- | --------- | --------- | --------------------------------------------------------------------------------------------- | -------------------------------- |
| Result Code | ResultCode | Y         |           |                                                                                               |                                  |
| sessionId   | String     | Y         |           | session id for this specific user, will be deactivated in 5 minutes if there is no activities | e39992f3048042aeae2c279074ee40bc |

##### ResultCode

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| isSuccess  | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code
| Result Code          | Remarks                                             |
| -------------------- | --------------------------------------------------- |
| SUCCESS              | api call success                                    |
| PARAM_ILLEGAL        | parameter value is not expected                     |
| SYSTEM_ERROR         | unexpected system error                             |
| USER_NOT_FOUND       | if there is no user by that specific identification |
| AUTHENTICATION_ERROR | authentication password doesn't match               |

#### Example

```json
{
    "resultCode" : {
        "isSuccess": true,
        "resultMsg": "SUCCESS",
        "resultCode": "SUCCESS"
    },
    "sessionId" : "e39992f3048042aeae2c279074ee40bc"
}
```