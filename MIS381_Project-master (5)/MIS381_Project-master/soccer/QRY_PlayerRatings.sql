SELECT
m.match_api_id
,m.home_player_1
,hp1.overall_rating 'hp1_rating'
,m.home_player_2
,hp2.overall_rating 'hp2_rating'
,m.home_player_3
,hp3.overall_rating 'hp3_rating'
,m.home_player_4
,hp4.overall_rating 'hp4_rating'
,m.home_player_5
,hp5.overall_rating 'hp5_rating'
,m.home_player_6
,hp6.overall_rating 'hp6_rating'
,m.home_player_7
,hp7.overall_rating 'hp7_rating'
,m.home_player_8
,hp8.overall_rating 'hp8_rating'
,m.home_player_9
,hp9.overall_rating 'hp9_rating'
,m.home_player_10
,hp10.overall_rating 'hp10_rating'
,m.home_player_11
,hp11.overall_rating 'hp11_rating'
,m.away_player_1
,ap1.overall_rating 'ap1_rating'
,m.away_player_2
,ap2.overall_rating 'ap2_rating'
,m.away_player_3
,ap3.overall_rating 'ap3_rating'
,m.away_player_4
,ap4.overall_rating 'ap4_rating'
,m.away_player_5
,ap5.overall_rating 'ap5_rating'
,m.away_player_6
,ap6.overall_rating 'ap6_rating'
,m.away_player_7
,ap7.overall_rating 'ap7_rating'
,m.away_player_8
,ap8.overall_rating 'ap8_rating'
,m.away_player_9
,ap9.overall_rating 'ap9_rating'
,m.away_player_10
,ap10.overall_rating 'ap10_rating'
,m.away_player_11
,ap11.overall_rating 'ap11_rating'

FROM match_simp m

INNER JOIN player_stats_simp hp1  on m.home_player_1 = hp1.player_api_id
INNER JOIN player_stats_simp hp2  on m.home_player_2 = hp2.player_api_id
INNER JOIN player_stats_simp hp3  on m.home_player_3 = hp3.player_api_id
INNER JOIN player_stats_simp hp4  on m.home_player_4 = hp4.player_api_id
INNER JOIN player_stats_simp hp5  on m.home_player_5 = hp5.player_api_id
INNER JOIN player_stats_simp hp6  on m.home_player_6 = hp6.player_api_id
INNER JOIN player_stats_simp hp7  on m.home_player_7 = hp7.player_api_id
INNER JOIN player_stats_simp hp8  on m.home_player_8 = hp8.player_api_id
INNER JOIN player_stats_simp hp9  on m.home_player_9 = hp9.player_api_id
INNER JOIN player_stats_simp hp10  on m.home_player_10 = hp10.player_api_id
INNER JOIN player_stats_simp hp11  on m.home_player_11 = hp11.player_api_id
INNER JOIN player_stats_simp ap1  on m.away_player_1 = ap1.player_api_id
INNER JOIN player_stats_simp ap2  on m.away_player_2 = ap2.player_api_id
INNER JOIN player_stats_simp ap3  on m.away_player_3 = ap3.player_api_id
INNER JOIN player_stats_simp ap4  on m.away_player_4 = ap4.player_api_id
INNER JOIN player_stats_simp ap5  on m.away_player_5 = ap5.player_api_id
INNER JOIN player_stats_simp ap6  on m.away_player_6 = ap6.player_api_id
INNER JOIN player_stats_simp ap7  on m.away_player_7 = ap7.player_api_id
INNER JOIN player_stats_simp ap8  on m.away_player_8 = ap8.player_api_id
INNER JOIN player_stats_simp ap9  on m.away_player_9 = ap9.player_api_id
INNER JOIN player_stats_simp ap10  on m.away_player_10 = ap10.player_api_id
INNER JOIN player_stats_simp ap11  on m.away_player_11 = ap11.player_api_id

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_1 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp1
on hp1.player_api_id = filter_hp1.player_api_id and hp1.date_stat = filter_hp1.MaxDate and m.date = filter_hp1.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_2 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp2
on hp2.player_api_id = filter_hp2.player_api_id and hp2.date_stat = filter_hp2.MaxDate and m.date = filter_hp2.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_3 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp3
on hp3.player_api_id = filter_hp3.player_api_id and hp3.date_stat = filter_hp3.MaxDate and m.date = filter_hp3.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_4 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp4
on hp4.player_api_id = filter_hp4.player_api_id and hp4.date_stat = filter_hp4.MaxDate and m.date = filter_hp4.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_5 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp5
on hp5.player_api_id = filter_hp5.player_api_id and hp5.date_stat = filter_hp5.MaxDate and m.date = filter_hp5.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_6 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp6
on hp6.player_api_id = filter_hp6.player_api_id and hp6.date_stat = filter_hp6.MaxDate and m.date = filter_hp6.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_7 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp7
on hp7.player_api_id = filter_hp7.player_api_id and hp7.date_stat = filter_hp7.MaxDate and m.date = filter_hp7.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_8 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp8
on hp8.player_api_id = filter_hp8.player_api_id and hp8.date_stat = filter_hp8.MaxDate and m.date = filter_hp8.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_9 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp9
on hp9.player_api_id = filter_hp9.player_api_id and hp9.date_stat = filter_hp9.MaxDate and m.date = filter_hp9.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_10 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp10
on hp10.player_api_id = filter_hp10.player_api_id and hp10.date_stat = filter_hp10.MaxDate and m.date = filter_hp10.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on home_player_11 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_hp11
on hp11.player_api_id = filter_hp11.player_api_id and hp11.date_stat = filter_hp11.MaxDate and m.date = filter_hp11.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_1 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap1
on ap1.player_api_id = filter_ap1.player_api_id and ap1.date_stat = filter_ap1.MaxDate and m.date = filter_ap1.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats
LEFT JOIN match on away_player_2 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap2
on ap2.player_api_id = filter_ap2.player_api_id and ap2.date_stat = filter_ap2.MaxDate and m.date = filter_ap2.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_3 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap3
on ap3.player_api_id = filter_ap3.player_api_id and ap3.date_stat = filter_ap3.MaxDate and m.date = filter_ap3.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_4 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap4
on ap4.player_api_id = filter_ap4.player_api_id and ap4.date_stat = filter_ap4.MaxDate and m.date = filter_ap4.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_5 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap5
on ap5.player_api_id = filter_ap5.player_api_id and ap5.date_stat = filter_ap5.MaxDate and m.date = filter_ap5.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_6 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap6
on ap6.player_api_id = filter_ap6.player_api_id and ap6.date_stat = filter_ap6.MaxDate and m.date = filter_ap6.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_7 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap7
on ap7.player_api_id = filter_ap7.player_api_id and ap7.date_stat = filter_ap7.MaxDate and m.date = filter_ap7.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_8 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap8
on ap8.player_api_id = filter_ap8.player_api_id and ap8.date_stat = filter_ap8.MaxDate and m.date = filter_ap8.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_9 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap9
on ap9.player_api_id = filter_ap9.player_api_id and ap9.date_stat = filter_ap9.MaxDate and m.date = filter_ap9.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_10 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap10
on ap10.player_api_id = filter_ap10.player_api_id and ap10.date_stat = filter_ap10.MaxDate and m.date = filter_ap10.date

INNER JOIN (
SELECT player_api_id, date, max(date_stat) 'MaxDate' 
FROM player_stats_simp
LEFT JOIN match on away_player_11 = player_api_id and date > date_stat GROUP BY player_api_id, date) filter_ap11
on ap11.player_api_id = filter_ap11.player_api_id and ap11.date_stat = filter_ap11.MaxDate and m.date = filter_ap11.date