## API Specification

| field name      | remarks                  |
| --------------- | ------------------------ |
| API url         | \<url\>/comment/edit     |
| API description | to edit existing comment |
| API methods     | POST                     |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
| commentId  | String     | Y         |           |         |         |
| content    | String     | Y         |           |         |         |

#### Example

```json
{
  "commentId": "comment_id",
  "content": "this is the update content"
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

| Result Code     | Remarks                            |
| --------------- | ---------------------------------- |
| SUCCESS         | api call success                   |
| PARAM_ILLEGAL   | parameter value is not expected    |
| SYSTEM_ERROR    | unexpected system error            |
| SESSION_EXPIRED | session is expired                 |
| USER_NOT_EXIST  | user is not exist                  |
| USER_NOT_ACTIVE | user is not active                 |
| USER_INVALID    | this user cannot do this operation |

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
