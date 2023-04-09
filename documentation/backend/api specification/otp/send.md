## API Specification

| field name      | remarks                     |
| --------------- | --------------------------- |
| API url         | \<url\>/otp/send            |
| API description | send otp to requested email |
| API methods     | POST                        |

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

#### Example

```json
{
  "email": "email@email.com",
  "otpType": "USER_ACTIVATION"
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

| Result Code    | Remarks                                |
| -------------- | -------------------------------------- |
| SUCCESS        | api call success                       |
| PARAM_ILLEGAL  | parameter value is not expected        |
| SYSTEM_ERROR   | unexpected system error                |
| USER_NOT_FOUND | no user found with that specific email |

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
