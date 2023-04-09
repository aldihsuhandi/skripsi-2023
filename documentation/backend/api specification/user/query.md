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
    "key": "user@email.com",
    "identifier": "email"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| userInfo      | UserSummary   | Y         |           |         |         |

#### UserSummary
| Field Name     | Field type | Mandatory | Condition | Remarks             | Example |
| -------------- | ---------- | --------- | --------- | ------------------- | ------- |
| email          | String     | Y         |           |                     |         |
| phoneNumber    | String     | Y         |           |                     |         |
| username       | String     | Y         |           |                     |         |
| profilePicture | Blob       | Y         |           |                     |         |
| role           | String     | Y         |           | USER/MERCHANT/ADMIN |         |
| gmtCreate      | Date       | Y         |           |                     |         |
| gmtModified    | Date       | Y         |           |                     |         |

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
    "role": "USER"
  }
}
```
