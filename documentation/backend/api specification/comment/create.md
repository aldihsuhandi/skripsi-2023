## API Specification

| field name      | remarks                |
| --------------- | ---------------------- |
| API url         | \<url\>/comment/create |
| API description | to create comment      |
| API methods     | POST                   |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks      | Example |
| ---------- | ---------- | --------- | --------- | ------------ | ------- |
| content    | String     | Y         |           |              |         |
| replyTo    | String     | Y         |           | POST/COMMENT |         |
| replyId    | String     | Y         |           |              |         |

#### Example

```json
{
  "content": "this is a comment content",
  "replyTo": "POST",
  "replyId": "post_id"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| commentId     | String        | Y         |           |         |         |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code

| Result Code     | Remarks                         |
| --------------- | ------------------------------- |
| SUCCESS         | api call success                |
| PARAM_ILLEGAL   | parameter value is not expected |
| SYSTEM_ERROR    | unexpected system error         |
| SESSION_EXPIRED | session is expired              |
| USER_NOT_EXIST  | user is not exist               |
| USER_NOT_ACTIVE | user is not active              |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "commentId": "comment_id"
}
```
