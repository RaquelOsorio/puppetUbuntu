node 'server' {
	file{'/tmp/hello':
		content => "hola mundo",
	}
#	exec{"aptitude install bind9":
#		command => '/usr/bin/aptitude install bind9',
#	}
	file{'/etc/network/interfaces':
		content => template("/etc/puppet/templates/interfaces.erb"),
	}
	file{'/etc/bind/named.conf.local':
		content => template("/etc/puppet/templates/namedconflocal.erb"),
	}
	file{'/etc/bind/gcc.tp.db':
		content => template("/etc/puppet/templates/misitio.erb"),
	}
	exec{"bind9 restart":
		command => '/etc/init.d/bind9 restart',
	}
	file{'/etc/resolv.conf':
		content => template("/etc/puppet/templates/resolv.erb"),
	}
}
