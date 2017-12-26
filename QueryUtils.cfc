/*
 * Copyright 2017 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * Query utility methods.
 *
 * @auther Joel Tobey
 */
component singleton="true"
  displayname="Class QueryUtils"
  output="false"
{
  public cfboom.util.QueryUtils function init() {
    return this;
  }

  /**
   * Helper to get a record by the ID.
   */
  public query function getById( required query q, required any id, string sqlType = "cf_sql_integer" ) {
    return getBy( q, "id", id, sqlType );
  }

  /**
   * Helper to get a record set by the specified field/value.
   */
  public query function getBy( required query q, required string name, required any value, string sqlType = "cf_sql_varchar" ) {
    var queryService = new query();
    queryService.setDBType( "query" );
    queryService.setAttributes( sourceQuery = q );
    queryService.setSql( "SELECT * FROM sourceQuery WHERE #name# = :#name#" );
    queryService.addParam( name="#name#", value="#value#", cfsqltype="#sqlType#" );
    var result = queryService.execute().getResult();
    return result;
  }

  /**
   * Helper to get a record set that's like the specified field/value.
   */
  public query function getLike( required query q, required string name, required any value, string sqlType = "cf_sql_varchar" ) {
    var queryService = new query();
    queryService.setDBType( "query" );
    queryService.setAttributes( sourceQuery = q );
    queryService.setSql( "SELECT * FROM sourceQuery WHERE #name# LIKE :#name#" );
    queryService.addParam( name="#name#", value="%#value#%", cfsqltype="#sqlType#" );
    var result = queryService.execute().getResult();
    return result;
  }
}
