/*
declare @status char
set @status = 'R'
select @status

declare @id integer
set @id = 44
select (@id+1) % 2 , @id % 2
if ((@id % 2) = 0) select 'par' else select '�mpar'


*/
-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
/*
	
int64 -2 63 a 2 63 -1 delphi
bigint  2^63-1 sql


select  [aprova] = [DBO].[fn_aprova](9223372036854775807, 'R') , [aprova] = [DBO].[fn_aprova](9223372036854775806, 'R')
*/
-- drop function dbo.fn_aprova
CREATE FUNCTION dbo.fn_aprova
(
	/* par�metros 
	   @ID : n�mero que identifica quais registros s�o da solicita��o enviada.
	   @status : informa se os procedimentos j� foram realizados <'R'> ou n�o <' '> , aguardando autoriza��o em fun��o do limite financeiro do munic�pio.
    */
	@ID bigint , @status char 
)
RETURNS char 
AS
BEGIN
    /* 
	  Aqui vai a rotina que acessa o sanitas no sqlserver2000.
	  L� os registros que aguardam processamento de uma requisi��o naa tabela [servidorsanitas].[bancosanitas].[dbo].[gefis_cadastromovimentosanitas] 
	    com a condi��o [id] = <bigint> e [idstatusprocessamento] = 'P'.
	  Busca no gefis os valores do sigtap ou valores dos contratos de pactua��o com munic�pios.
	  Com a soma desses valores mais os valores dos 
	  	registros anteriores com [idstatusprocessamento] = 'R' verificar se o munic�pio ainda tem limite observando sempre regras tais como, 
		procedimentos de alta complexidade, etc. (marlaidson, walter e silvio)
      Se tiver saldo altera os registros nos campos [idstatusprocessamento] = 'R' , [vlprocedimento] = <decimal(11,2)> ,  [vlsaldoaprovacao] = <decimal(11,2)>
	    na tabala [servidorsanitas].[bancosanitas].[dbo].[gefis_cadastromovimentosanitas] 
		se n�o tiver saldo altera os registros para [idstatusprocessamento] = 'N' , [vlprocedimento] = <decimal(11,2)> ,  [vlsaldoaprovacao] = <decimal(11,2)>
      E a fun��o retorna se est� aprovado 'S' ou 'N'.
    */
	  
    -- TESTE WAGNER

    declare @Retorno char
	SET @Retorno = ' '
    -- rotina
	if ((@ID % 2) = 0) or (@status = 'R')
	  select @Retorno = 'S' 
	else 
	  select @Retorno = 'N'
 
	RETURN @Retorno

END
GO


