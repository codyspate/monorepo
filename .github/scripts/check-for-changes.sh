#!/bin/bash

echo $1
echo "================== get last release ==================="
git tag -l --sort="-v:refname" > releases.txt
previousRelease=-1
while IFS= read -r release
do
echo $release
echo $previousRelease
if [[ $previousRelease == 0 ]]; then
    echo "Previous release: " $release
    previousRelease=$release
    break
elif [[ $release == *"release-"* ]]; then
    previousRelease=0
fi
done < releases.txt

if [[ $previousRelease == -1 || $previousRelease == 0 ]]; then
    echo "Previous release not found"
    exit 1
fi

echo "=============== list modified files ==============="
git diff --name-only $previousRelease HEAD

echo "========== check paths of modified files =========="
git diff --name-only $previousRelease HEAD > files.txt
while IFS= read -r file
do
echo $file
if [[ $file != $1 ]]; then
    echo "This modified file is not under the '$1' folder."
    echo "::set-output name=run_job::false"
    break
else
    echo "::set-output name=run_job::true"
fi
done < files.txt