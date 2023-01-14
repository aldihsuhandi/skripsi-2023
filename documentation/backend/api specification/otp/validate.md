## API Specification

| field name      | remarks              |
| --------------- | -------------------- |
| API url         | \<url\>/otp/validate |
| API description | validate otp         |
| API methods     | POST                 |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks                         | Example           |
| ---------- | ---------- | --------- | --------- | ------------------------------- | ----------------- |
| email      | String     | Y         |           |                                 | "email@email.com" |
| otpType    | String     | Y         |           | USER_ACTIVATION,FORGOT_PASSWORD | "USER_ACTIVATION" |
| otp        | String     | Y         |           |                                 | "123456"          |

#### Example

```json
{
  "head": {
    "clientId": "clientId",
    "clientSecret": "clientSecret"
  },
  "body": {
    "email": "email@email.com",
    "otpType": "USER_ACTIVATION",
    "otp": "123456"
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

| Result Code          | Remarks                                        |
| -------------------- | ---------------------------------------------- |
| SUCCESS              | api call success                               |
| PARAM_ILLEGAL        | parameter value is not expected                |
| SYSTEM_ERROR         | unexpected system error                        |
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
