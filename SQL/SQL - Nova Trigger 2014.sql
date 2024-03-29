﻿USE [Sanitas_Producao]
GO

/****** Object:  Trigger [Atualiza_ssWK_CADUNICOSUS]    Script Date: 03/07/2014 17:18:20 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Atualiza_ssWK_CADUNICOSUS_via_sscusuar]'))
DROP TRIGGER [dbo].[Atualiza_ssWK_CADUNICOSUS_via_sscusuar]
GO

/**** comentario aqui *******/

/****** Object:  Trigger [dbo].[Atualiza_ssWK_CADUNICOSUS]    Script Date: 03/07/2014 17:19:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE TRIGGER [dbo].[Atualiza_ssWK_CADUNICOSUS_via_sscusuar] ON [dbo].[sscusuar] 
AFTER INSERT, UPDATE 
AS
/* Testa se o arquivo do cadunico existe */
if exists (select * from sanitas_producao.dbo.sysobjects where name = "ssWK_CADUNICOSUS" and xtype = "U")
begin
  if exists( select nis_benef from ssWK_CADUNICOSUS 
             INNER JOIN INSERTED i ON i.dtnascusu = convert(varchar(10), ssWK_CADUNICOSUS.datanasc , 112)
                                  and i.nmusuario = ssWK_CADUNICOSUS.nome_benef 
                                  and i.nmmae     = ssWK_CADUNICOSUS.no_mae_beneficiario )
  begin
  
  end
                           
  UPDATE ssWK_CADUNICOSUS  SET ssWK_CADUNICOSUS.CODBENEFSANITAS = i.cdusuario
                             , ssWK_CADUNICOSUS.nmusuario = i.nmusuario
                             , ssWK_CADUNICOSUS.cdsexo = i.cdsexo
                             , ssWK_CADUNICOSUS.nufone = i.nufone 
                             , ssWK_CADUNICOSUS.nucomput   = HOST_NAME()
                             , ssWK_CADUNICOSUS.cdususist  = (SELECT USUCOD FROM GUARDIAN.DBO.USUARIO WHERE USUNOME = SUSER_SNAME() OR USULOGIN = SUSER_SNAME() OR ('PMIDOMAIN\'+USUNOME) = SUSER_SNAME() OR ('PMIDOMAIN\'+USULOGIN) = SUSER_SNAME() )
                             , ssWK_CADUNICOSUS.dtultalt   = CONVERT(VARCHAR(8) , GETDATE() , 112 )
                             , ssWK_CADUNICOSUS.hhultalt   = SUBSTRING(REPLACE(CONVERT(VARCHAR(8) , GETDATE() , 108 ) , ':', ''),1,6)
  FROM ssWK_CADUNICOSUS 
    INNER JOIN INSERTED i ON i.dtnascusu = convert(varchar(10), ssWK_CADUNICOSUS.datanasc , 112)
                         and i.nmusuario = ssWK_CADUNICOSUS.nome_benef 
                         and i.nmmae     = ssWK_CADUNICOSUS.no_mae_beneficiario
  WHERE (ssWK_CADUNICOSUS.CODBENEFSANITAS Is Null or ssWK_CADUNICOSUS.CODBENEFSANITAS = 0)
    AND i.idativo="S" AND i.idobito="N";

  UPDATE sscusuar SET sscusuar.nunis = convert(numeric, i.cdnis)
                             , nucomput   = HOST_NAME()
                             , cdususist  = (SELECT USUCOD FROM GUARDIAN.DBO.USUARIO WHERE USUNOME = SUSER_SNAME() OR USULOGIN = SUSER_SNAME() OR ('PMIDOMAIN\'+USUNOME) = SUSER_SNAME() OR ('PMIDOMAIN\'+USULOGIN) = SUSER_SNAME() )
                             , dtultalt   = CONVERT(VARCHAR(8) , GETDATE() , 112 )
                             , hhultalt   = SUBSTRING(REPLACE(CONVERT(VARCHAR(8) , GETDATE() , 108 ) , ':', ''),1,6)
  FROM sscusuar 
     INNER JOIN INSERTED i ON i.cdusuario = sscusuar.cdusuario 
  where i.cdnis is not null and i.cdnis <> ""
    and sscusuar.idativo ="S"
    and sscusuar.idobito ="N";
end

GO


