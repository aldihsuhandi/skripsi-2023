## API Specification

| field name      | remarks                |
| --------------- | ---------------------- |
| API url         | \<url\>/user/activate  |
| API description | activate user with otp |
| API methods     | POST                   |

### Request

#### Field Table

##### Headers

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example           |
| ---------- | ---------- | --------- | --------- | ------- | ----------------- |
| email      | String     | Y         |           |         | "email@email.com" |
| otp        | String     | Y         |           |         | "123456"          |

#### Example

```json
{
  "email": "email@email.com",
  "otp": "123456"
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

| Result Code          | Remarks                                        |
| -------------------- | ---------------------------------------------- |
| SUCCESS              | api call success                               |
| PARAM_ILLEGAL        | parameter value is not expected                |
| SYSTEM_ERROR         | unexpected system error                        |
| USER_NOT_FOUND       | user doesn't exist                             |
| OTP_NOT_EXIST        | there is no otp request in this specific email |
| OTP_VALIDATION_ERROR | otp validation error                           |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  }
}
```
