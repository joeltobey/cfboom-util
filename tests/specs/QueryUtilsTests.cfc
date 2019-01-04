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
 * @author Joel Tobey
 */
component
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class QueryUtilsTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['QueryUtils'] = getInstance( "QueryUtils@cfboom-util" );
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete( variables, "QueryUtils" );
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testGetByDefult() {
    var result = QueryUtils.getBy( testQuery(), "Foo", "ten" );
    assertEquals( 4, result.Id );
  }

  /**
   * @Test
   */
  public void function testGetByType() {
    var result = QueryUtils.getBy( testQuery(), "Id", 2, "cf_sql_integer" );
    assertEquals( 2, result.Id );
    assertEquals( "a0ju4", result.HexId );
  }

  /**
   * @Test
   */
  public void function testGetById() {
    var result = QueryUtils.getById( testQuery(), 6 );
    assertEquals( 6, result.Id );
    assertEquals( "a0ju8", result.HexId );
  }

  /**
   * @Test
   */
  public void function testGetLike() {
    var result = QueryUtils.getLike( testQuery(), "Foo", "ir" );
    assertEquals( 1, result.recordCount );
    assertEquals( 5, result.Id );

    result = QueryUtils.getLike( testQuery(), "Foo", "teen" );
    assertEquals( 2, result.recordCount );
    assertEquals( 5, result.Id[1] );
    assertEquals( 6, result.Id[2] );
  }

  private query function testQuery() {
    if ( !structKeyExists( variables, "_rs" ) ) {
      var data = [
        [ 1, "a0ju3", "one", "two", "three" ],
        [ 2, "a0ju4", "four", "five", "six" ],
        [ 3, "a0ju5", "seven", "eight", "nine" ],
        [ 4, "a0ju6", "ten", "eleven", "twelve" ],
        [ 5, "a0ju7", "thirteen", "fourteen", "fifteen" ],
        [ 6, "a0ju8", "sixteen", "seventeen", "eighteen" ]
      ];
      variables['_rs'] = queryNew( "Id,HexId,Foo,Bar,baz", "Integer,VarChar,VarChar,VarChar,VarChar", data );
    }
    return _rs;
  }
}
