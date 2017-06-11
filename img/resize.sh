#!/usr/bin/env bash
limits=(100 200 250 500 750 1000)
foldername=resize
rm -r $foldername;
mkdir $foldername;
for size in "${limits[@]}"; do
    mkdir $foldername/w$size
    find . -maxdepth 1 -regextype posix-extended -iregex ".*(png|jpg|jpeg)"| while read imgfile; do
        convert "$imgfile" -resize $size "$foldername/w$size/$imgfile"
        echo "Processing file '$imgfile' with '$size'"

    done
done
