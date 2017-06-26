/*
 * Copyright 2016 Joel Tobey <joeltobey@gmail.com>
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
component {

    // Module Properties
    this.title              = "cfboom util";
    this.author             = "Joel Tobey";
    this.webURL             = "https://github.com/joeltobey/cfboom-util";
    this.description        = "The cfboom-util module provides core utilities used with cfboom";
    this.version            = "1.1.0";
    // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
    this.viewParentLookup   = true;
    // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
    this.layoutParentLookup = true;
    // Module Entry Point
    this.entryPoint         = "cfboom/util";
    // Model Namespace
    this.modelNamespace     = "cfboomUtil";
    // CF Mapping
    this.cfmapping          = "cfboom/util";
    // Auto-map models
    this.autoMapModels      = false;
    // Module Dependencies
    this.dependencies       = [ ];

    function configure(){

        // Binder Mappings
        binder.map("DateUtils@cfboomUtil").to("cfboom.util.DateUtils");
        binder.map("StringUtils@cfboomUtil").to("cfboom.util.StringUtils");
        binder.map("QueryUtils@cfboomUtil").to("cfboom.util.QueryUtils");
    }

    /**
     * Fired when the module is registered and activated.
     */
    function onLoad(){}

    /**
     * Fired when the module is unregistered and unloaded
     */
    function onUnload(){}

}