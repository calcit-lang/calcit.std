cargo build --release && \
rm -rfv dylibs && \
mkdir -p dylibs/ && \
ls target/release/ && \
cp -v target/release/libcalcit_std.* dylibs/
