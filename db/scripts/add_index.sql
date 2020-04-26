ALTER TABLE `simple_cms_development`.`notes` 
CHANGE COLUMN `prev_note` `prev_note` BIGINT(20) NULL DEFAULT NULL ,
CHANGE COLUMN `next_note` `next_note` BIGINT(20) NULL DEFAULT NULL ,
ADD INDEX `fk_noteList_idx` (`next_note` ASC);

ALTER TABLE `simple_cms_development`.`notes` 
ADD CONSTRAINT `fk_noteList`
  FOREIGN KEY (`next_note`)
  REFERENCES `simple_cms_development`.`notes` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;