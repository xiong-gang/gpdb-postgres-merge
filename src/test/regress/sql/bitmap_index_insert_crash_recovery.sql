create table bm_test (a int4, b int4);
create index bm_b_idx on bm_test using bitmap(b);
checkpoint;
insert into bm_test select i,i from generate_series(1,100000)i; 
drop table bm_test;

-- start_ignore
\! pkill postgres
\! gpstart -a
-- end_ignore

