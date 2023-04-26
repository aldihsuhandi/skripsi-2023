## API Specification

| field name      | remarks               |
| --------------- | --------------------- |
| API url         | \<url\>/comment/query |
| API description | query comment         |
| API methods     | POST                  |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks        | Example |
| ------------ | ---------- | --------- | --------- | -------------- | ------- |
| replyTo      | String     | Y         |           | POST / COMMENT |         |
| replyId      | String     | Y         |           |                |         |
| pageNumber   | int        | Y         |           | default: 1     |         |
| numberOfItem | int        | Y         |           | default: 10    |         |

#### Example

```json
{
  "replyTo": "POST",
  "replyId": "post_id"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type             | Mandatory | Condition | Remarks | Example |
| ------------- | ---------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext          | Y         |           |         |         |
| comments      | List\<CommentSummary\> | Y         |           |         |         |
| hasNext       | boolean                | Y         |           |         |         |

##### CommentSummary

| Field Name      | Field type  | Mandatory | Condition | Remarks                                                | Example |
| --------------- | ----------- | --------- | --------- | ------------------------------------------------------ | ------- |
| commentId       | String      | Y         |           |                                                        |         |
| content         | String      | Y         |           |                                                        |         |
| commenter       | UserSummary | Y         |           |                                                        |         |
| upvote          | int         | Y         |           |                                                        |         |
| downvote        | int         | Y         |           |                                                        |         |
| currentUserVote | int         | Y         |           | - 1 for upvote<br>- -1 for downvote<br>- 0 for neutral |         |
| gmtCreate       | Date        | Y         |           |                                                        |         |
| gmtModified     | Date        | Y         |           |                                                        |         |

#### UserSummary
| Field Name     | Field type | Mandatory | Condition | Remarks | Example |
| -------------- | ---------- | --------- | --------- | ------- | ------- |
| email          | String     | Y         |           |         |         |
| phoneNumber    | String     | Y         |           |         |         |
| username       | String     | Y         |           |         |         |
| profilePicture | String     | Y         |           |         |         |
| role           | String     | Y         |           |         |         |
| gmtCreate      | Date       | Y         |           |         |         |
| gmtModified    | Date       | Y         |           |         |         |

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

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "comments": [
    {
      "commentId": "comment_id",
      "content": "content",
      "commenter": {
        "userName": "userName",
        "email": "user@email.com",
        "phoneNumber": "081234567890",
        "profilePicture": "image",
        "role": "roleName",
        "gmtCreate": date,
        "gmtModified": date
      },
      "upvote": 420,
      "downvote": 69,
      "currentUserVote": -1,
      "gmtCreate": date,
      "gmtModified": date
    }
  ],
  "hasNext": true
}
```
