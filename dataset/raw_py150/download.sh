#!/usr/bin/env bash

if [ -z $NCC ]; then
  CACHE_DIR=~/ncc_data
else
  CACHE_DIR=$NCC/ncc_data
fi

data_names=raw_py150
data_urls='http://files.srl.inf.ethz.ch/data/py150_files.tar.gz'
echo "Downloading raw_py150 dataset"
DIR=${CACHE_DIR}/${data_names}/raw
mkdir -p ${DIR}
FILE=${DIR}/py150_files.tar.gz

# download
if [ -f $FILE ]; then
  echo "$FILE exists"
else
  wget -P ${DIR} ${data_urls}
fi

# decompress
tar -zxvf ${data_names}.tar.gz -C ${DIR}
tar -zxvf ${DIR}/data.tar.gz -C ${DIR}
