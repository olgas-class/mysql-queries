-- Contare i corsi raggruppati per cfu
SELECT `courses`.`cfu`, COUNT(`id`)
FROM `courses`
GROUP BY `courses`.`cfu`


-- Contare gli studenti raggruppati per anno di nascita
SELECT YEAR(`students`.`date_of_birth`) AS `year_of_birth`, COUNT(*) AS `students_number`
FROM `students`
GROUP BY `year_of_birth`


-- Selezionare il voto più basso dato ad ogni appello d'esame
SELECT `exam_student`.`exam_id`, MIN(`exam_student`.`vote`) AS `voto_minimo`
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`;

-- Contare gli appelli d'esame del mese di luglio raggruppati per giorno
SELECT DAY(`exams`.`date`) as `exam_day`, COUNT(*) AS `numero_appelli`
FROM `exams`
WHERE MONTH(`exams`.`date`) = 7
GROUP BY `exam_day`
ORDER BY `numero_appelli`