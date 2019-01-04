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
  displayname="Class JavaLoaderTest"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    var binder = getWirebox().getBinder();
    binder.map( "loaderUsingJavaLoader@JavaLoaderTests" )
          .to( "cfboom.util.JavaLoader" )
          .initWith( useJavaLoader = true );
    binder.map( "loaderWithOutUsingJavaLoader@JavaLoaderTests" )
          .to( "cfboom.util.JavaLoader" );
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    super.afterTests();
    var binder = getWirebox().getBinder();
    binder.unmap( "loaderUsingJavaLoader@JavaLoaderTests" );
    binder.unmap( "loaderWithOutUsingJavaLoader@JavaLoaderTests" );
  }

  /**
   * @Test
   */
  public void function testWithJavaLoaderInit() {
    var javaLoader = getInstance( name="JavaLoader@cfboom-util", initArguments = { useJavaLoader = true } );
    assertTrue( javaLoader.isUsingJavaLoader() );
    var obj = javaLoader.create( "java.lang.Object" );
    assertTrue( isObject( obj ) );
  }

  /**
   * @Test
   */
  public void function testWithJavaLoaderSetter() {
    var javaLoader = getInstance( "JavaLoader@cfboom-util" );
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
    var javaLoader = getInstance( "JavaLoader@cfboom-util" );
    assertFalse( javaLoader.isUsingJavaLoader() );
    var obj = javaLoader.create( "java.lang.Object" );
    assertTrue( isObject( obj ) );
  }

  /**
   * @Test
   */
  public void function testBinderWithOutJavaLoader() {
    var loader = getInstance( "loaderWithOutUsingJavaLoader@JavaLoaderTests" );
    assertTrue( isInstanceOf( loader, "cfboom.util.JavaLoader" ) );
    assertFalse( loader.isUsingJavaLoader(), loader.toString() & " should not be using `cbjavaloader`" );
  }

  /**
   * @Test
   */
  public void function testBinderWithJavaLoader() {
    var loader = getInstance( "loaderUsingJavaLoader@JavaLoaderTests" );
    assertTrue( isInstanceOf( loader, "cfboom.util.JavaLoader" ) );
    assertTrue( loader.isUsingJavaLoader(), loader.toString() & " should be using `cbjavaloader`" );
  }
}
