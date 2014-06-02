class trove::templates {
	file { ["/etc/trove/templates", "/etc/trove/templates/cassandra", "/etc/trove/templates/couchbase", "/etc/trove/templates/mongodb", "/etc/trove/templates/mysql", "/etc/trove/templates/percona", "/etc/trove/templates/redis"]:
		ensure => directory,
	}

	file { "/etc/trove/templates/cassandra/config.template":
		source => "puppet:///files/trove/etc/templates/cassandra/config.template",
	}

	file { "/etc/trove/templates/cassandra/heat.template":
		source => "puppet:///files/trove/etc/templates/cassandra/heat.template",
	}

	file { "/etc/trove/templates/cassandra/override.conf.template":
		source => "puppet:///files/trove/etc/templates/cassandra/override.config.template",
	}

	file { "/etc/trove/templates/couchbase/config.template":
		source => "puppet:///files/trove/etc/templates/couchbase/config.template",
	}

	file { "/etc/trove/templates/couchbase/override.config.template":
		source => "puppet:///files/trove/etc/templates/couchbase/override.config.template",
	}

	file { "/etc/trove/templates/mongodb/config.template":
		source => "puppet:///files/trove/etc/templates/mongodb/config.template",
	}

	file { "/etc/trove/templates/mongodb/heat.template":
		source => "puppet:///files/trove/etc/templates/mongodb/heat.template",
	}

	file { "/etc/trove/templates/mongodb/override.config.template":
		source => "puppet:///files/trove/etc/templates/mongodb/override.config.template",
	}

	file { "/etc/trove/templates/mysql/config.template":
		source => "puppet:///files/trove/etc/templates/mysql/config.template",
	}

	file { "/etc/trove/templates/mysql/heat.template":
		source => "puppet:///files/trove/etc/templates/mysql/heat.template",
	}

	file { "/etc/trove/templates/mysql/override.config.template":
		source => "puppet:///files/trove/etc/templates/mysql/override.config.template",
	}

	file { "/etc/trove/templates/mysql/validation-rules.json":
		source => "puppet:///files/trove/etc/templates/mysql/validation-rules.json",
	}

	file { "/etc/trove/templates/percona/config.template":
		source => "puppet:///files/trove/etc/templates/percona/config.template",
	}

	file { "/etc/trove/templates/percona/override.config.template":
		source => "puppet:///files/trove/etc/templates/percona/override.config.template",
	}

	file { "/etc/trove/templates/percona/validation-rules.json":
		source => "puppet:///files/trove/etc/templates/percona/validation-rules.json",
	}

	file { "/etc/trove/templates/redis/config.template":
		source => "puppet:///files/trove/etc/templates/redis/config.template",
	}

	file { "/etc/trove/templates/redis/override.config.template":
		source => "puppet:///files/trove/etc/templates/redis/override.config.template",
	}

}
