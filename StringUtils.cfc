/*
 * Copyright 2017-2019 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * Miscellaneous string utility methods.
 *
 * @auther Joel Tobey
 * @singleton
 */
component
  displayname="Class StringUtils"
  output="false"
{
  public cfboom.util.StringUtils function init() {
    return this;
  }

  /**
   * Creates an UUID and removes the dashes.
   */
  public string function generateUniqueId() {
    var uuid = createObject("java", "java.util.UUID").randomUUID().toString();
    uuid = replace( uuid, "-", "", "all" );
    return uuid;
  }

  /**
   * Creates a random 32 string based on the numBits entered.
   */
  public string function getRandom( numeric numBits ) {
    var random = createObject("java", "java.security.SecureRandom").init();
    return createObject("java", "java.math.BigInteger").init( javaCast("int", numBits), random ).toString(32);
  }
}
