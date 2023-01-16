## API Specification

| field name      | remarks                       |
| --------------- | ----------------------------- |
| API url         | \<url\>/user/login            |
| API description | create login session for user |
| API methods     | POST                          |

### Request
#### Field Table

##### Head
| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks                         | Example        |
| ------------ | ---------- | --------- | --------- | ------------------------------- | -------------- |
| email        | String     | Y         |           | must be formatted like an email | test@gmail.com |
| password     | String     | Y         |           |                                 | password       |
| isRemembered | Boolean    | N         |           | default value is false          | false          |

#### Example

```json
{
    "head": {
        "clientId": "clientId",
        "clientSecret": "clientSecret"
    },
    "body": {
        "email": "test@gmail.com",
        "password": "password"
    }
}
```

### Result
#### Field Table

##### Body


| Field Name    | Field type    | Mandatory | Condition | Remarks                                                                                       | Example                          |
| ------------- | ------------- | --------- | --------- | --------------------------------------------------------------------------------------------- | -------------------------------- |
| resultContext | ResultContext | Y         |           |                                                                                               |                                  |
| sessionId     | String        | Y         |           | session id for this specific user, will be deactivated in 5 minutes if there is no activities | e39992f3048042aeae2c279074ee40bc |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code
| Result Code           | Remarks                                             |
| --------------------- | --------------------------------------------------- |
| SUCCESS               | api call success                                    |
| PARAM_ILLEGAL         | parameter value is not expected                     |
| SYSTEM_ERROR          | unexpected system error                             |
| USER_NOT_FOUND        | if there is no user by that specific identification |
| USER_NOT_ACTIVE       | user is not active yet                              |
| AUTHENTICATION_FAILED | authentication password doesn't match               |

#### Example

```json
{
    "resultContext" : {
        "success": true,
        "resultMsg": "SUCCESS",
        "resultCode": "SUCCESS"
    },
    "sessionId" : "e39992f3048042aeae2c279074ee40bc"
}
```