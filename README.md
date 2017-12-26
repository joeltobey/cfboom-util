[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-util.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-util)

# WELCOME TO THE CFBOOM UTIL COLDBOX MODULE
The cfboom-util module provides core utilities used with cfboom

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-util/wiki

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cfboom-util`

## Settings
There are no settings for this module


## ApiDocs

Check out the API Docs for all the possible functions.


## DateUtils

Wirebox mapping `DateUtils@cfboomUtil`

```
var DateUtils = getInstance( "DateUtils@cfboomUtil" );
var myDate = DateUtils.parseIso8601Date( "2016-09-14T17:01:34.000Z" );
var myIsoDateString = DateUtils.formatIso8601Date( myDate );
```

## QueryUtils

Wirebox mapping `QueryUtils@cfboomUtil`

```
var QueryUtils = getInstance( "QueryUtils@cfboomUtil" );
var recordSet1 = QueryUtils.getById( q, 123 );
var recordSet2 = QueryUtils.getBy( q, "username", "john.doe@email.com", "cf_sql_varchar" );
var recordSet3 = QueryUtils.getLike( q, "country", "usa" );
```

## RetryUtils

Wirebox mapping `RetryUtils@cfboomUtil`

```
var RetryUtils = getInstance( "RetryUtils@cfboomUtil" );
var nextTimeToRetry = RetryUtils.nextRetryFromBeginning( beginningDate, previousAttempts );
var nextTimeToRetry = RetryUtils.nextRetryFromPrevious( previousDate, previousAttempts );
```

## StringUtils

Wirebox mapping `StringUtils@cfboomUtil`

```
var StringUtils = getInstance( "StringUtils@cfboomUtil" );
var myId = StringUtils.generateUniqueId();
var randomString = StringUtils.getRandom( 32 );
```

********************************************************************************
Copyright Since 2016 Joel Tobey
********************************************************************************
