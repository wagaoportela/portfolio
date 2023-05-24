-- comentario aqui -- alterado em 2023-05-23 13:53
 
 -- select * from  [srv000085].[sanitas_treinamento].[dbo].[gefis_cadastromovimentosanitasID] order by id desc
 select TOP 5 * from  [srv000085].[sanitas_treinamento].[dbo].[gefis_cadastromovimentosanitas] order by id desc

if existS(SELECT ID FROM  [dbo].[gefis_cadastromovimentosanitas] 
          WHERE [id] = 54  
            AND [cdsetor_sanitas] = 26
            AND [cdusuario_sanitas] = 122400 
            AND [cdcns] = 704307590848993 
            AND [cdmunicipio_ibge] = 3158953
            AND [cdproced_sigtap] = '2051133230'
          )
BEGIN
  UPDATE [dbo].[gefis_cadastromovimentosanitas] SET
       [qtdprocedimento] = 2
      ,[cdorigemprocedimento] = 3
      ,[nuorigem] = 3500575898
      ,[idstatusprocessamento] = 'R'
      ,[dtagendamento] = GETDATE()
      ,[dtrealizacao] = GETDATE()
      ,[dtinclusao] = GETDATE()
  WHERE [ID] = 54
    AND [CDSETOR_SANITAS] = 26 
    AND [CDUSUARIO_SANITAS] = 122400
    AND [CDCNS] = 704307590848993
    AND [CDMUNICIPIO_IBGE] = 3158953
    AND [CDPROCED_SIGTAP] = '2051133230'
END
ELSE
BEGIN
  -- INSERIR
  SELECT 'NÃO EXISTE'
END
