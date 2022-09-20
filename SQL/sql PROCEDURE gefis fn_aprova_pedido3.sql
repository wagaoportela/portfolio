USE [TesteSanitas]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_aprova_pedido]    Script Date: 10/11/2017 11:14:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
IF OBJECT_ID (N'fn_aprova_pedido3' , N'IF' ) IS NOT NULL   
    drop procedure fn_aprova_pedido3 ;
GO  

-- returns @Tab_retorno table(statusSolicitacao char(1) , cdproced_sigtap Varchar(10) , Valor_procedimento_aprovado Decimal(11,2) , Saldo_aprovado Decimal(11,2)  )
CREATE FUNCTION [fn_aprova_pedido3](  @dados1 varchar(8000),  @dados2 varchar(8000),  @dados3 varchar(8000) ) 
returns table
as 
RETURN 
(
sp_aprova_pedido3 @dados1= NULL
, @dados1='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="1111111111" QTD_PROC="23"></LISTA>
</PEDIDO>'
, @dados2='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="1111111111" QTD_PROC="23"></LISTA>
</PEDIDO>'
, @dados3='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="1111111111" QTD_PROC="23"></LISTA>
</PEDIDO>'
)
*/

GO
IF OBJECT_ID ( N'sp_aprova_pedido3' , N'P' ) IS NOT NULL   
    drop procedure sp_aprova_pedido3 ;
GO  

create procedure dbo.sp_aprova_pedido3
  @dados1 varchar(8000),
  @dados2 varchar(8000),
  @dados3 varchar(8000)
as
BEGIN
  SET NOCOUNT ON;  
  DECLARE @idoc1 int
        , @idoc2 int
        , @idoc3 int
  DECLARE @doc1  varchar(8000)  
        , @doc2  varchar(8000) 
        , @doc3  varchar(8000) 
  DECLARE @Tab_retorno table(statusSolicitacao char(1) , cdproced_sigtap Varchar(10) , Valor_procedimento_aprovado Decimal(11,2) , Saldo_aprovado Decimal(11,2)  )
  
  if (@dados1 <> '')
  begin 
    set @doc1 = @dados1
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    exec sp_xml_preparedocument @idoc1  OUTPUT, @doc1  
	--
	INSERT INTO @Tab_retorno
    SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@idoc1, '/PEDIDO/LISTA')
    WITH ( 
        COD_OR_PROC VARCHAR(2) , 
        COD_IBGEC VARCHAR(7) ,
        VL_TOTAL_PROC_R VARCHAR(13),
        COD_SIGTAP varchar(10),
        QTD_PROC varchar(5) )
    EXEC SP_XML_REMOVEDOCUMENT @idoc1
  end

  if (@dados2 <> '')
  begin 
    set @doc2 = @dados2
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    exec sp_xml_preparedocument @idoc2  OUTPUT, @doc2
	--
	INSERT INTO @Tab_retorno
    SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@idoc2, '/PEDIDO/LISTA')
    WITH ( 
        COD_OR_PROC VARCHAR(2) , 
        COD_IBGEC VARCHAR(7) ,
        VL_TOTAL_PROC_R VARCHAR(13),
        COD_SIGTAP varchar(10),
        QTD_PROC varchar(5) )
    EXEC SP_XML_REMOVEDOCUMENT @idoc2
  end

  if (@dados3 <> '')
  begin 
    set @doc3 = @dados3
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    exec sp_xml_preparedocument @idoc3  OUTPUT, @doc3
	--
	INSERT INTO @Tab_retorno
    SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@idoc3, '/PEDIDO/LISTA')
    WITH ( 
        COD_OR_PROC VARCHAR(2) , 
        COD_IBGEC VARCHAR(7) ,
        VL_TOTAL_PROC_R VARCHAR(13),
        COD_SIGTAP varchar(10),
        QTD_PROC varchar(5) )
    EXEC SP_XML_REMOVEDOCUMENT @idoc3
  end

  
  SELECT * FROM @Tab_retorno
END

go


DECLARE @doc   varchar(8000)  
SET @doc ='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010064" QTD_PROC="23"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010072" QTD_PROC="2"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010080" QTD_PROC="4"></LISTA>
</PEDIDO>'
sp_aprova_pedido3 
  @dados1= NULL
, @dados2=''
, @dados3='<PEDIDO><LISTA></LISTA></PEDIDO>'
go

exec dbo.sp_aprova_pedido3 
  @dados1= NULL
, @dados2=''
, @dados3 ='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="4444444444" QTD_PROC="23"></LISTA>
</PEDIDO>'


go




/*
DECLARE @idoc  int
      , @idoc2 int
DECLARE @doc   varchar(8000)  
      , @doc2  varchar(8000) 


SET
@doc ='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010064" QTD_PROC="23"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010072" QTD_PROC="2"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010080" QTD_PROC="4"></LISTA>
</PEDIDO>'

SET
@doc2 ='<PEDIDO>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010064" QTD_PROC="23"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010072" QTD_PROC="2"></LISTA>
<LISTA COD_OR_PROC="1" COD_IBGEC="3158953" VL_TOTAL_PROC_R="1503.33"     COD_SIGTAP="0301010080" QTD_PROC="4"></LISTA>
</PEDIDO>'

EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
EXEC sp_xml_preparedocument @idoc2 OUTPUT, @doc2
 
SELECT "A" AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
FROM OPENXML (@idoc, '/PEDIDO/LISTA')
WITH ( 
COD_OR_PROC VARCHAR(2) , 
COD_IBGEC VARCHAR(7) ,
VL_TOTAL_PROC_R VARCHAR(13),
COD_SIGTAP varchar(10),
QTD_PROC varchar(5) )
ORDER BY 1,2,4


-- Remove o identificador do XML
EXEC SP_XML_REMOVEDOCUMENT @idoc 
EXEC SP_XML_REMOVEDOCUMENT @idoc2 
*/