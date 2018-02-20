# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker and CEPH with a binary version of https://issues.liferay.com/browse/LPS-73608

## Supported Databases
These are the supported Database Management System (*DBMS*):
  - PostgreSQL

## Supported Application Servers
These are the supported App servers:
  - Tomcat

## Storage Backend
These are the supported storage backends:
  - CEPH

## Configuration
You need to adjust the configuration parameters in "configs/com.liferay.portal.store.s3.configuration.S3StoreConfiguration.cfg" to reflect your CEPH configuration


# License
These docker images are free software ("Licensed Software"); you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

These docker images are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; including but not limited to, the implied warranty of MERCHANTABILITY, NONINFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
