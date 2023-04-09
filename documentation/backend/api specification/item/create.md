## API Specification

| field name      | remarks             |
| --------------- | ------------------- |
| API url         | \<url\>/item/create |
| API description | create item         |
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

| Field Name            | Field type | Mandatory | Condition | Remarks                                                             | Example        |
| --------------------- | ---------- | --------- | --------- | ------------------------------------------------------------------- | -------------- |
| itemName              | String     | Y         |           |                                                                     | "item name"    |
| itemPrice             | long       | Y         |           | in rupiah                                                           | 100000         |
| itemDescription       | String     | N         |           |                                                                     |                |
| itemQuantity          | Int        | Y         |           |                                                                     | 10             |
| categoryName          | String     | Y         |           | item category name                                                  | "item category |
| hobbyName             | String     | Y         |           |                                                                     | "music"        |
| merchantInterestLevel | String     | Y         |           | interest level set by merchant<br> BEGINNER,INTERMEDIATE,ENTHUSIAST | "BEGINNER"     |

#### Example

```json
{
  "itemName": "item name",
  "itemPrice": 100000,
  "itemQuantity": 100,
  "categoryName": "GUITAR",
  "hobby": "music",
  "merchantInterestLevel": "BEGINNER"
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

| Result Code       | Remarks                         |
| ----------------- | ------------------------------- |
| SUCCESS           | api call success                |
| PARAM_ILLEGAL     | parameter value is not expected |
| SYSTEM_ERROR      | unexpected system error         |
| SESSION_EXPIRED   | session is expired              |
| USER_NOT_FOUND    | merchant not found              |
| USER_NOT_ACTIVE   | merchant not active             |
| USER_ROLE_INVALID | user is not a merchant          |

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
