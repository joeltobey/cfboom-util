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
 * A facade for creating Java objects. Indended to be used as Singletons
 * where each configuration indicates whether it uses `cbjavaloader` or not.
 *
 * @auther Joel Tobey
 */
component
  extends="cfboom.lang.Object"
  displayname="Class JavaLoader"
  output="false"
{
  property name="wirebox" inject="wirebox";
  property name="log" inject="logbox:logger:{this}";

  /**
   * Constructor.
   *
   * useJavaLoader.hint Flag indicating whether this loader will use `cbjavaloader` of not.
   */
  public cfboom.util.JavaLoader function init( boolean useJavaLoader = false ) {
    variables['_useJavaLoader'] = arguments.useJavaLoader;
    return this;
  }

  /**
   * Runs after Dependency Injection is complete.
   */
  public void function onDIComplete() {
    if ( variables._useJavaLoader ) {
      variables.log.debug( this.toString() & " configured using `cbjavaloader`" );
      variables['_javaLoader'] = variables.wirebox.getInstance( "loader@cbjavaloader" );
    } else {
      if (structKeyExists(variables, "log"))
        variables.log.debug( this.toString() & " configured using `createObject()`" );
    }
  }

  /**
   * Convenience method of setting 'useJavaLoader' at runtime.
   *
   * useJavaLoader.hint Flag indicating whether this loader will use `cbjavaloader` of not.
   */
  public void function setUseJavaLoader( required boolean useJavaLoader ) {
    variables['_useJavaLoader'] = arguments.useJavaLoader;
    onDIComplete();
  }

  /**
   * Indicates whether this loader is using `cbjavaloader` or not.
   */
  public boolean function isUsingJavaLoader() {
    return variables._useJavaLoader;
  }

  /**
   * Creates Java objects by using either createObject() or `cbjavaloader`.
   */
  public any function create( required string class ) {
    if ( variables._useJavaLoader ) {
      return _javaLoader.create( arguments.class );
    } else {
      return createObject( "java", arguments.class );
    }
  }

  /**
   * Returns the ClassLoader in case you need access to it.
   */
  public any function getClassLoader() {
    if ( variables._useJavaLoader ) {
      return _javaLoader.getURLClassLoader();
    } else {
      return getPageContext().getClassLoader();
    }
  }

  /**
   * Returns a Java class.
   */
  public any function loadClass( required string class ) {
    return getClassLoader().loadClass( arguments.class );
  }
}
