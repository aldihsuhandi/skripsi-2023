## API Specification

| field name      | remarks           |
| --------------- | ----------------- |
| API url         | \<url\>/post/edit |
| API description | edit posts        |
| API methods     | POST              |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name    | Field type     | Mandatory | Condition | Remarks | Example |
| ------------- | -------------- | --------- | --------- | ------- | ------- |
| postId        | String         | Y         |           |         |         |
| title         | String         | N         |           |         |         |
| content       | String         | N         |           |         |         |
| addedImages   | List\<String\> | N         |           |         |         |
| removedImages | List\<String\> | N         |           |         |         |
| addedTags     | List\<String\> | N         |           |         |         |
| removedTags   | List\<String\> | N         |           |         |         |

#### Example

```json
{
  "postId": "postId",
  "title": "this is the updated title of the post",
  "content": "this is the updated content of the post",
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

| Result Code     | Remarks                                        |
| --------------- | ---------------------------------------------- |
| SUCCESS         | api call success                               |
| PARAM_ILLEGAL   | parameter value is not expected                |
| SYSTEM_ERROR    | unexpected system error                        |
| SESSION_EXPIRED | session is expired                             |
| USER_INVALID    | the current user is invalid for this operation |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "postId": "postId"
}
```