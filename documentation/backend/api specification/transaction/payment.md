## API Specification

| field name      | remarks                     |
| --------------- | --------------------------- |
| API url         | \<url\>/transaction/payment |
| API description | payment step of transaction |
| API methods     | POST                        |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |
| sessionId    | String     | Y         |           |         | "sessionId"    |

##### Body

| Field Name    | Field type | Mandatory | Condition | Remarks         | Example |
| ------------- | ---------- | --------- | --------- | --------------- | ------- |
| transactionId | String     | Y         |           |                 |         |
| paymentType   | String     | Y         |           | from dictionary |         |

#### Example

```json
{
  "transactionId": "transactionId",
  "paymentType": "paymentType"
}
```

### Result

#### Field Table

##### Body

| Field Name    | Field type    | Mandatory | Condition | Remarks                                                   | Example |
| ------------- | ------------- | --------- | --------- | --------------------------------------------------------- | ------- |
| resultContext | ResultContext | Y         |           |                                                           |         |
| paymentNumber | String        | Y         |           | if paymentType is BCA_VA, this will contain BCA VA number |         |

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
  "paymentNumber": 019238
}
```
