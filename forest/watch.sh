#!/bin/bash

forester build forest.toml --dev

function f {
  fswatch --event Created --event Updated --event Removed --event Renamed --event MovedFrom --event MovedTo --event AttributeModified --event OwnerModified -o assets/ trees/ | while read num ;   do     echo Rebuilding forest
    time forester build forest.toml --dev
    echo Done
    echo
  done
}

f &
python -m http.server -d output

wait