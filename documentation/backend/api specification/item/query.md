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

| Field Name        | Field type        | Mandatory | Condition | Remarks                                                     | Example |
| ----------------- | ----------------- | --------- | --------- | ----------------------------------------------------------- | ------- |
| itemFilterContext | ItemFilterContext | N         |           | if itemFilterContext is null, will return every item        |         |
| sorting           | String            | N         |           | default item price                                          |         |
| sortingType       | String            | N         |           | accepted value: Descending/Ascending<br>default: Descending |         |
| pageNumber        | int               | N         |           | default value is 1                                          |         |
| numberOfItem      | int               | N         |           | default value is 10                                         |         |

##### ItemFilterContext

| Field Name            | Field type | Mandatory | Condition | Remarks                          | Example              |
| --------------------- | ---------- | --------- | --------- | -------------------------------- | -------------------- |
| itemName              | String     | N         |           |                                  | "itemName"           |
| minItemPrice          | int        | N         |           |                                  | 1000                 |
| maxItemPrice          | int        | N         |           |                                  | 5000                 |
| merchantEmail         | String     | N         |           |                                  | "merchant@email.com" |
| merchantInterestLevel | String     | N         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "BEGINNER"           |
| userInterestLevel     | String     | N         |           | BEGINNER,INTERMEDIATE,ENTHUSIAST | "BEGINNER"           |
| hobby                 | String     | N         |           |                                  | "music"              |
| itemCategory          | String     | N         |           |                                  | "GUITAR"             |

#### Example

```json

{
  "pageNumber": 1,
  "numberOfItem": 10,
  "itemFilterContext": {
    "hobby": "music",
    "itemCategory": "guitar",
    "isApproved": true
  }
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type          | Mandatory | Condition | Remarks | Example |
| ------------- | ------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext       | Y         |           |         |         |
| pagingContext | PagingContext       | Y         |           |         |         |
| items         | List\<ItemSummary\> | Y         |           |         |         |

##### PagingContext 
| Field Name   | Field type | Mandatory | Condition | Remarks | Example |
| ------------ | ---------- | --------- | --------- | ------- | ------- |
| pageNumber   | int        | Y         |           |         | 0       |
| numberOfItem | int        | Y         |           |         | 10      |
| hasNext      | boolean    | Y         |           |         | true    |
| totalItem    | Long       | N         |           |         |         |
| totalPage    | int        | N         |           |         |         |

#### ItemSummary
| Field Name      | Field type     | Mandatory | Condition | Remarks        | Example |
| --------------- | -------------- | --------- | --------- | -------------- | ------- |
| itemId          | String         | Y         |           |                |         |
| postId          | String         | Y         |           |                |         |
| itemName        | String         | Y         |           |                |         |
| itemPrice       | Long           | Y         |           |                |         |
| itemDescription | String         | Y         |           |                |         |
| itemQuantity    | Integer        | Y         |           |                |         |
| itemCategory    | String         | Y         |           |                |         |
| hobby           | String         | Y         |           |                |         |
| merchantInfo    | UserSummary    | Y         |           |                |         |
| merchantLevel   | String         | Y         |           |                |         |
| itemImages      | List\<String\> | Y         |           |                |         |
| inWishlist      | boolean        | Y         |           | default: false |         |
| gmtCreate       | Date           | Y         |           |                |         |
| gmtModified     | Date           | Y         |           |                |         |

#### UserSummary
| Field Name     | Field type | Mandatory | Condition | Remarks | Example |
| -------------- | ---------- | --------- | --------- | ------- | ------- |
| email          | String     | Y         |           |         |         |
| phoneNumber    | String     | Y         |           |         |         |
| username       | String     | Y         |           |         |         |
| profilePicture | Blob       | Y         |           |         |         |
| role           | String     | Y         |           |         |         |
| gmtCreate      | Date       | Y         |           |         |         |
| gmtModified    | Date       | Y         |           |         |         |

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
      "postId": "postId",
      "itemName": "item name", 
      "itemPrice": 100000,
      "itemQuantity": 100,
      "itemDescription": "itemDescription",
      "merchantInfo": {
        "userName": "userName",
        "email": "user@email.com",
        "phoneNumber": "081234567890",
        "profilePicture": blob,
        "role": "roleName"
      },
      "itemCategory": "categoryName",
      "hobby": "music",
      "merchantLevel": "BEGINNER",
      "itemImages": [
        "imageId1", "imagesId2", "imagesId3"
      ],
      "inWishlist": false
    }
  ]
}
```
