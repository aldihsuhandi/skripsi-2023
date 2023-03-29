## API Specification

| field name      | remarks            |
| --------------- | ------------------ |
| API url         | \<url\>/item/query |
| API description | query item         |
| API methods     | POST               |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition                               | Remarks | Example        |
| ------------ | ---------- | --------- | --------------------------------------- | ------- | -------------- |
| clientId     | String     | Y         |                                         |         | "clientId"     |
| clientSecret | String     | Y         |                                         |         | "clientSecret" |
| sessionId    | String     | N         | need to pass sessionId if user is login |         | "sessionId"    |

##### Body

| Field Name        | Field type        | Mandatory | Condition | Remarks                                              | Example |
| ----------------- | ----------------- | --------- | --------- | ---------------------------------------------------- | ------- |
| itemFilterContext | ItemFilterContext | N         |           | if itemFilterContext is null, will return every item |         |
| pageNumber        | int               | N         |           | default value is 1                                   |         |
| numberOfItem      | int               | N         |           | default value is 10                                  |         |

##### ItemFilterContext

| Field Name            | Field type | Mandatory | Condition | Remarks                                                    | Example              |
| --------------------- | ---------- | --------- | --------- | ---------------------------------------------------------- | -------------------- |
| itemId                | String     | N         |           | if this field is present, this api will only return 1 item | "itemId"             |
| itemName              | String     | N         |           |                                                            | "itemName"           |
| minItemPrice          | int        | N         |           |                                                            | 1000                 |
| maxItemPrice          | int        | N         |           |                                                            | 5000                 |
| merchantEmail         | String     | N         |           |                                                            | "merchant@email.com" |
| merchantInterestLevel | String     | N         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST                           | "BEGINNER"           |
| userInterestLevel     | String     | N         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST                           | "BEGINNER"           |
| hobby                 | String     | N         |           |                                                            | "music"              |
| itemCategory          | String     | N         |           |                                                            | "GUITAR"             |
| isApproved            | boolean    | N         |           | default value is true                                      | true                 |

#### Example

```json

{
  "head": {
    "clientId": "clientId",
    "clientSecret": "clientSecret",
    "sessionId": "e39992f3048042aeae2c279074ee40bc"
  },
  "body": {
    "pageNumber": 1,
    "numberOfItem": 10,
    "itemFilterContext": {
      "hobby": "music",
      "itemCategory": "guitar",
      "isApproved": true
    }
  }
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type     | Mandatory | Condition | Remarks | Example |
| ------------- | -------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext  | Y         |           |         |         |
| pagingContext | PagingContext  | Y         |           |         |         |
| items         | List\<ItemVO\> | Y         |           |         |         |

##### PagingContext 
| Field Name   | Field type | Mandatory | Condition | Remarks | Example |
| ------------ | ---------- | --------- | --------- | ------- | ------- |
| pageNumber   | int        | Y         |           |         | 0       |
| numberOfItem | int        | Y         |           |         | 10      |
| hasNext      | boolean    | Y         |           |         | true    |

##### ItemVO
| Field Name            | Field type          | Mandatory | Condition | Remarks                          | Example        |
| --------------------- | ------------------- | --------- | --------- | -------------------------------- | -------------- |
| itemId                | String              | Y         |           |                                  | "itemId"       |
| itemName              | String              | Y         |           |                                  | "itemName"     |
| itemPrice             | long                | Y         |           | int rupiah                       | 100000         |
| itemDescription       | String              | N         |           |                                  | "itemDesc"     |
| itemQuantity          | int                 | Y         |           |                                  | 1              |
| merchantInfo          | UserVO              | Y         |           | merchant info                    |                |
| itemCategory          | ItemCategoryVO      | Y         |           |                                  | "itemCategory" |
| hobby                 | HobbyVO             | Y         |           |                                  | "hobbyName"    |
| merchantLevelInterest | InterestLevelVO     | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "ENTHUSIAST"   |
| userLevelInterest     | InterestLevelVO     | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "ENTHUSIAST"   |
| itemImages            | List\<ItemImageVO\> | N         |           |                                  |                |

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

##### HobbyVO
| Field Name | Field type | Mandatory | Condition | Remarks | Example     |
| ---------- | ---------- | --------- | --------- | ------- | ----------- |
| hobbyId    | String     | Y         |           |         | "hobbyId"   |
| hobbyName  | String     | Y         |           |         | "hobbyName" |

##### InterestLevelVO
| Field Name        | Field type | Mandatory | Condition | Remarks                          | Example           |
| ----------------- | ---------- | --------- | --------- | -------------------------------- | ----------------- |
| interestLevelId   | String     | Y         |           |                                  | "interestLevelId" |
| interestLevelName | String     | Y         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "BEGINNER"        |

##### ItemCategoryVO
| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| categoryId   | String     | Y         |           |         | "categoryId"   |
| categoryName | String     | Y         |           |         | "categoryName" |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

##### Possible Result Code

| Result Code     | Remarks                         |
| --------------- | ------------------------------- |
| SUCCESS         | api call success                |
| PARAM_ILLEGAL   | parameter value is not expected |
| SYSTEM_ERROR    | unexpected system error         |
| SESSION_EXPIRED | session expired                 |

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
      "itemCategory": {
        "categoryId": "categoryId",
        "categoryName": "categoryName"
      },
      "hobby": {
        "hobbyId": "hobbyId",
        "hobbyName": "hobbyName"
      },
      "merchantInterestLevel": {
        "interestLevelId": "interestLevelId",
        "interestLevelName": "BEGINNER"
      },
      "userInterestLevel": {
        "interestLevelId": "interestLevelId",
        "interestLevelName": "BEGINNER"
      },
      "itemImages": [
        {
          "itemId": "itemId",
          "itemImageId": "imageItemId",
          "itemImage": blob
        }
      ]
    }
  ]
}
```
