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
 * @author Joel Tobey
 */
component
    extends="coldbox.system.testing.BaseTestCase"
    appMapping="/root"
	displayname="Class DateUtilsTest"
	output="false"
{
	// this will run once after initialization and before setUp()
	public void function beforeTests() {
		super.beforeTests();
		variables['DateUtils'] = getInstance("DateUtils@cfboomUtil");
	}

	// this will run once after all tests have been run
	public void function afterTests() {
		structDelete(variables, "DateUtils");
		super.afterTests();
	}

	public void function testParseIso8601Date() {
		var datetime = createDateTime(2016, 3, 15, 21, 44, 32);
		var datetimeUTC = dateConvert( "local2utc", datetime );
		var dateString = dateFormat(datetimeUTC, 'YYYY-mm-dd') &
			"T" &
			timeFormat(datetimeUTC, "HH:mm:ss") & ".000" &
			"Z";

		assertEquals(datetimeUTC, DateUtils.parseIso8601Date(dateString));
	}

	public void function testFormatIso8601Date() {
		var datetime = createDateTime(2016, 3, 15, 21, 44, 32);
		var datetimeUTC = dateConvert( "local2utc", datetime );
		var expected = dateFormat(datetimeUTC, 'YYYY-mm-dd') &
			"T" &
			timeFormat(datetimeUTC, "HH:mm:ss") & ".000" &
			"Z";

		assertEquals(expected, DateUtils.formatIso8601Date(datetime));
	}
}