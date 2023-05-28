## API Specification

| field name      | remarks                   |
| --------------- | ------------------------- |
| API url         | \<url\>/transaction/query |
| API description | query all transaction     |
| API methods     | POST                      |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name        | Field type | Mandatory | Condition | Remarks                                                                   | Example |
| ----------------- | ---------- | --------- | --------- | ------------------------------------------------------------------------- | ------- |
| transactionStatus | String     | N         |           | if empty will query all transaction except transaction with "INIT" status |         |
| pageNumber        | int        | N         |           | default value is 1                                                        |         |
| numberOfItem      | int        | N         |           | default value is 10                                                       |         |

#### Example

```json
{
  "transactionStatus": "Done"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type                 | Mandatory | Condition | Remarks | Example |
| ------------- | -------------------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext              | Y         |           |         |         |
| pagingContext | PagingContext              | Y         |           |         |         |
| transactions  | List\<TransactionSummary\> | Y         |           |         |         |

##### TransactionSummary
| Field Name    | Field type | Mandatory | Condition | Remarks | Example |
| ------------- | ---------- | --------- | --------- | ------- | ------- |
| transactionId | String     | Y         |           |         |         |
| price         | Long       | Y         |           |         |         |
| status        | String     | Y         |           |         |         |
| paymentType   | String     | Y         |           |         |         |
| gmtCreate     | Date       | Y         |           |         |         |

##### ResultContext

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| success    | Boolean    | Y         |           |                                         | true    |
| resultMsg  | String     | Y         |           | will contain the reason API call failed | SUCCESS |
| resultCode | String     | Y         |           | Result Code                             | SUCCESS |

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
  "pagingContext": {
    "pageNumber": 1,
    "numberOfItem": 10,
    "hasNext": true
  },
  "transactions": [
    {
      "transactionId": "transactionId",
      "price": 69420,
      "status": "Waiting Payment",
      "paymentType": "BCA Virtual Account",
      "gmtCreate": date
    }
  ]
}
```
