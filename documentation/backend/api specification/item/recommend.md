## API Specification

| field name      | remarks                 |
| --------------- | ----------------------- |
| API url         | \<url\>/item/recommend  |
| API description | item recommendation api |
| API methods     | POST                    |

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

}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type     | Mandatory | Condition | Remarks | Example |
| ------------- | -------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext  | Y         |           |         |         |
| items         | List\<ItemVO\> | Y         |           |         |         |

##### ItemVO
| Field Name            | Field type   | Mandatory | Condition | Remarks                          | Example        |
| --------------------- | ------------ | --------- | --------- | -------------------------------- | -------------- |
| itemId                | String       | Y         |           |                                  | "itemId"       |
| itemName              | String       | Y         |           |                                  | "itemName"     |
| itemPrice             | long         | Y         |           | int rupiah                       | 100000         |
| itemDescription       | String       | N         |           |                                  | "itemDesc"     |
| itemQuantity          | int          | Y         |           |                                  | 1              |
| merchantInfo          | UserVO       | Y         |           | merchant info                    |                |
| categoryName          | String       | Y         |           |                                  | "itemCategory" |
| hobby                 | String       | Y         |           |                                  | "hobbyName"    |
| merchantLevelInterest | String       | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "ENTHUSIAST"   |
| userLevelInterest     | String       | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "ENTHUSIAST"   |
| itemImages            | List\<Blob\> | N         |           |                                  |                |

##### UserVO
| Field Name     | Field type | Mandatory | Condition | Remarks          | Example          |
| -------------- | ---------- | --------- | --------- | ---------------- | ---------------- |
| userId         | String     | Y         |           |                  | "userId"         |
| username       | String     | Y         |           |                  | "username"       |
| email          | String     | Y         |           |                  | "user@email.com" |
| phoneNumber    | String     | Y         |           |                  | "081234567890"   |
| profilePicture | Blob       | N         |           |                  |                  |
| isActive       | boolean    | Y         |           |                  | true             |
| isDeleted      | boolean    | Y         |           |                  | false            |
| password       | String     | Y         |           | will be censored | "**********"     |
| roleInfo       | RoleVO     | Y         |           |                  |                  |

##### RoleVO
| Field Name | Field type | Mandatory | Condition | Remarks | Example    |
| ---------- | ---------- | --------- | --------- | ------- | ---------- |
| roleId     | String     | Y         |           |         | "roleId"   |
| roleName   | String     | Y         |           |         | "roleName" |


##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

###### Possible Result Code

| Result Code   | Remarks                         |
| ------------- | ------------------------------- |
| SUCCESS       | api call success                |
| PARAM_ILLEGAL | parameter value is not expected |
| SYSTEM_ERROR  | unexpected system error         |

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "items": [
    {
      "itemId": "itemId", 
      "itemName": "item name", 
      "itemPrice": 100000,
      "itemQuantity": 100,
      "itemDescription": "itemDescription",
      "merchantInfo": {
        "userId": "userId",
        "userName": "userName",
        "email": "user@email.com",
        "phoneNumber": "081234567890",
        "profilePicture": blob,
        "isActive": true,
        "isDeleted": false,
        "password": "*********",
        "roleInfo": {
          "roleId": "roleId",
          "roleName": "roleName"
        }
      },
      "categoryName": "GUITAR",
      "hobby": "music",
      "merchantInterestLevel": "BEGINNER",
      "userInterestLevel": "BEGINNER",
      "itemImages": [
        imageBlob
      ]
    }
  ]
}
```
