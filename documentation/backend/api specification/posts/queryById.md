## API Specification

| field name      | remarks                |
| --------------- | ---------------------- |
| API url         | \<url\>/post/queryById |
| API description | query singular post    |
| API methods     | POST                   |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
| postId     | String     | Y         |           |         |         |

#### Example

```json
{
  "postId": "postId"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| post          | PostSummary   | Y         |           |         |         |

| Field Name      | Field type     | Mandatory | Condition | Remarks                                                | Example |
| --------------- | -------------- | --------- | --------- | ------------------------------------------------------ | ------- |
| postId          | String         | Y         |           |                                                        |         |
| title           | String         | Y         |           |                                                        |         |
| content         | String         | Y         |           |                                                        |         |
| images          | List\<String\> | N         |           |                                                        |         |
| tags            | List\<String\> | Y         |           |                                                        |         |
| userInfo        | UserSummary    | Y         |           |                                                        |         |
| upvote          | int            | Y         |           |                                                        |         |
| downvote        | int            | Y         |           |                                                        |         |
| currentUserVote | int            | Y         |           | - 1 for upvote<br>- -1 for downvote<br>- 0 for neutral |         |
| gmtCreate       | Date           | Y         |           |                                                        |         |
| gmtModified     | Date           | Y         |           |                                                        |         |

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
  "post": [
    "postId": "postId",
    "title": "title",
    "content": "content",
    "tags": [
      "HOBBY", "CATEGORY"
    ],
    "upvote": 64,
    "downvote": 420,
    "currentUserVote": 0,
    "gmtCreate": date,
    "gmtModified": date,
    "userInfo": {
      "userName": "userName",
      "email": "user@email.com",
      "phoneNumber": "081234567890",
      "profilePicture": "image",
      "role": "roleName"
    }
  ]
}
```
