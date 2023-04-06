## API Specification

| field name      | remarks                   |
| --------------- | ------------------------- |
| API url         | \<url\>/item/autocomplete |
| API description | for search autocomplete   |
| API methods     | POST                      |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name   | Field type | Mandatory | Condition | Remarks | Example |
| ------------ | ---------- | --------- | --------- | ------- | ------- |
| autocomplete | String     | Y         |           |         |         |

#### Example

```json
  "head": {
    "clientId": "clientId",
    "clientSecret": "clientSecret"
  },
  "body": {
    "autocomplete": "itemName"
  }
```

### Result

#### Field Table

##### Body

| Field Name    | Field type     | Mandatory | Condition | Remarks | Example |
| ------------- | -------------- | --------- | --------- | ------- | ------- |
| resultContext | ResultContext  | Y         |           |         |         |
| itemName      | List\<String\> | Y         |           |         |         |

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

#### Example

```json
{
  "resultContext": {
    "success": true,
    "resultMsg": "SUCCESS",
    "resultCode": "SUCCESS"
  },
  "itemName": [
    "itemName1", "itemName2", "itemName3"
  ]
}
```
