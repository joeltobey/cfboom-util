/*
 * Copyright 2016-2017 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
  displayname="Class RetryUtilsTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['RetryUtils'] = getInstance( "RetryUtils@cfboomUtil" );
    variables['_startDate'] = createDateTime( 2016, 3, 15, 21, 44, 32 );
    variables['_dateArray'] = [
      createDateTime( 2016, 3, 15, 21, 45, 12 ),
      createDateTime( 2016, 3, 15, 21, 46, 22 ),
      createDateTime( 2016, 3, 15, 21, 48, 32 ),
      createDateTime( 2016, 3, 15, 21, 52, 32 ),
      createDateTime( 2016, 3, 15, 22, 0, 32 ),
      createDateTime( 2016, 3, 15, 22, 15, 32 ),
      createDateTime( 2016, 3, 15, 22, 44, 32 ),
      createDateTime( 2016, 3, 15, 23, 44, 32 ),
      createDateTime( 2016, 3, 16, 1, 44, 32 ),
      createDateTime( 2016, 3, 16, 3, 44, 32 ),
      createDateTime( 2016, 3, 16, 5, 44, 32 ),
      createDateTime( 2016, 3, 16, 7, 44, 32 ),
      createDateTime( 2016, 3, 16, 9, 44, 32 ),
      createDateTime( 2016, 3, 16, 11, 44, 32 ),
      createDateTime( 2016, 3, 16, 13, 44, 32 ),
      createDateTime( 2016, 3, 16, 15, 44, 32 ),
      createDateTime( 2016, 3, 16, 17, 44, 32 ),
      createDateTime( 2016, 3, 16, 19, 44, 32 ),
      createDateTime( 2016, 3, 16, 21, 44, 32 ),
      createDateTime( 2016, 3, 16, 23, 44, 32 ),
      createDateTime( 2016, 3, 17, 1, 44, 32 ),
      createDateTime( 2016, 3, 17, 3, 44, 32 ),
      createDateTime( 2016, 3, 17, 5, 44, 32 ),
      createDateTime( 2016, 3, 17, 7, 44, 32 ),
      createDateTime( 2016, 3, 17, 9, 44, 32 ),
      createDateTime( 2016, 3, 17, 11, 44, 32 ),
      createDateTime( 2016, 3, 17, 13, 44, 32 ),
      createDateTime( 2016, 3, 17, 15, 44, 32 ),
      createDateTime( 2016, 3, 17, 17, 44, 32 ),
      createDateTime( 2016, 3, 17, 19, 44, 32 ),
      createDateTime( 2016, 3, 17, 21, 44, 32 ),
      createDateTime( 2016, 3, 17, 23, 44, 32 )
    ];
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete( variables, "RetryUtils" );
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testNextRetryFromBeginning() {
    for ( var i = 1; i <= arrayLen( _dateArray ); i++ ) {
      assertEquals( _dateArray[i], RetryUtils.nextRetryFromBeginning( _startDate, i ) );
    }
  }

  /**
   * @Test
   */
  public void function testNextRetryFromPrevious() {
    var previous = _startDate;
    for ( var i = 1; i <= arrayLen( _dateArray ); i++ ) {
      assertEquals( _dateArray[i], RetryUtils.nextRetryFromPrevious( previous, i ) );
      previous = _dateArray[i];
    }
  }

}