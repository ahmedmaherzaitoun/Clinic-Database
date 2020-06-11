create schema if not exists `clinic` DEFAULT CHARACTER SET utf8 ;
Use `clinic` ; 

create table if not exists  `clinic`.`patient` (
  `patient_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `gender` VARCHAR(20) NOT NULL,
  `age` INT NOT NULL,
  `patient_phone` VARCHAR(20) NOT NULL,
  `adress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`patient_id`))
ENGINE = InnoDB;

insert into patient values (1,'Ahmed','Maher','male',20,'2921750','Edku');
insert into patient values (2,'Ahmed','belal','male',20,'0452912750','Edku');
insert into patient values (3,'Hoda','Maher','famale',44,'01101521552','cairo');
insert into patient values (4,'Mona','Ali','famale',25,'01158133773','alexandia');
insert into patient values (5,'Gamal','Mohamed','male',21,'01158133773','luxor');
insert into patient values (6,'Mostafa','Ibrahim','male',27,'01158133773','Edku');
insert into patient values (7,'esraa','fallah','famale',20,'01158133773','cairo');


create table if not exists `clinic`.`medicines` (
  `med_id` INT NOT NULL,
  `med_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`med_id`))
ENGINE = InnoDB;

insert into medicines values (1,'panadol','Medicine for headaches');
insert into medicines values (2,'catafast','Medicine for headaches');
insert into medicines values (3,'adol','Medicine for headaches');
insert into medicines values (4,'parstamol','Medicine for headaches');
insert into medicines values (5,'abimol','Medicine for headaches');
insert into medicines values (6,'abimol','Medicine for headaches');

create table if not exists `clinic`.`treatments` (
  `treat_id` INT NOT NULL,
  `treat_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`treat_id`))
ENGINE = InnoDB;

insert into treatments values(1,'Rest for a month');
insert into treatments values(2,'Rest for a month');
insert into treatments values(3,'Rest for a month');
insert into treatments values(4,'Rest for a month');
insert into treatments values(5,'Rest for a month');
insert into treatments values(6,'Rest for a month');
insert into treatments values(7,'Rest for a month');


create table if not exists `clinic`.`equipments` (
  `equip_id` INT NOT NULL,
  `equip_name` VARCHAR(45) NOT NULL,
  `request_date` DATETIME NOT NULL,
  `date_defected` DATETIME NOT NULL,
  PRIMARY KEY (`equip_id`))
ENGINE = InnoDB;

insert into equipments values (1,'Blood Glucose Monitor','2020-7-7','2027-5-4');
insert into equipments values (2,'Blood pressure device','2020=1-6','2028-7-8');
insert into equipments values (3,'Blood pressure device','2020=1-6','2028-7-8');
insert into equipments values (4,'Blood Glucose Monitor','2020-7-7','2027-5-4');
insert into equipments values (5,'Blood Glucose Monitor','2020-7-7','2027-5-4');
insert into equipments values (6,'Blood pressure device','2020=1-6','2028-7-8');
insert into equipments values (7,'Blood pressure device','2020=1-6','2028-7-8');
insert into equipments values (8,'Blood pressure device','2020=1-6','2028-7-8');

create table if not exists `clinic`.`examinations` (
  `examination_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `patient_complians` VARCHAR(100) NOT NULL,
  `med_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `treat_id` INT NOT NULL,
  `equip_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`examination_id`),
  INDEX `fk_check_up_equipments1_idx` (`equip_id` ASC) VISIBLE,
  INDEX `med_id_idx` (`med_id` ASC) VISIBLE,
  INDEX `treat_id_idx` (`treat_id` ASC) VISIBLE,
  INDEX `fk_examinations_patients1_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `med_id` FOREIGN KEY (`med_id`) REFERENCES `clinicsystem`.`medicines` (`med_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `treat_id` FOREIGN KEY (`treat_id`) REFERENCES `clinicsystem`.`treatments` (`treat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equip_id` FOREIGN KEY (`equip_id`) REFERENCES `clinicsystem`.`equipments` (`equip_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examinations_patient1` FOREIGN KEY (`patient_id`) REFERENCES `clinic`.`patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into examinations values(1,1,'I feel a stomach ache',1,8,1,1,'2020-1-4');
insert into examinations values(2,2,'I feel a stomach ache',2,5,2,2,'2020-7-4');
insert into examinations values(3,3,'I feel a headache',3,5,3,3,'2021-2-1');
insert into examinations values(4,4,'I feel a stomach ache',4,5,4,4,'2021-7-9');
insert into examinations values(5,5,'I feel a headache',5,5,5,5,'2019-2-4');
insert into examinations values(6,6,'I feel a headache',6,5,6,6,'2020-7-4');
