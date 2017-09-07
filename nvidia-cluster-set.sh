#! /bin/bash

if [[ $EUID -ne 0 ]]
then
    printf "%s\n" "This script must be run as root"
    exit 1
fi

read -d "\0" -a number_of_gpus < <(nvidia-smi --query-gpu=count --format=csv,noheader,nounits)
printf "%s\n" "found ${number_of_gpus[0]} gpu[s]..."
index=$(( number_of_gpus[0] - 1 ))

for i in $(seq 0 $index)
do
   gpu_name="null"
   gpu_id=`nvidia-smi -i $i --query-gpu=name --format=csv,noheader,nounits`

    case "$gpu_id" in
      *1060*)
        gpu_name="1060"
        power_limit=75
        memory_overclock=500
        grid=8192
        ;;
      *1070*)
        gpu_name="1070"
        power_limit=95
        memory_overclock=500
        grid=8192
        ;;
      *1080*)
        gpu_name="1080"
        power_limit=125
        memory_overclock=1500
        grid=16384
        ;;
      *)
        echo "nvidia card not supported"
        exit 1
        ;;
    esac

    if [ "$gpu_name" != "null" ]
    then
           printf "%s\n" "found GeForce GTX $gpu_name at index $i..."

           printf "%s\n" "setting persistence mode..."
           nvidia-smi -i $i -pm 1

           printf "%s\n" "setting power limit to $power_limit watts.."
           nvidia-smi -i $i -pl $power_limit

           printf "%s\n" "setting memory overclock of $memory_overclock Mhz..."
           nvidia-settings -a [gpu:${i}]/GPUMemoryTransferRateOffset[3]=$memory_overclock
    fi
done

