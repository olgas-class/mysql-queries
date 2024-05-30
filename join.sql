-- Selezionare tutti i corsi del Corso di Laurea in Informatica
SELECT `courses`.`id` AS `course_id`, `courses`.`name` AS `course_name`, `degrees`.`name` AS `degree_name`
FROM `courses`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";

-- Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT *
FROM `courses`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id` = 144;


-- Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)

SELECT `departments`.`name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia";

-- Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno
SELECT `exams`.`date`, `exams`.`hour`, `courses`.`name`, `courses`.`year`, `degrees`.`name`
FROM `exams`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea Magistrale in Fisica"
AND `courses`.`year` = 1
ORDER BY `courses`.`year` DESC;

-- Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere
SELECT DISTINCT `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`, `degrees`.`name` AS `degree_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `teachers`.`id`;


-- Selezionare il libretto universitario di Mirco Messina (matricola n. 620320)

SELECT `students`.`name`, `students`.`surname`, `courses`.`cfu`, `exam_student`.`vote`, `courses`.`name` AS `materia`, `exams`.`date` 
FROM `students`
INNER JOIN `exam_student`
ON `exam_student`.`student_id` = `students`.`id`
INNER JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
WHERE `students`.`registration_number` = "620320"
AND `exam_student`.`vote` >= 18;


-- Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati del corso di laurea associato, ordinati per media voto decrescente

-- Nome del corso | nome corso di laurea | ... altri dati del corso di laurea ..| voto medio di superamento d'esame

SELECT `courses`.`id`, `courses`.`name` AS `course_name`, `degrees`.`name` AS `degree_name`, `degrees`.`level`, AVG(`exam_student`.`vote`) AS `media_voto`
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
INNER JOIN `exam_student`
ON `exams`.`id` = `exam_student`.`exam_id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY `media_voto` DESC;