CREATE TABLE IF NOT EXISTS `@PREFIX@ftv2_custom_menu` (
  `id_ftv2_custom_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ftv2_custom_menu`),
  KEY `id_employee` (`id_employee`)
) ENGINE=@ENGINE@ DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
