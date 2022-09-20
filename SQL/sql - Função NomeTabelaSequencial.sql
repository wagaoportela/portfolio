if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SequenciaTabela]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[SequenciaTabela]
GO

CREATE FUNCTION dbo.SequenciaTabela( @ArquivoBase varchar(255) )
RETURNS integer -- RETURNS varchar(255)
/*
  Autor: Wagner Portela de Assis                       
  Data: 22/12/2014
  Função retorna o valor do último sequencial de um nome base
  Retorno: "99999"
  SequenciaTabela('nome da tabela')
      Param1: nome base da tabela
*/
begin
  Declare @ArquivoNovo varchar(255)       , @Arquivo varchar(255) 
        , @seq integer       , @UltSeq varchar(255)       , @QtdCar integer
  set @ArquivoBase = upper(@ArquivoBase)
  set @QtdCar = len(@ArquivoBase)
  select top 1 @Arquivo =name from sysobjects where xtype = 'U' and name like @ArquivoBase + '%'  
  order by name desc

  Set @UltSeq = rtrim(substring(@Arquivo, @QtdCar+1 , 5))
  if @UltSeq = '' 
  begin
    Set @Seq = 0 -- 1
  end
  else
  begin
    Set @Seq = convert(integer, @UltSeq) --  + 1
  end
  Set @ArquivoNovo = rtrim(@ArquivoBase) + ltrim(convert(varchar(255) , @Seq))
  Return @Seq -- Return @ArquivoNovo
end

go

GRANT  EXECUTE  ON [dbo].[SequenciaTabela]  TO [S_G_SMS]
GRANT  EXECUTE  ON [dbo].[SequenciaTabela]  TO [S_GL_PRODUCAO_SANITAS]

/*
declare @valor Integer 
set @valor =  dbo.SequenciaTabela('sswk_cadunicosus2014_2sem') 

select @valor
print @valor

*/