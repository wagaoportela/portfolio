USE [Sanitas_Producao]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_ValNumCadeiaCar]    Script Date: 03/07/2019 16:22:35 ******/
DROP FUNCTION [dbo].[fn_ValNumCadeiaCar]
GO


/****** Object:  UserDefinedFunction [dbo].[ChecarCNS]    Script Date: 03/07/2019 15:49:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[fn_ValNumCadeiaCar](@Cadeia as varchar(1000))
/*
  Autor: Wagner Portela de Assis                       
  Data: 03/07/2019
  Função que Checa se uma cadeia de caracter tem somente número
      Param1:STRING 
      Retorno: Bit = 0 falso inválido # 1 verdadeiro válido
*/
RETURNS Bit as
begin
  Declare @Retorno   as bit
  declare @numeros varchar(10) ,  @item char , @Cadeia_cop as varchar(1000)
  set @numeros = '0123456789'
  set @Retorno = 1 ; -- 0 false -- 1 true 

  set @Cadeia_cop = rtrim(ltrim(@Cadeia))
  
  while  len(@Cadeia_cop) > 0 
  begin
    set @item = substring( @Cadeia_cop , 1 , 1)
    set @Cadeia_cop = right(@Cadeia_cop, len(@Cadeia_cop)-1)
    if CHARINDEX(@item, @numeros) = 0 -- diferente dos numeros
    begin 
      set @Retorno = 0 ; -- 0 false -- 1 true 
	  break
    end
  end

  Return @Retorno;
end


GO
GRANT  EXECUTE  ON [dbo].[fn_ValNumCadeiaCar]  TO [SMS]
go
GRANT  EXECUTE  ON [dbo].[fn_ValNumCadeiaCar]  TO [S_GL_PRODUCAO_SANITAS]


/*

select dbo.fn_ValNumCadeiaCar('0123') , dbo.fn_ValNumCadeiaCar('456') , dbo.fn_ValNumCadeiaCar('01.23')

if dbo.fn_ValNumCadeiaCar(' 0123 ') = 0 
  print 'Erro'
else print 'certo'

declare @numeros varchar(10) ,  @item char
declare @cns varchar(16) , @cop_cns  varchar(16) 

set @numeros = '0123456789'
set @cns = rtrim(ltrim('01234d567a/89'))
set @cop_cns = @cns


while  len(@cop_cns) > 0 
begin
  set @item = substring( @cop_cns , 1 , 1)
  set @cop_cns = right(@cop_cns, len(@cop_cns)-1)
  if CHARINDEX(@item, @numeros) = 0 -- diferente dos numeros
  begin 
    select @item, 'erro' , @cop_cns
  end

end

*/