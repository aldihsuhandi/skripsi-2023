## API Specification

| field name      | remarks           |
| --------------- | ----------------- |
| API url         | \<url\>/chat/room |
| API description | query chatrooms   |
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

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
|            |            |           |           |         |         |

#### Example

```json
{
  ;
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type              | Mandatory | Condition | Remarks                             | Example |
| ------------- | ----------------------- | --------- | --------- | ----------------------------------- | ------- |
| resultContext | ResultContext           | Y         |           |                                     |         |
| rooms         | List\<ChatroomSummary\> | Y         |           | will be sorted base on gmt modified |         |

##### ChatroomSummary
| Field Name  | Field type          | Mandatory | Condition | Remarks                                                     | Example |
| ----------- | ------------------- | --------- | --------- | ----------------------------------------------------------- | ------- |
| chatroomId  | String              | Y         |           |                                                             |         |
| participant | List\<UserSummary\> | Y         |           | will include other participants \n without the current user |         |
| gmtCreate   | Date                | Y         |           |                                                             |         |
| gmtModified | Date                | Y         |           |                                                             |         |

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
  "rooms": [
    {
      "chatroomId": "id",
      "participant": [
        {
          "userName": "userName",
          "email": "user@email.com",
          "phoneNumber": "081234567890",
          "profilePicture": "image",
          "role": "roleName",
          "gmtCreate": date,
          "gmtModified": date
        }
      ],
      "gmtModified": date,
      "gmtCreate": date
    }
  ]
}
```
