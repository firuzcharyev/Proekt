Create database Dmir
use Dmir
go
create table klient 
(
k_nom1 Numeric (6) PRIMARY KEY, 
k_name nvarchar(100),
k_passport numeric(12)
)

create table sotrudnik
(
s_id Numeric (6)  PRIMARY KEY,
s_name nvarchar(100),
s_passport numeric(12),
s_phone nvarchar(16),
s_sotrudnik nvarchar(100),
)
create table nomer
(
n_nom3  Numeric (6)PRIMARY KEY,
n_komfort nvarchar(50) not null,
n_price Numeric (10) not null,
n_komnat nvarchar (50) not null,

     
);

create table bronirovanie
(
b_nom2 Numeric (6) PRIMARY KEY,
s_id numeric(6),
k_nom1 numeric(6),     
b_date datetime,
n_nom3  Numeric (6)
CONSTRAINT fklient__k_nom1 FOREIGN KEY (k_nom1) 
                    REFERENCES klient (k_nom1),
CONSTRAINT fsotrudnik_s_id FOREIGN KEY (s_id) 
			REFERENCES sotrudnik (s_id),
CONSTRAINT 	fnomer_n_nom3 FOREIGN KEY (n_nom3) 
			REFERENCES nomer (n_nom3)
)	

create table oplata
(
o_score Numeric (15) PRIMARY KEY,
b_nom2 numeric(6),
o_date datetime,
o_summa numeric(12) not null,
CONSTRAINT fbronirovanie_b_nom2 FOREIGN KEY (b_nom2) 
                    REFERENCES bronirovanie (b_nom2),

)

go

select * from klient
delete from klient

go

/*����������*/
create proc insert_sotr as
declare @num int, @name VARCHAR(100), @dolz VARCHAR(100)
set @num =1
while @num <= 15

begin
SET @dolz = ROUND(3*RAND(),0); 
SELECT  @dolz =  
CASE
 
WHEN @dolz = 1  THEN '���������'
WHEN @dolz = 2  THEN '��������'
WHEN @dolz = 3  THEN '�������� �� �����'
ELSE '������������� �����'
end

begin
SELECT  @name =   
CASE
 
WHEN @num = 1  THEN '������� ������'
WHEN @num = 2  THEN '����� �������'
WHEN @num = 3  THEN '�������� ������'
WHEN @num = 4  THEN '������ ��������'
WHEN @num = 5  THEN '������� ��������'
WHEN @num = 6  THEN '������ ������'
WHEN @num = 7  THEN '������� ����'
WHEN @num = 8  THEN '����� ��������'
WHEN @num = 9  THEN '�������� �����'
WHEN @num = 10 THEN '���� ��������'
WHEN @num = 11  THEN '���������� �������'
WHEN @num = 12  THEN '����������� ������'	
WHEN @num = 13  THEN '��������� ���'
WHEN @num = 14 THEN '������ ������'
ELSE '��� ̸���'
end

insert into sotrudnik (s_id, s_name, s_passport, s_phone, s_sotrudnik)
values(@num, @name, '1456697'+LTRIM(STR(@num)), '+7937588648'+LTRIM(STR(@num)),@dolz )
set @num = @num +1
end
end

exec insert_sotr
select * from sotrudnik
delete from sotrudnik

go
go
CREATE PROC  insert_nomer AS
DECLARE @nom INT, @price int, @komfort nvarchar(50)
SET @nom=1
WHILE @nom<=50
BEGIN
SELECT  @komfort =   
CASE
 
WHEN @nom = 10  THEN 'LUX'
WHEN @nom = 15  THEN '��������'
WHEN @nom = 20  THEN 'LUX'
WHEN @nom = 25  THEN '��������'
WHEN @nom = 30  THEN 'LUX'
WHEN @nom = 35  THEN '��������'
WHEN @nom = 40  THEN 'LUX'
WHEN @nom = 45  THEN '��������'
ELSE '��������'
end
begin SELECT  @price =   
CASE
 
WHEN @komfort = 'LUX'  THEN '4500'
WHEN @komfort = '��������'  THEN '3500'
WHEN @komfort = '��������'  THEN '2500'
else '1000'
end
	   INSERT INTO nomer(n_nom3 , n_komfort,n_price,n_komnat) 
            VALUES (@nom, @komfort, @price ,'�����'+LTRIM(STR(@nom)))
	   SET @nom=@nom+1	
    END
	END
exec insert_nomer
select * from nomer
go

CREATE PROC  insert_bronirovanie AS
declare @num int, @day int, @mounth int, @sotr int, @klient int, @nomer int, @x float, @y float
SET @num=1
WHILE @num<=12000
BEGIN
set @day = (rand()*27+1)
set @mounth= (rand()*11+1)
set @sotr= (rand()*15+1)
set @klient= (rand()*50+1)
set @nomer= (rand()*50+1)
begin
set @x = rand()
set @y = rand()
if @y <= 0.3
begin
set @x = rand()
set @day = (rand()*27+1)
set @mounth= (rand()*12+1)
if @x <=0.4
set @mounth = (rand()*4+5)
else
set @mounth= (rand()*12+1)
	   INSERT INTO bronirovanie(b_nom2, s_id,k_nom1,b_date,n_nom3) 
            VALUES (@num,@sotr,@klient, ltrim(str(@day))+'.'+ltrim(str(@mounth))+'.2018', @nomer)
	   SET @num=@num+1	

END
begin
set @day = (rand()*27+1)
set @mounth= (rand()*11+1)
set @sotr= (rand()*15+1)
set @klient= (rand()*50+1)
set @nomer= (rand()*50+1)
if @y > 0.3 and @y <=0.6
begin
set @x = rand()
set @day = (rand()*27+1)
set @mounth= (rand()*12+1)
if @x <=0.4
set @mounth = (rand()*4+5)
else
set @mounth= (rand()*12+1)
	   INSERT INTO bronirovanie(b_nom2, s_id,k_nom1,b_date,n_nom3) 
            VALUES (@num,@sotr,@klient, ltrim(str(@day))+'.'+ltrim(str(@mounth))+'.2019', @nomer)
	   SET @num=@num+1	
end
begin
set @day = (rand()*27+1)
set @mounth= (rand()*11+1)
set @sotr= (rand()*15+1)
set @klient= (rand()*50+1)
set @nomer= (rand()*50+1)
if @y>0.6
begin
set @x = rand()
set @day = (rand()*27+1)
set @mounth= (rand()*12+1)
if @x <=0.4
set @mounth = (rand()*4+5)
else
set @mounth= (rand()*12+1)
	   INSERT INTO bronirovanie(b_nom2, s_id,k_nom1,b_date,n_nom3) 
            VALUES (@num,@sotr,@klient, ltrim(str(@day))+'.'+ltrim(str(@mounth))+'.2020', @nomer)
	   SET @num=@num+1	

	   end
	   end
	   end
	   end
	   end
exec insert_bronirovanie
select * from bronirovanie
delete from bronirovanie
select count(b_date), sum( b_nom2) from bronirovanie where year(b_date)='2019'
group by b_date
order by 1
go


CREATE PROC ins_oplata AS
declare @num int, @sum int
SET @num=1
WHILE @num<=12000
begin 
set @sum= (rand()*10000+2000)
  INSERT INTO oplata(o_score, b_nom2, o_summa) 
            VALUES (@num,@num, @sum)
	   SET @num=@num+1	
end
begin 
update oplata
set o_date= b.b_date
from bronirovanie b
where b.b_nom2=oplata.b_nom2
end 

exec ins_oplata
select * from oplata
delete from oplata

/*3-�*/
SELECT distinct b.b_nom2 as '� �����', k.k_name as '��� �������', n.n_komnat as '����� �������', n.n_komfort as '��� ������',
       n.n_price as '���� �����', s.s_name as '���������' , s.s_sotrudnik '���������',
	   o.o_score as '����� �����' ,  o.o_summa as '���� � �����, �.', o.o_date 
FROM  bronirovanie b JOIN oplata o ON o.b_nom2 =b.b_nom2 
             JOIN  klient k ON k.k_nom1 =b.k_nom1
			 JOIN nomer n ON n.n_nom3=b.n_nom3
			 JOIN sotrudnik s ON s.s_id =b.s_id
			 order by b.b_nom2

go
CREATE VIEW otchet 
as
SELECT b.b_nom2 as '� �����', k.k_name as '��� �������', n.n_komnat as '����� �������', n.n_komfort as '��� ������',
       n.n_price as '���� �����', b.b_date as '���� �����', s.s_name as '���������' , s.s_sotrudnik '���������',
	   o.o_score as '����� �����' ,  o.o_summa as '���� � �����, �.', o.o_date as '���� �����'
   FROM  bronirovanie b JOIN oplata o ON o.b_nom2 =b.b_nom2 
             JOIN  klient k ON k.k_nom1 =b.k_nom1
			 JOIN nomer n ON n.n_nom3=b.n_nom3
			 JOIN sotrudnik s ON s.s_id =b.s_id
			 go
select * from otchet

Create table fullotchet
( b_nom2 Numeric (6),
  k_name nvarchar(100),
  n_komnat nvarchar (50),
  n_komfort nvarchar(50),
  n_price Numeric (10),
  b_date datetime,
  s_name nvarchar(100),
  s_sotrudnik nvarchar(100),
  o_score Numeric (15),
  o_summa numeric(12),
  o_date datetime
  CONSTRAINT fbronirovanie PRIMARY KEY(b_nom2,n_komnat, o_score)
)

INSERT INTO fullotchet SELECT * FROM otchet;
select *from fullotchet

go
/*������� ��� ����������� � ���������� ������������ ������� ������ ���� ���������*/
select s_name as 'FIO', Count(n_komnat) as '����������'
From fullotchet where s_sotrudnik= '���������'
Group By s_name

/*(4)������� ���������� � ������������� ������ ����*/
select b_nom2, n_komnat,  k_name, n_price, b_date
from fullotchet where n_komfort='LUX'

/* ����� ������ �� ������� � ������� ����.*/
SELECT Year(o_date) as '���', SUM(o_summa) as '����� ������, �.' FROM fullotchet
GROUP BY year(o_date)  
ORDER BY '���' ASC

/*���������� ������������� ���� ������ �� ������ ���*/
select n_komnat as '� Kom',  year(b_date) as '���' ,  Count(n_komnat) as 'KOL'  from fullotchet
where n_komfort= 'LUX'
group by n_komnat,year(b_date)

/*����� ����� ������� �� ��� ������ �� ���������� � �����*/
select k_name, Sum(o_summa) as '�����' from fullotchet
where YEAR(b_date)= '2018' and  k_name= '������ ��������'
group by k_name

go 

CREATE proc kub  @NUMBER nvarchar(50)
AS
SELECT
n_komfort as '��� ������', n_price as '����', COUNT(b_nom2) as '���������� �����'     
FROM fullotchet
WHERE n_komnat =@NUMBER
group by n_komfort , n_price

exec kub '�����10'


 /* ������������� Pivot-  ����� ���������� ���� �� ����� ������� �� ������� �� 3 ����*/
  
  SELECT n_komfort as "���������",   
  [01]as '������', [02]as '�������' ,[03]as '����', [04]as '������', [05]as '���' ,[06]as '����', [07]as '����', [08]as '������', 
  [09]as '��������', [10]as '������', [11]as '�������',[12] as '�������'
FROM  
(SELECT   n_komfort, o_date= Month(o_date), o_summa
    FROM fullotchet) AS SourceTable  
PIVOT  
(  
sum(o_summa)  
FOR o_date IN ([01], [02] ,[03], [04], [05] ,[06], [07], [08], [09], [10], [11], [12])  
) AS PivotTable


/*4-��*/

/*�������� �� ������������� NULL*/
SELECT * FROM fullotchet WHERE o_date IS NULL
SELECT * FROM fullotchet WHERE o_score IS NULL
SELECT * FROM fullotchet WHERE o_summa IS NULL
SELECT * FROM fullotchet WHERE k_name IS NULL

SELECT * FROM fullotchet WHERE o_summa NOT IN
 (SELECT o_summa FROM oplata)


 Insert into  fullotchet (b_nom2, k_name,  n_komnat,  n_komfort, b_date, s_name, s_sotrudnik, o_score,o_summa, o_date)
 values (101, '������� ������', '�����40', 'LUX' ,'2020-14-05', '������ ������', '���������', 101, 10000 ,'2020-14-05')

 SELECT * FROM fullotchet WHERE n_price IS NULL


 
go

create proc insertnull 
as
declare @price int
set @price = (select n.n_price from nomer n, fullotchet f where n.n_komnat = f.n_komnat and f.n_price is null)
begin
update fullotchet
set  n_price = @price
where n_price is null
end

exec insertnull
 SELECT * FROM fullotchet WHERE n_price IS NULL

select*from fullotchet

go
