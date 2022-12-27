## API Specification

| field name      | remarks             |
| --------------- | ------------------- |
| API url         | \<url\>/user/update |
| API description | Update user profile |
| API methods     | POST                |

### Request
#### Field Table

##### Head
| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name        | Field type        | Mandatory | Condition | Remarks | Example  |
| ----------------- | ----------------- | --------- | --------- | ------- | -------- |
| password          | String            | Y         |           |         | password |
| userUpdateContext | UserUpdateContext | Y         |           |         |          |

##### UserUpdateContext

| Field Name     | Field type | Mandatory | Condition | Remarks                     | Example        |
| -------------- | ---------- | --------- | --------- | --------------------------- | -------------- |
| email          | String     | N         |           | Must be unique              | test@email.com |
| username       | String     | N         |           |                             | username       |
| phoneNumber    | String     | N         |           | Must be unique              | 08000000       |
| profilePicture | Blob       | N         |           | Must be encoded with base64 | base64 value   |
| password       | String     | N         |           |                             | password       |

#### Example

```json
{
    "head": {
        "clientId": "clientId",
        "clientSecret": "clientSecret",
        "sessionId": "e39992f3048042aeae2c279074ee40bc"
    },
    "body": {
        "password": "password",
        "email": "email",
        "userUpdateContext": {
            "email" : "test@email.com",
            "username": "username",
            "phoneNumber": "080000000",
            "profilePicture": "base64 value",
            "password": "new password"
        }
    }
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
| Result Code        | Remarks                                          |
| ------------------ | ------------------------------------------------ |
| SUCCESS            | api call success                                 |
| PARAM_ILLEGAL      | parameter value is not expected                  |
| SYSTEM_ERROR       | unexpected system error                          |
| SESSION_EXPIRED    | user is not login                                |
| USER_ALREADY_EXIST | user already exist with a certain identification |

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