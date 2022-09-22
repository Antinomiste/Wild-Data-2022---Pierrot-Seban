#1. Affiche les prénoms et noms des sorciers qui se sont inscrits comme joueurs entre les années 1995 et 1998 (enrollment_date).
SELECT firstname, lastname FROM wizard
WHERE id in 
		(SELECT wizard_id FROM player
        WHERE YEAR(enrollment_date) BETWEEN 1995 and 1998)
;

#2. Affiche les prénoms et noms des sorciers (wizards) qui se sont inscrits comme joueurs entre les années 1995 et 1998 (enrollment_date) et qui ont pour rôle 'keeper'
SELECT firstname, lastname FROM wizard
WHERE id in 
		(SELECT wizard_id FROM player
        WHERE YEAR(enrollment_date) BETWEEN 1995 and 1998
        AND `role` = "keeper")
;

#3. Affiche les prénoms, noms et rôles des sorciers (wizards) qui se sont inscrits comme joueurs entre les années 1995 et 1998 (enrollment_date) et qui ont pour rôle ‘chaser’
SELECT firstname, lastname, `role` FROM wizard
INNER JOIN player
ON wizard.id = player.wizard_id
WHERE wizard.id in 
		(SELECT wizard_id FROM player
        WHERE YEAR(enrollment_date) BETWEEN 1995 and 1998
        AND `role` = "chaser")
;

#4. Affiche le nombre de joueurs par rôle et par équipe
CREATE VIEW count_player AS (
	SELECT team.`name`, `role`, count(wizard_id) AS N_players
    FROM player
    INNER JOIN team
    ON player.team_id = team.id
    GROUP BY team_id, `role`
    ORDER BY  team.`name`)
;
SELECT * FROM count_player
;
DROP VIEW count_player
;

#5. Affiche, pour l’équipe 'Gryffindor', les nom, prénom et le rôle des joueurs dont le rôle est 'chaser'
CREATE VIEW gryffindor_chasers AS
	(SELECT lastname, firstname, `role`
	FROM player, wizard, team
	WHERE player.wizard_id = wizard.id 
    AND player.team_id = team.id 
    AND team.`name` = "Gryffindor" 
    AND `role` = "chaser")
;
SELECT * from gryffindor_chasers
;
DROP VIEW gryffindor_chasers
;