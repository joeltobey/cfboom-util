/*
 * Copyright 2016-2019 the original author or authors and Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Miscellaneous date utility methods.
 *
 * @auther Joel Tobey
 * @singleton
 */
component
  extends="cfboom.lang.Object"
  displayname="Class DateUtils"
  output="false"
{
  public cfboom.util.DateUtils function init() {
    return this;
  }

  /**
   * Takes a string in ISO 8601 date format and returns a date.
   */
  public date function parseIso8601Date( required string dateString, string format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ) {
    var IsoDateFormat = createObject("java", "java.text.SimpleDateFormat").init( arguments.format );
    return IsoDateFormat.parse( arguments.dateString );
  }

  /**
   * Takes a date and converts it into an ISO 8601 date string.
   */
  public string function formatIso8601Date( required date datetime, boolean convertToUTC = true, string format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ) {
    if ( arguments.convertToUTC ) {
      arguments.datetime = dateConvert( "local2utc", arguments.datetime );
    }
    var IsoDateFormat = createObject("java", "java.text.SimpleDateFormat").init( arguments.format );
    return IsoDateFormat.format( arguments.datetime );
  }
}
