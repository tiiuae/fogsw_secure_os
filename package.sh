#!/bin/bash

get_version() {
    #version=0.1.0~$(git describe --always --tags --match "[0-9]*.[0-9]*.[0-9]*")
    version=0.1.0
    echo ${version}
}

make_deb() {
	echo "Creating deb package..."
	build_dir=$(mktemp -d)
	mkdir ${build_dir}/DEBIAN
    cp debian/control ${build_dir}/DEBIAN/
    cp debian/postinst ${build_dir}/DEBIAN/
    cp debian/postrm ${build_dir}/DEBIAN/
	cp -r etc ${build_dir}
    chmod 755 ${build_dir}/DEBIAN/postinst
    chmod 755 ${build_dir}/DEBIAN/postrm

	get_version
	sed -i "s/VERSION/${version}/" ${build_dir}/DEBIAN/control
	cat ${build_dir}/DEBIAN/control
	echo fogsw-secure-os_${version}_all.deb
	fakeroot dpkg-deb --build ${build_dir} ../fogsw-secure-os_${version}_all.deb
	rm -rf ${build_dir}
	echo "Done"
}

version=$(get_version)
make_deb
