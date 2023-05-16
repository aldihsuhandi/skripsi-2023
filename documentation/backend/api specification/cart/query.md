## API Specification

| field name      | remarks            |
| --------------- | ------------------ |
| API url         | \<url\>/cart/query |
| API description | query cart         |
| API methods     | POST               |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks             | Example |
| ------------ | ---------- | --------- | --------- | ------------------- | ------- |
| pageNumber   | int        | N         |           | default value is 1  |         |
| numberOfItem | int        | N         |           | default value is 10 |         |

#### Example

```json
{
  ;
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type          | Mandatory | Condition | Remarks | Example |
| ------------- | ------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext       | Y         |           |         |         |
| pagingContext | PagingContext       | Y         |           |         |         |
| carts         | List\<CartSummary\> | Y         |           |         |         |
| price         | Long                | Y         |           |         |         |

###### CartSummary
| Field Name | Field type  | Mandatory | Condition | Remarks | Example |
| ---------- | ----------- | --------- | --------- | ------- | ------- |
| quantity   | int         | Y         |           |         |         |
| item       | ItemSummary | Y         |           |         |         |

###### ItemSummary
| Field Name      | Field type     | Mandatory | Condition | Remarks        | Example |
| --------------- | -------------- | --------- | --------- | -------------- | ------- |
| itemId          | String         | Y         |           |                |         |
| itemName        | String         | Y         |           |                |         |
| itemPrice       | Long           | Y         |           |                |         |
| itemDescription | String         | Y         |           |                |         |
| itemQuantity    | Integer        | Y         |           |                |         |
| itemCategory    | String         | Y         |           |                |         |
| hobby           | String         | Y         |           |                |         |
| merchantInfo    | UserSummary    | Y         |           |                |         |
| merchantLevel   | String         | Y         |           |                |         |
| itemImages      | List\<String\> | Y         |           |                |         |
| isInWishlist    | boolean        | Y         |           | default: false |         |
| gmtCreate       | Date           | Y         |           |                |         |
| gmtModified     | Date           | Y         |           |                |         |

###### UserSummary
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
  "price": 100000,
  "carts": [
    {
      "quantity": 1,
      "hasNext": false,
      "item": {
        "itemId": "itemId", 
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
        "merchantInterestLevel": "BEGINNER",
        "itemImages": [
          "imageId1", "imagesId2", "imagesId3"
        ],
        "isInWishlist": false
      }
    }
  ]
}
```