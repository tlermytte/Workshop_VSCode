if [ -d "build" ]; then
rm -rf build
fi
mkdir build && cd build && cmake .. -G Unix\ Makefiles && cmake -build . && make