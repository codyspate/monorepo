#!/bin/bash

echo "================== get last release ==================="
git tag -l --sort="-v:refname" > releases.txt
echo < releases.txt
previousRelease=-1
while IFS= read -r release
do
echo $release
if [[ $release == *"release-"* ]]; then
    echo "Previous release: " $release
    previousRelease=$release
    break
fi
done < releases.txt

if [[ $previousRelease == -1 ]]; then
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
if [[ $file != $0 ]]; then
    echo "This modified file is not under the '$0' folder."
    echo "::set-output name=run_job::false"
    break
else
    echo "::set-output name=run_job::true"
fi
done < files.txt