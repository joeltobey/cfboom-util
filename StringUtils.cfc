/*
 * Copyright 2016 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
 * Miscellaneous date utility methods.
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

    public string function generateUniqueId() {
        var uuid = createObject("java", "java.util.UUID").randomUUID().toString();
        uuid = replace(uuid,"-","","all");
        return uuid;
    }
}