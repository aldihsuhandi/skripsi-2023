## API Specification

| field name      | remarks                            |
| --------------- | ---------------------------------- |
| API url         | \<url\>/item/approve               |
| API description | approve item submitted by merchant |
| API methods     | POST                               |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example  |
| ---------- | ---------- | --------- | --------- | ------- | -------- |
| itemId     | String     | Y         |           |         | "itemId" |

#### Example

```json
{
  "itemId": "itemId"
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

| Result Code           | Remarks                         |
| --------------------- | ------------------------------- |
| SUCCESS               | api call success                |
| PARAM_ILLEGAL         | parameter value is not expected |
| SYSTEM_ERROR          | unexpected system error         |
| USER_NOT_FOUND        | user not found                  |
| USER_NOT_ACTIVE       | user not active                 |
| ITEM_NOT_FOUND        | item not found                  |
| ITEM_ALREADY_APPROVED | item status already approved    |
| SESSION_EXPIRED       | user is not login               |

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
