class onos::install{

Exec{
        path => "/usr/bin:/usr/sbin:/bin:/sbin",
        timeout => 180,
}

file{ '/opt/networking-onos.tar':
        source =>"puppet:///modules/onos/networking-onos.tar",
} ->
file{ '/opt/networking-sfc.tar':
        source =>"puppet:///modules/onos/networking-sfc.tar",
} ->
file{ '/root/.m2/':
        ensure => 'directory',
        recurse => true,
} ->
file{ '/root/.m2/repository.tar':
        source => "puppet:///modules/onos/repository.tar",
} ->
exec{ "unzip packages":
        command => "tar vxf /opt/networking-onos.tar -C /opt;
        tar vxf /opt/networking-sfc.tar -C /opt;
        tar xf /root/.m2/repository.tar -C /root/.m2/",
} ->
exec{ "install driver and jdk":
        command => "sh /opt/networking-onos/install_driver.sh;
        sh /opt/networking-sfc/install_driver.sh",
} ->
exec{ "clean used files":
        command => "rm -rf /opt/networking-onos;
        rm -rf /opt/networking-sfc;
	rm -rf /root/.m2/*.tar"
}
}
