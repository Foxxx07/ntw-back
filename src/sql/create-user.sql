-- Password: $ pwgen -cnsyBC 32
CREATE USER IF NOT EXISTS 'imap_contacts'@'%' IDENTIFIED BY 'VVpVk>*ATqoe-(f|a99Wz</7s7anri/[';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'imap_contacts'@'%';
GRANT SELECT, UPDATE, INSERT, DELETE, EXECUTE ON `imap_contacts`.* TO 'imap_contacts'@'%';
FLUSH PRIVILEGES;