## API Specification

| field name      | remarks              |
| --------------- | -------------------- |
| API url         | \<url\>/review/query |
| API description | to query review      |
| API methods     | POST                 |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks                                  | Example |
| ------------ | ---------- | --------- | --------- | ---------------------------------------- | ------- |
| email        | String     | Y         |           |                                          |         |
| type         | String     | Y         |           | MERCHANT/USER                            |         |
| needReview   | boolean    | Y         |           | if type = merchant, will always be false | false   |
| numberOfItem | Integer    | Y         |           | default value = 10                       |         |
| pageNumber   | Integer    | Y         |           | default value = 1                        |         |

#### Example

```json
{
  "email": "email",
  "type": "USER",
  "needReview": true
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type            | Mandatory | Condition | Remarks | Example |
| ------------- | --------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext         | Y         |           |         |         |
| reviews       | List\<ReviewSummary\> | Y         |           |         |         |
| pagingContext | PagingContext         | Y         |           |         |         |

##### ReviewSummary

| Field Name    | Field type     | Mandatory | Condition | Remarks                                                   | Example |
| ------------- | -------------- | --------- | --------- | --------------------------------------------------------- | ------- |
| reviewId      | String         | Y         |           |                                                           |         |
| itemId        | String         | Y         |           |                                                           |         |
| review        | int            | C         |           | 1 - 5<br>needReview = false, this field will be mandatory |         |
| images        | List\<String\> | N         |           | needReview = true, this field must be empty               |         |
| interestLevel | String         | C         |           | needReview = false, this field will be mandatory          |         |
| desc          | String         | C         |           | needReview = false, this field will be mandatory          |         |
| needReview    | boolean        | Y         |           |                                                           |         |

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
  "reviews": [
    {
      "reviewId": "reviewId",
      "itemId": "itemId",
      "review": 4,
      "interestLevel": "INTERMEDIATE",
      "desc": "this item is good for intermediate person",
      "needReview": false
    }
  ],
  "pagingContext": {
    "pageNumber": 1,
    "numberOfItem": 10,
    "hasNext": true
  },
}
```
