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
 * A facade for creating Java objects. Indended to be used as Singletons
 * where each configuration indicates whether it uses `cbjavaloader` or not.
 *
 * @auther Joel Tobey
 */
component
  displayname="Class JavaLoader"
  output="false"
{
  property name="wirebox" inject="wirebox";

  /**
   * Constructor.
   *
   * useJavaLoader.hint Flag indicating whether this loader will use `cbjavaloader` of not.
   */
  public cfboom.util.JavaLoader function init( boolean useJavaLoader = false ) {
    variables['_useJavaLoader'] = useJavaLoader;
    return this;
  }

  /**
   * Convenience method of setting 'useJavaLoader' at runtime.
   *
   * useJavaLoader.hint Flag indicating whether this loader will use `cbjavaloader` of not.
   */
  public void function setUseJavaLoader( required boolean useJavaLoader ) {
    variables['_useJavaLoader'] = useJavaLoader;
    onDIComplete();
  }

  /**
   * Indicates whether this loader is using `cbjavaloader` or not.
   */
  public boolean function isUsingJavaLoader() {
    return _useJavaLoader;
  }

  /**
   * Runs after Dependency Injection is complete.
   */
  public void function onDIComplete() {
    if ( _useJavaLoader )
      variables['_javaLoader'] = wirebox.getInstance( "loader@cbjavaloader" );
  }

  /**
   * Creates Java objects by using either createObject() or `cbjavaloader`.
   */
  public any function create( required string class ) {
    if ( _useJavaLoader ) {
      return _javaLoader.create( arguments.class );
    } else {
      return createObject( "java", arguments.class );
    }
  }

}
