#!/bin/bash

perl ./LuaSrcGorge-pass1.pl < Bejeweled.lua > Bejeweled-lsg-pass1.lua
perl ./LuaSrcGorge-pass2.pl < Bejeweled-lsg-pass1.lua > Bejeweled-lsg-pass2.lua
