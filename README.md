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
