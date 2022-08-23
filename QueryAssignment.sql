
--man hinh login
select * from Account
where username = 'admin'
and [password] = 'admin'

--man hinh bang cham cong
--lay thong tin employees trong bang cham cong

--select e.ename, p.pname from Employee e inner join Position p
--						on e.pid = p.pid
--lay timesheet cua tung employee
SELECT e.eid,e.ename,ISNULL(t.tid,-1) tid,t.checkin,t.checkout
                                        FROM Employee e
                                        	LEFT JOIN (SELECT * FROM Timesheet WHERE 
                                       	checkin >= '2022/08/16'
                                        	AND
                                       	checkout < '2022/08/17') t
                                       	ON e.eid = t.eid

--lay thong tin ngay nghi cua tung employee
/*SELECT e.eid,e.ename,ISNULL(l.lid,-1) lid,l.[from],l.[to]
                                        FROM Employee e
                                        	LEFT JOIN (SELECT * FROM Leave WHERE 
                                       	[from] = ?
                                        	AND
                                       	[to] = ?) l
                                       	ON e.eid = l.eid
*/
--update ngay nghi
/*
delete from Leave
where lid = 5

insert into Leave(lid, eid, [from], [to], reason)
value (?, ?, ?, ?, ?)
*/
--tinh tong so cong

select count (*) from Timesheet
where eid = 1

--tinh tien luong voi mưc luong 200k/c
select sum = (select count (*) from Timesheet
where eid = 1)*200000

--tinh so ngay nghỉ:
--so ngay nghi khong phep, khong luong
select count (*) c from Leave
where eid = 5 and reason = 'K'

--so ngay nghi phep
select * from Leave
where eid = 1 and reason = 'P'

--so ngay nghi le
select * from Leave
where eid = 1 and reason = 'L'

--lay ra employees nghỉ khong phep qua so buoi quy dinh
/*select e.ename from Employee e right join Leave l
				on e.eid = l.eid
				and ((select count (*) from Leave
					where eid = 5 and reason = 'K') >= 3)
*/