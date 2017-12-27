﻿/*
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
  displayname="Class JavaLoaderTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testWithJavaLoaderInit() {
    var javaLoader = getInstance( name="JavaLoader@cfboomUtil", initArguments = { useJavaLoader = true } );
    assertTrue( javaLoader.isUsingJavaLoader() );
    var obj = javaLoader.create( "java.lang.Object" );
    assertTrue( isObject( obj ) );
  }

  /**
   * @Test
   */
  public void function testWithJavaLoaderSetter() {
    var javaLoader = getInstance( "JavaLoader@cfboomUtil" );
    assertFalse( javaLoader.isUsingJavaLoader() );
    javaLoader.setUseJavaLoader( true );
    assertTrue( javaLoader.isUsingJavaLoader() );
    var obj = javaLoader.create( "java.lang.Object" );
    assertTrue( isObject( obj ) );
  }

  /**
   * @Test
   */
  public void function testWithOutJavaLoader() {
    var javaLoader = getInstance( "JavaLoader@cfboomUtil" );
    assertFalse( javaLoader.isUsingJavaLoader() );
    var obj = javaLoader.create( "java.lang.Object" );
    assertTrue( isObject( obj ) );
  }

}