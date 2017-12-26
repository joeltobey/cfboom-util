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
 * Miscellaneous retry utility methods.
 *
 * @auther Joel Tobey
 */
component singleton
  displayname="Class RetryUtils"
  output="false"
{
  variables['RETRY'] = {};

  RETRY[1] = {};
  RETRY.1['fromBeginning'] = {};
  RETRY.1.fromBeginning['datepart'] = "s";
  RETRY.1.fromBeginning['number'] = 30;
  RETRY.1['fromPrevious'] = {};
  RETRY.1.fromPrevious['datepart'] = "s";
  RETRY.1.fromPrevious['number'] = 30;

  RETRY[2] = {};
  RETRY.2['fromBeginning'] = {};
  RETRY.2.fromBeginning['datepart'] = "s";
  RETRY.2.fromBeginning['number'] = 30 + 60;
  RETRY.2['fromPrevious'] = {};
  RETRY.2.fromPrevious['datepart'] = "n";
  RETRY.2.fromPrevious['number'] = 1;

  RETRY[3] = {};
  RETRY.3['fromBeginning'] = {};
  RETRY.3.fromBeginning['datepart'] = "s";
  RETRY.3.fromBeginning['number'] = 30 + 60 + 120;
  RETRY.3['fromPrevious'] = {};
  RETRY.3.fromPrevious['datepart'] = "n";
  RETRY.3.fromPrevious['number'] = 2;

  RETRY[4] = {};
  RETRY.4['fromBeginning'] = {};
  RETRY.4.fromBeginning['datepart'] = "s";
  RETRY.4.fromBeginning['number'] = 30 + 60 + 120 + 240;
  RETRY.4['fromPrevious'] = {};
  RETRY.4.fromPrevious['datepart'] = "n";
  RETRY.4.fromPrevious['number'] = 4;

  RETRY[5] = {};
  RETRY.5['fromBeginning'] = {};
  RETRY.5.fromBeginning['datepart'] = "s";
  RETRY.5.fromBeginning['number'] = 30 + 60 + 120 + 240 + 480;
  RETRY.5['fromPrevious'] = {};
  RETRY.5.fromPrevious['datepart'] = "n";
  RETRY.5.fromPrevious['number'] = 8;

  RETRY[6] = {};
  RETRY.6['fromBeginning'] = {};
  RETRY.6.fromBeginning['datepart'] = "n";
  RETRY.6.fromBeginning['number'] = 32;
  RETRY.6['fromPrevious'] = {};
  RETRY.6.fromPrevious['datepart'] = "n";
  RETRY.6.fromPrevious['number'] = 16;

  RETRY[7] = {};
  RETRY.7['fromBeginning'] = {};
  RETRY.7.fromBeginning['datepart'] = "n";
  RETRY.7.fromBeginning['number'] = 64;
  RETRY.7['fromPrevious'] = {};
  RETRY.7.fromPrevious['datepart'] = "n";
  RETRY.7.fromPrevious['number'] = 32;

  RETRY[8] = {};
  RETRY.8['fromBeginning'] = {};
  RETRY.8.fromBeginning['datepart'] = "n";
  RETRY.8.fromBeginning['number'] = 128;
  RETRY.8['fromPrevious'] = {};
  RETRY.8.fromPrevious['datepart'] = "n";
  RETRY.8.fromPrevious['number'] = 64;

  RETRY[9] = {};
  RETRY.9['fromBeginning'] = {};
  RETRY.9.fromBeginning['datepart'] = "h";
  RETRY.9.fromBeginning['number'] = 4;
  RETRY.9['fromPrevious'] = {};
  RETRY.9.fromPrevious['datepart'] = "h";
  RETRY.9.fromPrevious['number'] = 2;

  RETRY[10] = {};
  RETRY.10['fromBeginning'] = {};
  RETRY.10.fromBeginning['datepart'] = "h";
  RETRY.10.fromBeginning['number'] = 6;
  RETRY.10['fromPrevious'] = {};
  RETRY.10.fromPrevious['datepart'] = "h";
  RETRY.10.fromPrevious['number'] = 2;

  RETRY[11] = {};
  RETRY.11['fromBeginning'] = {};
  RETRY.11.fromBeginning['datepart'] = "h";
  RETRY.11.fromBeginning['number'] = 8;
  RETRY.11['fromPrevious'] = {};
  RETRY.11.fromPrevious['datepart'] = "h";
  RETRY.11.fromPrevious['number'] = 2;

  RETRY[12] = {};
  RETRY.12['fromBeginning'] = {};
  RETRY.12.fromBeginning['datepart'] = "h";
  RETRY.12.fromBeginning['number'] = 10;
  RETRY.12['fromPrevious'] = {};
  RETRY.12.fromPrevious['datepart'] = "h";
  RETRY.12.fromPrevious['number'] = 2;

  RETRY[13] = {};
  RETRY.13['fromBeginning'] = {};
  RETRY.13.fromBeginning['datepart'] = "h";
  RETRY.13.fromBeginning['number'] = 12;
  RETRY.13['fromPrevious'] = {};
  RETRY.13.fromPrevious['datepart'] = "h";
  RETRY.13.fromPrevious['number'] = 2;

  RETRY[14] = {};
  RETRY.14['fromBeginning'] = {};
  RETRY.14.fromBeginning['datepart'] = "h";
  RETRY.14.fromBeginning['number'] = 14;
  RETRY.14['fromPrevious'] = {};
  RETRY.14.fromPrevious['datepart'] = "h";
  RETRY.14.fromPrevious['number'] = 2;

  RETRY[15] = {};
  RETRY.15['fromBeginning'] = {};
  RETRY.15.fromBeginning['datepart'] = "h";
  RETRY.15.fromBeginning['number'] = 16;
  RETRY.15['fromPrevious'] = {};
  RETRY.15.fromPrevious['datepart'] = "h";
  RETRY.15.fromPrevious['number'] = 2;

  RETRY[16] = {};
  RETRY.16['fromBeginning'] = {};
  RETRY.16.fromBeginning['datepart'] = "h";
  RETRY.16.fromBeginning['number'] = 18;
  RETRY.16['fromPrevious'] = {};
  RETRY.16.fromPrevious['datepart'] = "h";
  RETRY.16.fromPrevious['number'] = 2;

  RETRY[17] = {};
  RETRY.17['fromBeginning'] = {};
  RETRY.17.fromBeginning['datepart'] = "h";
  RETRY.17.fromBeginning['number'] = 20;
  RETRY.17['fromPrevious'] = {};
  RETRY.17.fromPrevious['datepart'] = "h";
  RETRY.17.fromPrevious['number'] = 2;

  RETRY[18] = {};
  RETRY.18['fromBeginning'] = {};
  RETRY.18.fromBeginning['datepart'] = "h";
  RETRY.18.fromBeginning['number'] = 22;
  RETRY.18['fromPrevious'] = {};
  RETRY.18.fromPrevious['datepart'] = "h";
  RETRY.18.fromPrevious['number'] = 2;

  RETRY[19] = {};
  RETRY.19['fromBeginning'] = {};
  RETRY.19.fromBeginning['datepart'] = "h";
  RETRY.19.fromBeginning['number'] = 24;
  RETRY.19['fromPrevious'] = {};
  RETRY.19.fromPrevious['datepart'] = "h";
  RETRY.19.fromPrevious['number'] = 2;

  RETRY[20] = {};
  RETRY.20['fromBeginning'] = {};
  RETRY.20.fromBeginning['datepart'] = "h";
  RETRY.20.fromBeginning['number'] = 26;
  RETRY.20['fromPrevious'] = {};
  RETRY.20.fromPrevious['datepart'] = "h";
  RETRY.20.fromPrevious['number'] = 2;

  RETRY[21] = {};
  RETRY.21['fromBeginning'] = {};
  RETRY.21.fromBeginning['datepart'] = "h";
  RETRY.21.fromBeginning['number'] = 28;
  RETRY.21['fromPrevious'] = {};
  RETRY.21.fromPrevious['datepart'] = "h";
  RETRY.21.fromPrevious['number'] = 2;

  RETRY[22] = {};
  RETRY.22['fromBeginning'] = {};
  RETRY.22.fromBeginning['datepart'] = "h";
  RETRY.22.fromBeginning['number'] = 30;
  RETRY.22['fromPrevious'] = {};
  RETRY.22.fromPrevious['datepart'] = "h";
  RETRY.22.fromPrevious['number'] = 2;

  RETRY[23] = {};
  RETRY.23['fromBeginning'] = {};
  RETRY.23.fromBeginning['datepart'] = "h";
  RETRY.23.fromBeginning['number'] = 32;
  RETRY.23['fromPrevious'] = {};
  RETRY.23.fromPrevious['datepart'] = "h";
  RETRY.23.fromPrevious['number'] = 2;

  RETRY[24] = {};
  RETRY.24['fromBeginning'] = {};
  RETRY.24.fromBeginning['datepart'] = "h";
  RETRY.24.fromBeginning['number'] = 34;
  RETRY.24['fromPrevious'] = {};
  RETRY.24.fromPrevious['datepart'] = "h";
  RETRY.24.fromPrevious['number'] = 2;

  RETRY[25] = {};
  RETRY.25['fromBeginning'] = {};
  RETRY.25.fromBeginning['datepart'] = "h";
  RETRY.25.fromBeginning['number'] = 36;
  RETRY.25['fromPrevious'] = {};
  RETRY.25.fromPrevious['datepart'] = "h";
  RETRY.25.fromPrevious['number'] = 2;

  RETRY[26] = {};
  RETRY.26['fromBeginning'] = {};
  RETRY.26.fromBeginning['datepart'] = "h";
  RETRY.26.fromBeginning['number'] = 38;
  RETRY.26['fromPrevious'] = {};
  RETRY.26.fromPrevious['datepart'] = "h";
  RETRY.26.fromPrevious['number'] = 2;

  RETRY[27] = {};
  RETRY.27['fromBeginning'] = {};
  RETRY.27.fromBeginning['datepart'] = "h";
  RETRY.27.fromBeginning['number'] = 40;
  RETRY.27['fromPrevious'] = {};
  RETRY.27.fromPrevious['datepart'] = "h";
  RETRY.27.fromPrevious['number'] = 2;

  RETRY[28] = {};
  RETRY.28['fromBeginning'] = {};
  RETRY.28.fromBeginning['datepart'] = "h";
  RETRY.28.fromBeginning['number'] = 42;
  RETRY.28['fromPrevious'] = {};
  RETRY.28.fromPrevious['datepart'] = "h";
  RETRY.28.fromPrevious['number'] = 2;

  RETRY[29] = {};
  RETRY.29['fromBeginning'] = {};
  RETRY.29.fromBeginning['datepart'] = "h";
  RETRY.29.fromBeginning['number'] = 44;
  RETRY.29['fromPrevious'] = {};
  RETRY.29.fromPrevious['datepart'] = "h";
  RETRY.29.fromPrevious['number'] = 2;

  RETRY[30] = {};
  RETRY.30['fromBeginning'] = {};
  RETRY.30.fromBeginning['datepart'] = "h";
  RETRY.30.fromBeginning['number'] = 46;
  RETRY.30['fromPrevious'] = {};
  RETRY.30.fromPrevious['datepart'] = "h";
  RETRY.30.fromPrevious['number'] = 2;

  RETRY[31] = {};
  RETRY.31['fromBeginning'] = {};
  RETRY.31.fromBeginning['datepart'] = "h";
  RETRY.31.fromBeginning['number'] = 48;
  RETRY.31['fromPrevious'] = {};
  RETRY.31.fromPrevious['datepart'] = "h";
  RETRY.31.fromPrevious['number'] = 2;

  RETRY[32] = {};
  RETRY.32['fromBeginning'] = {};
  RETRY.32.fromBeginning['datepart'] = "h";
  RETRY.32.fromBeginning['number'] = 50;
  RETRY.32['fromPrevious'] = {};
  RETRY.32.fromPrevious['datepart'] = "h";
  RETRY.32.fromPrevious['number'] = 2;

  public cfboom.util.RetryUtils function init() {
    return this;
  }

  public struct function getRetry( required numeric num ) {
    if (structKeyExists(RETRY, num)) {
      return RETRY[num];
    } else {
      return RETRY.1;
    }
  }
}
