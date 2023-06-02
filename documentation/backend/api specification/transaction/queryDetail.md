## API Specification

| field name      | remarks                    |
| --------------- | -------------------------- |
| API url         | \<url\>/transaction/detail |
| API description | query detail transaction   |
| API methods     | POST                       |

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

#### Example

```json
{
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type         | Mandatory | Condition | Remarks | Example |
| ------------- | ------------------ | --------- | --------- | ------- | ------- |
| resultContext | ResultContext      | Y         |           |         |         |
| transaction   | TransactionSummary | Y         |           |         |         |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |


#### TransactionSummary
| Field Name    | Field type                       | Mandatory | Condition | Remarks | Example |
| ------------- | -------------------------------- | --------- | --------- | ------- | ------- |
| transactionId | String                           | Y         |           |         |         |
| price         | Long                             | Y         |           |         |         |
| status        | String                           | Y         |           |         |         |
| paymentType   | String                           | Y         |           |         |         |
| paymentCode   | String                           | Y         |           |         |         |
| details       | List\<TransactionDetailSummary\> | Y         |           |         |         |
| gmtCreate     | Date                             | Y         |           |         |         |

##### TransactionDetailSummary
| Field Name | Field type         | Mandatory | Condition | Remarks | Example |
| ---------- | ------------------ | --------- | --------- | ------- | ------- |
| item       | HistoryItemSummary | Y         |           |         |         |
| quantity   | Integer            | Y         |           |         |         |

##### HistoryItemSummary
| Field Name      | Field type     | Mandatory | Condition | Remarks | Example |
| --------------- | -------------- | --------- | --------- | ------- | ------- |
| itemId          | String         | Y         |           |         |         |
| itemName        | String         | Y         |           |         |         |
| itemPrice       | Long           | Y         |           |         |         |
| itemDescription | String         | Y         |           |         |         |
| itemQuantity    | Integer        | Y         |           |         |         |
| itemCategory    | String         | Y         |           |         |         |
| hobby           | String         | Y         |           |         |         |
| merchantInfo    | UserSummary    | Y         |           |         |         |
| merchantLevel   | String         | Y         |           |         |         |
| userLevel       | String         | Y         |           |         |         |
| itemImages      | List\<String\> | Y         |           |         |         |
| historyDate     | Date           | Y         |           |         |         |
| gmtCreate       | Date           | Y         |           |         |         |
| gmtModified     | Date           | Y         |           |         |         |

###### UserSummary
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
  "transaction": {
    "transactionId": "transactionId",
    "price": 69420,
    "status": "Waiting Payment",
    "paymentType": "BCA Virtual Account",
    "paymentCode": "NO VA BCA",
    "gmtCreate": date,
    "details": [
        {
            "quantity": 10,
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
                    "role": "roleName",
                    "canWhatsapp": false,
                    "canTelegram": true
                },
                "itemCategory": "categoryName",
                "hobby": "music",
                "merchantLevel": "BEGINNER",
                "userLevel": "BEGINNNER",
                "itemImages": [
                    "imageId1", "imagesId2", "imagesId3"
                ],
                "historyDate": date,
            }
        }
    ]
   }
}
```
