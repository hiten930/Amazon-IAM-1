{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Redshift.AddPartner
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Adds a partner integration to a cluster. This operation authorizes a
-- partner to push status updates for the specified database. To complete
-- the integration, you also set up the integration on the partner website.
module Network.AWS.Redshift.AddPartner
  ( -- * Creating a Request
    AddPartner (..),
    newAddPartner,

    -- * Request Lenses
    addPartner_accountId,
    addPartner_clusterIdentifier,
    addPartner_databaseName,
    addPartner_partnerName,

    -- * Destructuring the Response
    PartnerIntegrationOutputMessage (..),
    newPartnerIntegrationOutputMessage,

    -- * Response Lenses
    partnerIntegrationOutputMessage_partnerName,
    partnerIntegrationOutputMessage_databaseName,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.Redshift.Types
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newAddPartner' smart constructor.
data AddPartner = AddPartner'
  { -- | The Amazon Web Services account ID that owns the cluster.
    accountId :: Prelude.Text,
    -- | The cluster identifier of the cluster that receives data from the
    -- partner.
    clusterIdentifier :: Prelude.Text,
    -- | The name of the database that receives data from the partner.
    databaseName :: Prelude.Text,
    -- | The name of the partner that is authorized to send data.
    partnerName :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'AddPartner' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'accountId', 'addPartner_accountId' - The Amazon Web Services account ID that owns the cluster.
--
-- 'clusterIdentifier', 'addPartner_clusterIdentifier' - The cluster identifier of the cluster that receives data from the
-- partner.
--
-- 'databaseName', 'addPartner_databaseName' - The name of the database that receives data from the partner.
--
-- 'partnerName', 'addPartner_partnerName' - The name of the partner that is authorized to send data.
newAddPartner ::
  -- | 'accountId'
  Prelude.Text ->
  -- | 'clusterIdentifier'
  Prelude.Text ->
  -- | 'databaseName'
  Prelude.Text ->
  -- | 'partnerName'
  Prelude.Text ->
  AddPartner
newAddPartner
  pAccountId_
  pClusterIdentifier_
  pDatabaseName_
  pPartnerName_ =
    AddPartner'
      { accountId = pAccountId_,
        clusterIdentifier = pClusterIdentifier_,
        databaseName = pDatabaseName_,
        partnerName = pPartnerName_
      }

-- | The Amazon Web Services account ID that owns the cluster.
addPartner_accountId :: Lens.Lens' AddPartner Prelude.Text
addPartner_accountId = Lens.lens (\AddPartner' {accountId} -> accountId) (\s@AddPartner' {} a -> s {accountId = a} :: AddPartner)

-- | The cluster identifier of the cluster that receives data from the
-- partner.
addPartner_clusterIdentifier :: Lens.Lens' AddPartner Prelude.Text
addPartner_clusterIdentifier = Lens.lens (\AddPartner' {clusterIdentifier} -> clusterIdentifier) (\s@AddPartner' {} a -> s {clusterIdentifier = a} :: AddPartner)

-- | The name of the database that receives data from the partner.
addPartner_databaseName :: Lens.Lens' AddPartner Prelude.Text
addPartner_databaseName = Lens.lens (\AddPartner' {databaseName} -> databaseName) (\s@AddPartner' {} a -> s {databaseName = a} :: AddPartner)

-- | The name of the partner that is authorized to send data.
addPartner_partnerName :: Lens.Lens' AddPartner Prelude.Text
addPartner_partnerName = Lens.lens (\AddPartner' {partnerName} -> partnerName) (\s@AddPartner' {} a -> s {partnerName = a} :: AddPartner)

instance Core.AWSRequest AddPartner where
  type
    AWSResponse AddPartner =
      PartnerIntegrationOutputMessage
  request = Request.postQuery defaultService
  response =
    Response.receiveXMLWrapper
      "AddPartnerResult"
      (\s h x -> Core.parseXML x)

instance Prelude.Hashable AddPartner

instance Prelude.NFData AddPartner

instance Core.ToHeaders AddPartner where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToPath AddPartner where
  toPath = Prelude.const "/"

instance Core.ToQuery AddPartner where
  toQuery AddPartner' {..} =
    Prelude.mconcat
      [ "Action"
          Core.=: ("AddPartner" :: Prelude.ByteString),
        "Version"
          Core.=: ("2012-12-01" :: Prelude.ByteString),
        "AccountId" Core.=: accountId,
        "ClusterIdentifier" Core.=: clusterIdentifier,
        "DatabaseName" Core.=: databaseName,
        "PartnerName" Core.=: partnerName
      ]
