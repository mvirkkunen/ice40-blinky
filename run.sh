set -e

tool="docker run -it --rm -v $(pwd):/app -u $(id -u):$(id -g) -w /app gcr.io/hdl-containers/impl/icestorm"

rm -rf build
mkdir -p build

$tool yosys -p "synth_ice40 -top blinky -json build/ice40.json" blinky.v
$tool nextpnr-ice40 --hx1k --package vq100 --asc build/ice40.asc --pcf ice40hx1k-evb.pcf --json build/ice40.json
$tool icepack build/ice40.asc build/ice40.bin
iceprogduino build/ice40.bin

