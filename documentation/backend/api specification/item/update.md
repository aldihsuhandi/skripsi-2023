## API Specification

| field name      | remarks             |
| --------------- | ------------------- |
| API url         | \<url\>/item/update |
| API description | update item data    |
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

| Field Name        | Field type        | Mandatory | Condition | Remarks | Example              |
| ----------------- | ----------------- | --------- | --------- | ------- | -------------------- |
| itemId            | String            | Y         |           |         | "merchant@email.com" |
| itemUpdateContext | ItemUpdateContext | Y         |           |         |                      |

##### ItemUpdateContext
| Field Name            | Field type | Mandatory | Condition | Remarks                                                             | Example        |
| --------------------- | ---------- | --------- | --------- | ------------------------------------------------------------------- | -------------- |
| itemName              | String     | N         |           |                                                                     | "item name"    |
| itemPrice             | long       | N         |           | in rupiah                                                           | 100000         |
| itemDescription       | String     | N         |           |                                                                     |                |
| itemQuantity          | Int        | N         |           |                                                                     | 10             |
| categoryName          | String     | N         |           | item category name                                                  | "item category |
| hobbyName             | String     | N         |           |                                                                     | "music"        |
| merchantInterestLevel | String     | N         |           | interest level set by merchant<br> BEGINNER,INTERMEDIATE,ENTHUSIAST | "BEGINNER"     |


#### Example

```json
{
  "itemId": "itemId",
  "itemUpdateContext": {
    "itemName": "item name", 
    "itemPrice": 100000,
    "itemQuantity": 100,
    "merchantEmail": "merchant@email.com",
    "categoryName": "GUITAR",
    "hobby": "music",
    "merchantInterestLevel": "BEGINNER"
  }
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

| Result Code       | Remarks                                              |
| ----------------- | ---------------------------------------------------- |
| SUCCESS           | api call success                                     |
| PARAM_ILLEGAL     | parameter value is not expected                      |
| SYSTEM_ERROR      | unexpected system error                              |
| SESSION_EXPIRED   | session is expired                                   |
| ITEM_NOT_FOUND    | item not found                                       |
| USER_ROLE_INVALID | user is not a merchant or this item is not from user |

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
