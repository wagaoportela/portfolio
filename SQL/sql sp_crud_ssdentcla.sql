USE [Sanitas_Treinamento]
GO
/****** Object:  StoredProcedure [dbo].[sp_crud_ssdentcla]    Script Date: 20/09/2022 17:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[sp_crud_ssdentcla]
	@Acao char(1) = null , @NuComput char(10) = null , @cdUsuSist numeric(5) = 0 , @dtUltAlt char(8) = null , @hhUltAlt char(6) = null 
      , @CdSetor numeric(4,0) = null , @NuEntrada numeric(12,0) = null , @cdfluxo numeric(3,0) = null , @cddiscrimi numeric(4,0) = null 
      , @cdclassifi numeric(2,0) = null
AS
SET NOCOUNT On
DECLARE @msgErro varchar(255)
DECLARE @error_var int, @rowcount_var int
if (@Acao is null)
begin
  raiserror('Parâmetro @Ação não informado.',-1,-1,@Acao)
  return (1)
end
Set @Acao=upper(@Acao) 
if (@Acao not in ('I' , 'L' , 'A' , 'D'))
begin
  SET @msgErro = 'Parâmetro @Ação Inválido.' + CHAR(13) + 'Valores Válidos:   [I] Inserir   [L] Ler   [A] Alterar   [D] Deletar'
  raiserror(@msgErro ,-1,-1,@Acao)
  return (1)
end
else
begin
  if (@NuComput is null)
  begin
    set @NuComput=HOST_NAME()
  end

  if (@dtUltAlt is null)
  begin
    set @dtUltAlt=convert(varchar(8), getdate() , 112) 
  end

  if (@hhUltAlt is null)
  begin
    Set @hhUltAlt=replace(convert(varchar(8), getdate() , 108) , ":", "") 
  end

  if (@CdSetor is null)
  begin
    raiserror('Parâmetro @CdSetor não informado.',-1,-1,@CdSetor)
    return (1) 
  end
  else
  if (@NuEntrada is null)
  begin
    raiserror('Parâmetro @NuEntrada não informado.',-1,-1, @NuEntrada)
    return (1)  
  end
  else
  if ((@cdfluxo is null) and (@Acao in ('I', 'A') ))
  begin
    raiserror('Parâmetro @cdfluxo não informado.',-1,-1, @cdfluxo)
    return (1)  
  end
  else
  if ((@cddiscrimi is null) and (@Acao in ('I', 'A') ))
  begin
    raiserror('Parâmetro @cddiscrimi não informado.',-1,-1, @cddiscrimi)
    return (1)  
  end
  else
  if ((@cdclassifi is null) and (@Acao in ('I', 'A') ))
  begin
    raiserror('Parâmetro @cdclassifi não informado.',-1,-1, @cdclassifi)
    return (1)  
  end

--  print @Acao
  
/*
  if (@Acao in ('L'))
  begin
--    print 'Primeiro IF @Acao=R (Ler)'
--    Select * from ssdentcla where ssdentcla.cdsetor    = @CdSetor AND ssdentcla.nuentrada  = @NuEntrada
  end
  else 
*/
  if (@Acao in ('D'))
  begin
--    print 'Segundo IF @Acao=D (Excluir)'
    Delete from ssdentcla where ssdentcla.cdsetor    = @CdSetor AND ssdentcla.nuentrada  = @NuEntrada
  end
  else 
  if (@Acao in ('I' , 'A'))
  begin
--    print 'Terceiro @Acao=C ou U (Incluir ou Alterar)'
    -- testa se existe registro
    if (@Acao = 'A') -- or ((@Acao = 'I') and exists( select ssdentcla.idativo from ssdentcla where ssdentcla.cdsetor    = @CdSetor AND ssdentcla.nuentrada  = @NuEntrada ))
    begin
--      print '  Comando Update '
      UPDATE [ssdentcla]
      SET [cdfluxo]    = @cdfluxo
        , [cddiscrimi] = @cddiscrimi
        , [cdclassifi] = @cdclassifi
        , [nuencamin]  = null -- nuencamin
        , [hhencamin]  = null -- hhencamin
        , [cdsetorcla] = null -- cdsetorcla
        , [nuatendcla] = null -- nuatendcla
        , [idativo]    = "S" -- idativo
        , [nucomput]   = @NuComput -- // "MCR2380" -- nucomput
        , [cdususist]  = @cdUsuSist -- cdususist
        , [dtultalt]   = @dtUltAlt -- convert(varchar(8), getdate() , 112) -- dtultalt
        , [hhultalt]   = @hhUltAlt -- replace(convert(varchar(8), getdate() , 108) , ":", "") -- hhultalt
      WHERE ssdentcla.cdsetor = @CdSetor
        AND ssdentcla.nuentrada  = @NuEntrada
    end
    else if (@Acao = 'I')
    begin
      -- se não existe, inclui.
--      print '  Comando Insert '
      INSERT INTO [ssdentcla]([nuentrada], [cdsetor], [cdfluxo], [cddiscrimi], [cdclassifi], [nuencamin], [hhencamin], [cdsetorcla], [nuatendcla], [idativo], [nucomput], [cdususist], [dtultalt], [hhultalt])
      VALUES(@NuEntrada , @CdSetor , @CdFluxo , @cddiscrimi , @cdclassifi , null, null, null, null, "S" , @NuComput , @cdUsuSist , @dtUltAlt , @hhUltAlt  )
      SELECT @error_var = @@ERROR, @rowcount_var = @@ROWCOUNT
      IF @error_var <> 0
      BEGIN

         IF @error_var = 547
         BEGIN
            print "A check constraint violation occurred"
            RETURN(1)
         END
         ELSE IF @error_var = 2627
         BEGIN
            PRINT "ERROR: Violation of PRIMARY KEY constraint. Cannot insert duplicate key in object"
            RETURN(2)
         END
         ELSE 
         BEGIN
            PRINT "ERROR: Unhandled error occurred"
            RETURN(2)
         END
      END

    end
  end
end
-- Sucesso
Select * from ssdentcla where ssdentcla.cdsetor    = @CdSetor AND ssdentcla.nuentrada  = @NuEntrada
Return(0)
