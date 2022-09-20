USE [TesteSanitas]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_aprova_pedido]    Script Date: 10/11/2017 11:14:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--   drop function [fn_aprova_pedido]
alter FUNCTION [dbo].[fn_aprova_pedido2](@dados1 varchar(8000) , @dados2 varchar(8000) , @dados3 varchar(8000) ) 
returns @Tab_retorno table(statusSolicitacao char(1) , cdproced_sigtap Varchar(10) , Valor_procedimento_aprovado Decimal(11,2) , Saldo_aprovado Decimal(11,2)  )
as 
begin
  DECLARE @idoc  int
        , @idoc2 int
        , @idoc3 int
  DECLARE @doc   varchar(8000)  
        , @doc2  varchar(8000) 
        , @doc3  varchar(8000) 
  
--  if (isnull(@dados1,-1) <> -1)
  begin 
    set @doc = @dados1
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    exec sp_xml_preparedocument @idoc  OUTPUT, @doc

    --insere registros 
    insert into @Tab_retorno 
	SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@doc, '/PEDIDO/LISTA')
    WITH ( 
    COD_OR_PROC VARCHAR(2) , 
    COD_IBGEC VARCHAR(7) ,
    VL_TOTAL_PROC_R VARCHAR(13),
    COD_SIGTAP varchar(10),
    QTD_PROC varchar(5) )

  end
--  if (isnull(@dados2,-1) <> -1)
  begin 
    set @doc2 = @dados2
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    EXEC sp_xml_preparedocument @idoc2 OUTPUT, @doc2

    --insere registros 
    insert into @Tab_retorno 
	SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@doc2, '/PEDIDO/LISTA')
    WITH ( 
    COD_OR_PROC VARCHAR(2) , 
    COD_IBGEC VARCHAR(7) ,
    VL_TOTAL_PROC_R VARCHAR(13),
    COD_SIGTAP varchar(10),
    QTD_PROC varchar(5) )

  end
--  if (isnull(@dados3,-1) <> -1)
  begin 
    set @doc3 = @dados3
    -- Crie uma representação interna do documento XML.   -- Remova a representação interna.    
    EXEC sp_xml_preparedocument @idoc3 OUTPUT, @doc3

    --insere registros 
    insert into @Tab_retorno 
	SELECT 'A' AS [statusSolicitacao] , COD_SIGTAP AS [cdproced_sigtap] , 4.10 AS [Valor_procedimento_aprovado]  , 1000.10 AS [Saldo_aprovado] 
    FROM OPENXML (@doc3, '/PEDIDO/LISTA')
    WITH ( 
    COD_OR_PROC VARCHAR(2) , 
    COD_IBGEC VARCHAR(7) ,
    VL_TOTAL_PROC_R VARCHAR(13),
    COD_SIGTAP varchar(10),
    QTD_PROC varchar(5) )

  end

  -- Remova a representação interna do XML.    
  EXEC SP_XML_REMOVEDOCUMENT @idoc 
  -- Remova a representação interna do XML.    
  EXEC SP_XML_REMOVEDOCUMENT @idoc2 
  -- Remova a representação interna do XML.    
  EXEC SP_XML_REMOVEDOCUMENT @idoc3 


  return 
end


GO
