## API Specification

| field name      | remarks  |
| --------------- | -------- |
| API url         | \<url\>/ |
| API description |          |
| API methods     |          |

### Request
#### Field Table

##### Body

| Field Name | Field type | Mandatory | Condition | Remarks | Example |
| ---------- | ---------- | --------- | --------- | ------- | ------- |
|            |            |           |           |         |         |

#### Example

```json

```

### Result
#### Field Table

##### Body


| Field Name  | Field type | Mandatory | Condition | Remarks | Example |
| ----------- | ---------- | --------- | --------- | ------- | ------- |
| Result Code | ResultCode | Y         |           |         |         |

##### ResultCode

| Field Name | Field type | Mandatory | Condition | Remarks                                 | Example |
| ---------- | ---------- | --------- | --------- | --------------------------------------- | ------- |
| isSuccess  | Boolean    | Y         |           |                                         | true    |
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
    "resultCode" : {
        "isSuccess": true,
        "resultMsg": "SUCCESS",
        "resultCode": "SUCCESS"
    }
}
```