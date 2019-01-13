/*
 * Copyright 2016-2019 Joel Tobey <joeltobey@gmail.com>
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
  output="false"
{
  // Module Properties
  this.title              = "cfboom-util";
  this.author             = "Joel Tobey";
  this.webURL             = "https://github.com/joeltobey/cfboom-util";
  this.description        = "The cfboom-util module provides core utilities used with cfboom";
  this.version            = "2.2.0";
  // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
  this.viewParentLookup   = true;
  // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
  this.layoutParentLookup = true;
  // Module Entry Point
  this.entryPoint         = "util";
  // Inherit entry point from parent, so this will be /cfboom/util
  this.inheritEntryPoint  = true;
  // Model Namespace
  this.modelNamespace     = "cfboom-util";
  // CF Mapping
  this.cfmapping          = "cfboom/util";
  // Auto-map models
  this.autoMapModels      = false;
  // Module Dependencies
  this.dependencies       = [ "cfboom" ];

  function configure(){

    // Binder Mappings
    binder.map("DateUtils@cfboom-util").to("cfboom.util.DateUtils");
    binder.map("JavaLoader@cfboom-util").to("cfboom.util.JavaLoader");
    binder.map("QueryUtils@cfboom-util").to("cfboom.util.QueryUtils");
    binder.map("RetryUtils@cfboom-util").to("cfboom.util.RetryUtils");
    binder.map("StringUtils@cfboom-util").to("cfboom.util.StringUtils");

  }

  /**
   * Fired when the module is registered and activated.
   */
  function onLoad() {}

  /**
   * Fired when the module is unregistered and unloaded
   */
  function onUnload() {}

}
