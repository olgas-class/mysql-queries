-- Seleziona tutte le righe dalla tabella studenti
SELECT * 
FROM `students`;

-- Selezionare solo alcune colonne della tabella
SELECT `id`, `name`, `surname`
FROM `students`;

-- Filtrare i risultati
-- Seleziona tutti gli studenti con nome Aaron
SELECT *
FROM `students`
WHERE `name` = "Aaron";


-- Seleziona gli insegnanti con cognome Amato oppure con numero d'ufficio maggiore di 50
SELECT *
FROM `teachers`
WHERE `surname` = "Amato"
OR `office_number` > 50;

-- Ordinare gli studenti per la data di iscrizione
SELECT *
FROM `students`
ORDER BY `enrolment_date` DESC;

-- Quanti sono gli insenti che hanno un numero d'ufficio maggiore di 100?
SELECT count(`id`) AS `teachers_number`
FROM `teachers`
WHERE `office_number` > 100;

-- Selezionare tutti i referenti per ogni dipartimento
SELECT `id`, `name`, `head_of_department`
FROM `departments`;

-- Selezionare tutti gli studenti il cui nome inizia per "E" (373)
SELECT `id`, `name`, `surname`
FROM `students`
WHERE `name` LIKE "E%";

-- Selezionare tutti gli studenti che si sono iscritti nel 2021 (734)
-- 1 medodo: like trattando la data come stringa
SELECT * 
FROM `students`
WHERE `enrolment_date` LIKE "2021-%"
ORDER BY `enrolment_date` DESC;

-- 2. between per controllare se la data è compresa tra le due date
SELECT * 
FROM `students`
WHERE `enrolment_date` 
BETWEEN "2021-01-01" AND "2021-12-31"
ORDER BY `enrolment_date` DESC;

-- 3. utilizzando la funzione year di mysql
SELECT `id`, `name`, `surname`, YEAR(`enrolment_date`) AS `enrolment_year`
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021;

-- Selezionare tutti i corsi che non hanno un sito web (676)
SELECT `id`, `name`, `website`
FROM `courses`
WHERE `website` IS NULL;

-- Selezionare tutti gli insegnanti che hanno un numero di telefono (50)
SELECT * 
FROM `teachers`
WHERE `phone` IS NOT NULL;


-- Selezionare tutti gli appelli d'esame dei mesi di giugno e luglio 2020 (2634)

SELECT *
FROM `exams`
WHERE `date` 
BETWEEN "2020-06-01" AND "2020-07-31"
ORDER BY `date`;

SELECT *
FROM `exams`
WHERE YEAR(`date`) = 2020
AND MONTH(`date`) = 6
OR MONTH(`date`) = 7
ORDER BY `date` DESC;

-- Qual è il numero totale degli studenti iscritti? (5000)
SELECT COUNT(`id`) AS `students_number`
FROM `students`;


-- Inserimento di un dato
INSERT INTO `teachers` (`name`, `surname`, `phone`, `email`, `office_address`, `office_number`)
VALUES ("Olga", "Demina", "4353453435", "olga@gmail.com", "via Ok", 23);

-- Modifica di un dato in una riga
UPDATE `teachers`
SET `email` = "olga2@gmail.com"
WHERE `id` = 101;

-- Cancellazione del dato
DELETE FROM `teachers`
WHERE `id` = 101;