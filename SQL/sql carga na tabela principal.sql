/*
 select top 20 * from  [gefis_cadastromovimentosanitas] order by id desc
 select count(*) from [gefis_cadastromovimentosanitas]
 select count(*) from [gefis_Auxiliar_cadastromovimentosanitas]
 select distinct cdorigemprocedimento from [gefis_cadastromovimentosanitas]
*/
/****** Script do comando SelectTopNRows de SSMS  ******/
set nocount on
declare @ID bigint, 
        @cdsetor_sanitas       [decimal](4, 0),
        @cdusuario_sanitas     [decimal](12, 0), 
        @cdmunicipio_ibge      [decimal](7, 0),
        @dtagendamento         [datetime],

	    @cdcns                 [decimal](15, 0) ,
        @cdcnes                [char](10) ,
	    @cdproced_sigtap       [varchar](10) ,
	    @qtdprocedimento       [decimal](5, 0) ,
	    @cdorigemprocedimento  [decimal](2, 0) ,
  	    @nuorigem              [decimal](12, 0) ,
	    @idstatusprocessamento [char](1) ,
	    @vlprocedimento        [decimal](11, 2) ,
	    @vlsaldoaprovacao      [decimal](11, 2) ,
	    @dtrealizacao          [datetime] ,
	    @dtinclusao            [datetime] ,
	    @idcomplexidadeitem    [int] ,
	    @idsaldoaprovacao      [char](2) 

declare @cdsetor_sanitasA       [decimal](4, 0) , 
        @cdusuario_sanitasA     [decimal](12, 0), 
		@cdmunicipio_ibgeA      [decimal](7, 0) ,
        @dtagendamentoA         [datetime]


declare @Cursor_entrada cursor  
set @Cursor_entrada = CURSOR SCROLL DYNAMIC
FOR

SELECT top 10
       [A].[cdsetor_sanitas]
      ,[A].[cdusuario_sanitas]
      ,[A].[cdmunicipio_ibge]
      ,[A].[dtagendamento]

      ,[A].[cdcns]
      ,[A].[cdcnes]
      ,[A].[cdproced_sigtap]
      ,[A].[qtdprocedimento]
      ,[A].[cdorigemprocedimento]
      ,[A].[nuorigem]
      ,[A].[idstatusprocessamento]
      ,[A].[vlprocedimento]
      ,[A].[vlsaldoaprovacao]
      ,[A].[dtrealizacao]
      ,[A].[dtinclusao]
      ,[A].[idcomplexidadeitem]
      ,[A].[idsaldoaprovacao]
  FROM [dbo].[gefis_Auxiliar_cadastromovimentosanitas] A
    left join [gefis_cadastromovimentosanitas] B on B.cdsetor_sanitas = A.cdsetor_sanitas and B.cdusuario_sanitas = A.cdusuario_sanitas and B.cdmunicipio_ibge = A.cdmunicipio_ibge and B.cdproced_sigtap = A.cdproced_sigtap
  
   where [A].cdcnes is not null
     and b.cdsetor_sanitas is null 
  order by [A].[cdsetor_sanitas] , [A].cdusuario_sanitas , [A].[cdmunicipio_ibge] , [A].dtagendamento

 open @Cursor_entrada 
 
 FETCH NEXT FROM @Cursor_entrada 
 INTO @cdsetor_sanitas      , @cdusuario_sanitas    , @cdmunicipio_ibge     , @dtagendamento        ,
      @cdcns                , @cdcnes               , @cdproced_sigtap      , @qtdprocedimento      , @cdorigemprocedimento ,
      @nuorigem             , @idstatusprocessamento, @vlprocedimento       , @vlsaldoaprovacao     , @dtrealizacao         ,
      @dtinclusao           , @idcomplexidadeitem   , @idsaldoaprovacao     


set @ID = -1

set @cdsetor_sanitasA = -1
set @cdusuario_sanitasA = -1 
set @cdmunicipio_ibgeA = -1
set @dtagendamentoA  = 1

    if ( (@cdsetor_sanitasA   <> @cdsetor_sanitas) or 
	     (@cdusuario_sanitasA <> @cdusuario_sanitas) or 
	     (@cdmunicipio_ibgeA  <> @cdmunicipio_ibge) or 
		 (@dtagendamentoA     <> @dtagendamento) 
       ) 		 		  
    begin
       select @ID , @cdsetor_sanitasA    , @cdusuario_sanitasA , @cdmunicipio_ibgeA  , @dtagendamentoA  
	              , @cdsetor_sanitas     , @cdusuario_sanitas  , @cdmunicipio_ibge   , @dtagendamento     
	end   

 WHILE @@FETCH_STATUS = 0 
 BEGIN 
    
    if ( (@cdsetor_sanitasA   <> @cdsetor_sanitas) or 
	     (@cdusuario_sanitasA <> @cdusuario_sanitas) or 
	     (@cdmunicipio_ibgeA  <> @cdmunicipio_ibge) or 
		 (@dtagendamentoA     <> @dtagendamento) 
       )
    begin
  	   INSERT INTO [dbo].[gefis_cadastromovimentosanitasID] (dtinclusao) values (default) 
       set @ID = SCOPE_IDENTITY() 
	   set @cdsetor_sanitasA   = @cdsetor_sanitas
	   set @cdusuario_sanitasA = @cdusuario_sanitas
	   set @cdmunicipio_ibgeA  = @cdmunicipio_ibge
	   set @dtagendamentoA     = @dtagendamento 
    end

       select @ID , @cdsetor_sanitasA    , @cdusuario_sanitasA , @cdmunicipio_ibgeA  , @dtagendamentoA  
	              , @cdsetor_sanitas     , @cdusuario_sanitas  , @cdmunicipio_ibge   , @dtagendamento     
	
	insert into [gefis_cadastromovimentosanitas] values(@ID , @cdsetor_sanitas      , @cdusuario_sanitas    , @cdcns                , @cdcnes               , 
	     @cdmunicipio_ibge     , @cdproced_sigtap      , @qtdprocedimento      , @cdorigemprocedimento ,
         @nuorigem             , @idstatusprocessamento, @vlprocedimento       , @vlsaldoaprovacao     , @dtagendamento        ,
		 @dtrealizacao         , @dtinclusao           , @idcomplexidadeitem   , @idsaldoaprovacao     )


    FETCH NEXT FROM @Cursor_entrada  
    INTO @cdsetor_sanitas      , @cdusuario_sanitas    , @cdmunicipio_ibge     , @dtagendamento        ,
         @cdcns                , @cdcnes               , @cdproced_sigtap      , @qtdprocedimento      , @cdorigemprocedimento ,
         @nuorigem             , @idstatusprocessamento, @vlprocedimento       , @vlsaldoaprovacao     , @dtrealizacao         ,
         @dtinclusao           , @idcomplexidadeitem   , @idsaldoaprovacao     
 
 END 
 
 CLOSE @Cursor_entrada 
 DEALLOCATE @Cursor_entrada 





 /*
 select * from ssdcneseq where cdsetor in ( 35 , 36 )
begin tran -- rollback tran -- commit tran
update [gefis_cadastromovimentosanitas] set cdcnes = 7417659 where cdsetor_sanitas = 36 and cdcnes is null
select  * from [gefis_cadastromovimentosanitas] where cdsetor_sanitas = 36 and cdcnes is null

 */


