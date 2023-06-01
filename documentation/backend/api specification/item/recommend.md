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

| Field Name    | Field type          | Mandatory | Condition | Remarks | Example |
| ------------- | ------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext       | Y         |           |         |         |
| items         | List\<ItemSummary\> | Y         |           |         |         |

#### ItemSummary
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
| inWishlist      | boolean        | Y         |           | default: false |         |
| gmtCreate       | Date           | Y         |           |                |         |
| gmtModified     | Date           | Y         |           |                |         |

#### UserSummary
| Field Name     | Field type | Mandatory | Condition | Remarks         | Example |
| -------------- | ---------- | --------- | --------- | --------------- | ------- |
| email          | String     | Y         |           |                 |         |
| phoneNumber    | String     | Y         |           |                 |         |
| username       | String     | Y         |           |                 |         |
| profilePicture | Blob       | Y         |           |                 |         |
| role           | String     | Y         |           |                 |         |
| canWhatsapp    | Booelan    | Y         |           | Default = false |         |
| canTelegram    | Booelan    | Y         |           | Default = false |         |
| gmtCreate      | Date       | Y         |           |                 |         |
| gmtModified    | Date       | Y         |           |                 |         |

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
        "userName": "userName",
        "email": "user@email.com",
        "phoneNumber": "081234567890",
        "profilePicture": "imageIdString",
        "role": "roleName",
        "canWhatsapp": false,
        "canTelegram": true
      },
      "categoryName": "GUITAR",
      "hobby": "music",
      "merchantLevel": "BEGINNER",
      "userInterestLevel": "BEGINNER",
      "itemImages": [
        "imageId"
      ],
      "inWishlist": false
    }
  ]
}
```
