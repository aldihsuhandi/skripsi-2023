## API Specification

| field name      | remarks           |
| --------------- | ----------------- |
| API url         | \<url\>/user/info |
| API description | query user info   |
| API methods     | POST              |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks                   | Example          |
| ---------- | ---------- | --------- | --------- | ------------------------- | ---------------- |
| key        | String     | Y         |           |                           | "user@email.com" |
| identifier | String     | Y         |           | email,phonenumber,user_id | "email"          |

#### Example

```json
{
  "head": {
    "clientId": "clientId",
    "clientSecret": "clientSecret"
  },
  "body": {
    "key": "user@email.com",
    "identifier": "email"
  }
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| userInfo      | UserVO        | Y         |           |         |         |

##### UserVO
| Field Name     | Field type | Mandatory | Condition | Remarks          | Example          |
| -------------- | ---------- | --------- | --------- | ---------------- | ---------------- |
| userId         | String     | Y         |           |                  | "userId"         |
| username       | String     | Y         |           |                  | "username"       |
| email          | String     | Y         |           |                  | "user@email.com" |
| phoneNumber    | String     | Y         |           |                  | "081234567890"   |
| profilePicture | Blob       | N         |           |                  |                  |
| isActive       | boolean    | Y         |           |                  | true             |
| isDeleted      | boolean    | Y         |           |                  | false            |
| password       | String     | Y         |           | will be censored | "**********"     |
| roleInfo       | RoleVO     | Y         |           |                  |                  |

##### RoleVO
| Field Name | Field type | Mandatory | Condition | Remarks | Example    |
| ---------- | ---------- | --------- | --------- | ------- | ---------- |
| roleId     | String     | Y         |           |         | "roleId"   |
| roleName   | String     | Y         |           |         | "roleName" |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code

| Result Code   | Remarks                         |
| ------------- | ------------------------------- |
| SUCCESS       | api call success                |
| PARAM_ILLEGAL | parameter value is not expected |
| SYSTEM_ERROR  | unexpected system error         |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "userInfo": {
    "userId": "userId",
    "userName": "userName",
    "email": "user@email.com",
    "phoneNumber": "081234567890",
    "profilePicture": blob,
    "isActive": true,
    "isDeleted": false,
    "password": "*********",
    "roleInfo": {
      "roleId": "roleId",
      "roleName": "roleName"
    }
  }
}
```
