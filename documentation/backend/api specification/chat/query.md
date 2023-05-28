## API Specification

| field name      | remarks                     |
| --------------- | --------------------------- |
| API url         | \<url\>/chat/query          |
| API description | query chat inside chatrooms |
| API methods     | POST                        |

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
| chatroomId | String     | Y         |           |         |         |

#### Example

```json
{
  "chatroomId": "chatroomId"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type          | Mandatory | Condition | Remarks | Example |
| ------------- | ------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext       | Y         |           |         |         |
| chats         | List\<ChatSummary\> | Y         |           |         |         |
| pagingContext | PagingContext       | Y         |           |         |         |

##### ChatSummary
| Field Name  | Field type | Mandatory | Condition | Remarks | Example |
| ----------- | ---------- | --------- | --------- | ------- | ------- |
| message     | String     | Y         |           |         |         |
| username    | String     | Y         |           |         |         |
| currentUser | Boolean    | Y         |           |         |         |
| gmtCreate   | Date       | Y         |           |         |         |

##### PagingContext 
| Field Name   | Field type | Mandatory | Condition | Remarks | Example |
| ------------ | ---------- | --------- | --------- | ------- | ------- |
| pageNumber   | int        | Y         |           |         | 0       |
| numberOfItem | int        | Y         |           |         | 10      |
| hasNext      | boolean    | Y         |           |         | true    |
| totalItem    | Long       | N         |           |         |         |
| totalPage    | int        | N         |           |         |         |

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
  "pagingContext": {
    "pageNumber": 1,
    "numberOfItem": 10,
    "hasNext": true
  },
  "chats": [
    {
      "message": "message1",
      "username": "username",
      "currentUser": true,
      "gmtCreate": date
    }
  ]
}
```
