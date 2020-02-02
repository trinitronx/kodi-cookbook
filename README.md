# kodi

[![Liberapay goal progress](https://img.shields.io/liberapay/goal/trinitronx.svg)](https://en.liberapay.com/trinitronx)
[![Donate using Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/trinitronx/donate)
[![Build Status](https://img.shields.io/travis/trinitronx/kodi-cookbook.svg)](https://travis-ci.org/trinitronx/kodi-cookbook)
[![Cookbook Version](http://img.shields.io/cookbook/v/kodi.svg)](https://supermarket.chef.io/cookbooks/kodi)

Description
===========

Installs & configures the ultimate DVD Player & Set Top Box, & next-generation of XBMC: [Kodi][1]

Usage
======
To use, simply add `kodi::default` to your runlist.

Attributes
----------

 - `node['kodi']['addons']`: An `Array` of addon package names to install. Optional. Default: `[]` (empty). For full list of available packages, see kodi ppa: http://kodi.wiki/view/Official_Ubuntu_PPA

Example
-------

For example, if we wanted to install kodi plus the `kodi-pvr-mythtv` addon onto an existing [mythtv][4] frontend & backend server...

Create a role: `roles/kodi-frontend.json`:

    {
      "json_class": "Chef::Role",
      "name": "kodi-frontend",
      "description": "Role for Kodi frontend servers",
      "default_attributes": {
        "kodi": {
          "addons": ["kodi-pvr-mythtv"]
        }
      },
      "run_list": [
        "recipe[kodi::default]"
      ]
    }

Then add `role[kodi-frontend]` to your node's `run_list`:

    {
      "name": "kodi.example.com",
      
      "run_list": [
        "role[base]",
        "role[mythtv-frontend]",
        "role[mythtv-backend]",
        "role[kodi-frontend]"
      ]
    }
    


Changes
=======

## v0.1.7:

* Minor enhancements
  * Guard old Chef against `source_url`, `issues_url` undefined method errors
  * Attempt to set up TravisCI deploy to Chef Supermarket

## v0.1.6:

* Minor packaging enhancements to meet new foodcritic requirements & cookbook quality metrics
  * Added CONTRIBUTING.md
  * Added TESTING.md
  * Added LICENSE file (GPL 3.0+)
  * Add `source_url`, `issues_url` to metadata
  * Fix FC072: Metadata should not contain "attribute" keyword
  * Fix FC069, FC078: Add spdx.org standardized license to metadata (NOTE: foodcritic was wanting string `GPL-3.0+` which they say is deprecated. We may need to switch again in future to `GPL-3.0-or-later` License Expression syntax as of v2.0)
  * Fix FC066: Add chef_version to metadata
* Many `test-kitchen` integration test framework fixes
  * Remove EOL platform versions
  * Add new LTS platform versions
  * Fix integration tests to pass on all platforms
  * Fight with TravisCI until we win

## v0.1.5:

* Minor enhancements
  * Add Usage example to README

## v0.1.4:

* First release of cookbook to [Chef Supermarket][2]
* Minor enhancements
  * Update README with changelog, license, & links

## v0.1.3:

* Minor enhancements
  * Ensure ubuntu support is in metadata

## v0.1.2:

* Minor enhancements
  * Ensure apt cookbook >= `2.6.0` is used (for PPA support in `apt_repository`)
  * Fix metadata depends for apt cookbook

## v0.1.1:

* Minor enhancements
  * Update metadata.rb with recipe & attributes
  * Adding badges to README

## v0.1.0:

* Initial version.
  * Working cookbook to install kodi + addon packages
  * Use [Travis CI](http://travis-ci.org) to automatically run tests for pull-requests & changes to this cookbook

Contributions
======

The source for this cookbook is hosted on
[GitHub](https://github.com/trinitronx/kodi-cookbook). If you have any issues with
this cookbook, please follow up there.

License and Author
==================

* Copyright 2016-2018 James Cuzella <[@trinitronx][3]>


Licensed under the GNU GPL, Version 3.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://choosealicense.com/licenses/gpl-3.0/#

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and

[1]: http://kodi.tv/
[2]: https://supermarket.chef.io/cookbooks/kodi
[3]: https://github.com/trinitronx
[4]: https://supermarket.chef.io/cookbooks/mythtv

