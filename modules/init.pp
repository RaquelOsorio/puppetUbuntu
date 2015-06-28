class servicios{
	file{'/etc/network/interfaces':
		content => template("/etc/puppet/templates/interfaces.erb"),
	}
}
