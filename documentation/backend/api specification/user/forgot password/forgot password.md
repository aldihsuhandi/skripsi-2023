## API Specification

| field name      | remarks                     |
| --------------- | --------------------------- |
| API url         | \<url\>/user/reset_password |
| API description | user forgot password        |
| API methods     | POST                        |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name      | Field type | Mandatory | Condition | Remarks                                                                                                              | Example           |
| --------------- | ---------- | --------- | --------- | -------------------------------------------------------------------------------------------------------------------- | ----------------- |
| email           | String     | Y         |           | must be a valid email address                                                                                        | "email@email.com" |
| password        | String     | Y         |           | - atleast 8 chacater in length<br>- atleast 1 non capital letter<br>- atleast 1 number<br>- atleast 1 capital letter | "password"        |
| confirmPassword | String     | Y         |           | must be the same with password                                                                                       | "password"        |

#### Example

```json
{
  "email": "email@email.com",
  "password": "password",
  "confirmPassword": "password"
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

| Result Code    | Remarks                         |
| -------------- | ------------------------------- |
| SUCCESS        | api call success                |
| PARAM_ILLEGAL  | parameter value is not expected |
| SYSTEM_ERROR   | unexpected system error         |
| USER_NOT_FOUND | user not exist                  |

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
