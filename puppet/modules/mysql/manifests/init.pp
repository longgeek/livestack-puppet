class mysql {
    Class["mysql"] -> Class["mysql::packages"] -> Class["mysql::databases"] -> Class["mysql::services"]
    include mysql, mysql::packages, mysql::databases, mysql::services
}
