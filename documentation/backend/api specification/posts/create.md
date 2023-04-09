## API Specification

| field name      | remarks             |
| --------------- | ------------------- |
| API url         | \<url\>/post/create |
| API description | create posts        |
| API methods     | POST                |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name | Field type     | Mandatory | Condition | Remarks | Example |
| ---------- | -------------- | --------- | --------- | ------- | ------- |
| title      | String         | Y         |           |         |         |
| content    | String         | N         |           |         |         |
| images     | List\<String\> | N         |           |         |         |
| tags       | List\<String\> | Y         |           |         |         |

#### Example

```json
{
  "title": "this is the title of the post",
  "content": "this is the content of the post",
  "images": [
    "imagesIds", "imagesIds2"
  ],
  "tags": [
    "HOBBY", "CATEGORY"
  ]
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks | Example |
| ------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext | Y         |           |         |         |
| postId        | String        | Y         |           |         |         |

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
  "postId": "postId"
}
```
