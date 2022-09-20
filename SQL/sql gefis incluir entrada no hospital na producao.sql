/*
  select * from sstmunic where cdmuibge = '3119401'
  select top 5 * from informacoesusuario where idativo = 'S' and idobito = 'N' and cdmunicip = 2481 and ltrim(nucns) <> ''

  select top 10 * from sstentps order by dtultalt desc
  select dtinclusao , * from [gefis_cadastromovimentosanitas] order by id desc
  select char(39)+ cdprocext + char(39)  + ','  , ',' , * from sstproce where cdprocedi in (96 , 171 , 217 , 70 , 69 , 211 , 1515 , 168 , 88 )
  select char(39)+ cdprocext + char(39)  + ','  , ',' , * from sstproce where cdprocedi in (96 , 171 , 217)

select convert(varchar(8), getdate(), 112)
-- sscusuar.dtcadusua between '20100101' and convert(varchar(8), getdate(), 112) and
*/


set nocount on 
 declare @cdusuario numeric(12,0)


declare @Cursor_entrada cursor  
set @Cursor_entrada = CURSOR SCROLL DYNAMIC
FOR
select cdusuario from sscusuar where sscusuar.cdusuario = 158082
/*
select top 350 sscusuar.cdusuario  
from sscusuar 
  left join sstentps on  sstentps.cdusuario = sscusuar.cdusuario  
  inner join sscctous on sscctous.cdusuario = sscusuar.cdusuario  
where 
      sstentps.cdusuario is null and sscusuar.cdusuario  <> 0 and
      sscusuar.idativo = 'S' and sscusuar.idobito = 'N' and sscusuar.cdstender = 16 
-- order by dtcadusua desc
*/
 
 open @Cursor_entrada 
 
 FETCH NEXT FROM @Cursor_entrada 
 INTO @cdusuario
 
 WHILE @@FETCH_STATUS = 0 
 BEGIN 
 
    update sstsemen set nuultenps = nuultenps + 1                  , dtultalt = convert(char(8), getdate(), 112)                   , hhultalt = replace( convert(char(8), getdate(), 108) , ":" , "") 
    where cdsetor = 35

    update sstsemen set nuultauto = nuultauto + 1                  , dtultalt = convert(char(8), getdate(), 112)                   , hhultalt = replace( convert(char(8), getdate(), 108) , ":" , "") 
    where cdsetor = 35

    declare @num numeric(12,0) , @nuultauto numeric(12,0)
    Select @nuultauto = nuultauto from sstsemen where idativo = "S" and cdsetor = 35
    Select @num = nuultenps from sstsemen where idativo = "S" and cdsetor = 35

INSERT INTO sstentps (nuentrada, cdsetor, CDUSUARIO, nmusuarps, nuatend, dslococor, cdnatproc, dtentrada, hhentrada,  cdsetoror
                    , cdhospita, cdprofiss, statesmed, nudiasate, cdencamsa, dtsaida,  nmacompan, cdgparent, hhsaida, nuautoriz
					, cdsetoren, cdlocal, stcat
					, idativo, nucomput, cdususist, dtultalt, hhultalt 
					, cdusuinc, dtinclusao, hhinclusao )  /* 95001    122400   158082 (fabri) */ 
   		     VALUES ( @num , 35 , @cdusuario , "" , null , "" , 6 , convert(varchar(8),getdate(),112)  ,  replace(convert(varchar(20),getdate(),108),':','')
			       , 2 ,  null , 4834 , "N" , 0 , null , "" , "" , null , "" , null 
				   , 35 , 6 ,  " " 
				   , "S" , "MCR4152" , 4834 ,  convert(varchar(8),getdate(),112)  ,  replace(convert(varchar(20),getdate(),108),':','')
				   , 4834 , convert(varchar(8),getdate(),112)  ,  replace(convert(varchar(20),getdate(),108),':','')  )

UPDATE sstentps SET dtSaida = convert(varchar(8),getdate(),112)  ,hhsaida   = replace(convert(varchar(20),getdate()+(60*60),108),':','') ,cdencamsa = 12  ,cdprofsai = 356  ,statesmed = "N"  ,nudiasate = 0  ,nuautoriz = @nuultauto  
                   ,idativo   = "S"  ,nucomput  = "MCR4152"  ,cdususist = 4834  ,dtultalt  = convert(varchar(8),getdate(),112)  ,  hhultalt  = replace(convert(varchar(20),getdate()+(60*60),108),':','') 
WHERE idativo = "S"    and cdsetor = 35   AND nuentrada = @num;

    print @num 
    FETCH NEXT FROM @Cursor_entrada  
    INTO @cdusuario
 
 END 
 
 CLOSE @Cursor_entrada 
 DEALLOCATE @Cursor_entrada 






/*
select top 40 * from ssditbpa where cdbpa in ( 
select cdbpa
from ssditbpa 
group by cdbpa having count(*) > 1
)
order by dtultalt desc
*/