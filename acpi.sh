#!/bin/sh
acpi | cut -d , -f 2 | sed "s/ //"
