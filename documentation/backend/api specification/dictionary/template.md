## API Specification

| field name      | remarks                                                    |
| --------------- | ---------------------------------------------------------- |
| API url         | \<url\>/dictionary/query                                   |
| API description | querying dictionary (category, hobby, interest level) list |
| API methods     | POST                                                       |

### Request

#### Field Table

##### Head

| Field Name   | Field type | Mandatory | Condition | Remarks | Example        |
| ------------ | ---------- | --------- | --------- | ------- | -------------- |
| clientId     | String     | Y         |           |         | "clientId"     |
| clientSecret | String     | Y         |           |         | "clientSecret" |

##### Body

| Field Name    | Field type | Mandatory | Condition | Remarks | Example                       |
| ------------- | ---------- | --------- | --------- | ------- | ----------------------------- |
| dictionaryKey | String     | Y         |           |         | INTEREST_LEVEL,CATEGORY,HOBBY |

#### Example

```json
{
  "dictionaryKey": "HOBBY"
}
```

### Result

#### Field Table

##### Body

| Field Name     | Field type    | Mandatory | Condition | Remarks | Example |
| -------------- | ------------- | --------- | --------- | ------- | ------- |
| resultContext  | ResultContext | Y         |           |         |         |
| List\<String\> | dictinaries   | Y         |           |         |         |

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
  "dictionaries": [
    "string1", "string2", "string3"
  ]
}
```
