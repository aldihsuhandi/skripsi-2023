## API Specification

| field name      | remarks                 |
| --------------- | ----------------------- |
| API url         | \<url\>/user/register   |
| API description | create new user account |
| API methods     | POST                    |

### Request
#### Field Table

##### Body

| Field Name     | Field type | Mandatory | Condition | Remarks                     | Example        |
| -------------- | ---------- | --------- | --------- | --------------------------- | -------------- |
| email          | String     | Y         |           | Must be unique              | test@email.com |
| username       | String     | Y         |           |                             | username       |
| phoneNumber    | String     | Y         |           | Must be unique              | 08000000       |
| profilePicture | String     | N         |           | Must be encoded with base64 | base64 value   |
| password       | String     | Y         |           |                             | password       |

#### Example

```json
{
    "email" : "test@email.com",
    "username": "username",
    "phoneNumber": "080000000",
    "profilePicture": "base64 value",
    "password": "password"
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
| Result Code        | Remarks                                          |
| ------------------ | ------------------------------------------------ |
| SUCCESS            | api call success                                 |
| PARAM_ILLEGAL      | parameter value is not expected                  |
| SYSTEM_ERROR       | unexpected system error                          |
| USER_ALREADY_EXIST | user already exist with a certain identification |

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