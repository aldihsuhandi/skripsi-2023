## API Specification

| field name      | remarks               |
| --------------- | --------------------- |
| API url         | \<url\>/review/create |
| API description | create review         |
| API methods     |                       |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name    | Field type     | Mandatory | Condition | Remarks                          | Example |
| ------------- | -------------- | --------- | --------- | -------------------------------- | ------- |
| reviewId      | String         | Y         |           |                                  |         |
| review        | int            | Y         |           | 1 - 5                            |         |
| images        | List\<String\> | N         |           |                                  |         |
| description   | String         | N         |           |                                  |         |
| interestLevel | String         | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST |         |

#### Example

```json
{
  "reviewId": "reviewId",
  "review": 4,
  "images": [
    "imagesId1", "imagesId2"
  ],
  "description": "review desc",
  "interestLevel": "INTERMEDIATE"
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

| Result Code      | Remarks                         |
| ---------------- | ------------------------------- |
| SUCCESS          | api call success                |
| PARAM_ILLEGAL    | parameter value is not expected |
| SYSTEM_ERROR     | unexpected system error         |
| SESSION_EXPIRED  | session is expired              |
| USER_INVALID     | user is not valid               |
| REVIEW_NOT_FOUND | review not found                |

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
