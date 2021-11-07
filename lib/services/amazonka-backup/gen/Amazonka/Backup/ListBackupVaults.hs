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
-- Module      : Amazonka.Backup.ListBackupVaults
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of recovery point storage containers along with
-- information about them.
module Amazonka.Backup.ListBackupVaults
  ( -- * Creating a Request
    ListBackupVaults (..),
    newListBackupVaults,

    -- * Request Lenses
    listBackupVaults_nextToken,
    listBackupVaults_maxResults,

    -- * Destructuring the Response
    ListBackupVaultsResponse (..),
    newListBackupVaultsResponse,

    -- * Response Lenses
    listBackupVaultsResponse_nextToken,
    listBackupVaultsResponse_backupVaultList,
    listBackupVaultsResponse_httpStatus,
  )
where

import Amazonka.Backup.Types
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newListBackupVaults' smart constructor.
data ListBackupVaults = ListBackupVaults'
  { -- | The next item following a partial list of returned items. For example,
    -- if a request is made to return @maxResults@ number of items, @NextToken@
    -- allows you to return more items in your list starting at the location
    -- pointed to by the next token.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | The maximum number of items to be returned.
    maxResults :: Prelude.Maybe Prelude.Natural
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListBackupVaults' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listBackupVaults_nextToken' - The next item following a partial list of returned items. For example,
-- if a request is made to return @maxResults@ number of items, @NextToken@
-- allows you to return more items in your list starting at the location
-- pointed to by the next token.
--
-- 'maxResults', 'listBackupVaults_maxResults' - The maximum number of items to be returned.
newListBackupVaults ::
  ListBackupVaults
newListBackupVaults =
  ListBackupVaults'
    { nextToken = Prelude.Nothing,
      maxResults = Prelude.Nothing
    }

-- | The next item following a partial list of returned items. For example,
-- if a request is made to return @maxResults@ number of items, @NextToken@
-- allows you to return more items in your list starting at the location
-- pointed to by the next token.
listBackupVaults_nextToken :: Lens.Lens' ListBackupVaults (Prelude.Maybe Prelude.Text)
listBackupVaults_nextToken = Lens.lens (\ListBackupVaults' {nextToken} -> nextToken) (\s@ListBackupVaults' {} a -> s {nextToken = a} :: ListBackupVaults)

-- | The maximum number of items to be returned.
listBackupVaults_maxResults :: Lens.Lens' ListBackupVaults (Prelude.Maybe Prelude.Natural)
listBackupVaults_maxResults = Lens.lens (\ListBackupVaults' {maxResults} -> maxResults) (\s@ListBackupVaults' {} a -> s {maxResults = a} :: ListBackupVaults)

instance Core.AWSRequest ListBackupVaults where
  type
    AWSResponse ListBackupVaults =
      ListBackupVaultsResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          ListBackupVaultsResponse'
            Prelude.<$> (x Core..?> "NextToken")
            Prelude.<*> ( x Core..?> "BackupVaultList"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable ListBackupVaults

instance Prelude.NFData ListBackupVaults

instance Core.ToHeaders ListBackupVaults where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath ListBackupVaults where
  toPath = Prelude.const "/backup-vaults/"

instance Core.ToQuery ListBackupVaults where
  toQuery ListBackupVaults' {..} =
    Prelude.mconcat
      [ "nextToken" Core.=: nextToken,
        "maxResults" Core.=: maxResults
      ]

-- | /See:/ 'newListBackupVaultsResponse' smart constructor.
data ListBackupVaultsResponse = ListBackupVaultsResponse'
  { -- | The next item following a partial list of returned items. For example,
    -- if a request is made to return @maxResults@ number of items, @NextToken@
    -- allows you to return more items in your list starting at the location
    -- pointed to by the next token.
    nextToken :: Prelude.Maybe Prelude.Text,
    -- | An array of backup vault list members containing vault metadata,
    -- including Amazon Resource Name (ARN), display name, creation date,
    -- number of saved recovery points, and encryption information if the
    -- resources saved in the backup vault are encrypted.
    backupVaultList :: Prelude.Maybe [BackupVaultListMember],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ListBackupVaultsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'nextToken', 'listBackupVaultsResponse_nextToken' - The next item following a partial list of returned items. For example,
-- if a request is made to return @maxResults@ number of items, @NextToken@
-- allows you to return more items in your list starting at the location
-- pointed to by the next token.
--
-- 'backupVaultList', 'listBackupVaultsResponse_backupVaultList' - An array of backup vault list members containing vault metadata,
-- including Amazon Resource Name (ARN), display name, creation date,
-- number of saved recovery points, and encryption information if the
-- resources saved in the backup vault are encrypted.
--
-- 'httpStatus', 'listBackupVaultsResponse_httpStatus' - The response's http status code.
newListBackupVaultsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  ListBackupVaultsResponse
newListBackupVaultsResponse pHttpStatus_ =
  ListBackupVaultsResponse'
    { nextToken =
        Prelude.Nothing,
      backupVaultList = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The next item following a partial list of returned items. For example,
-- if a request is made to return @maxResults@ number of items, @NextToken@
-- allows you to return more items in your list starting at the location
-- pointed to by the next token.
listBackupVaultsResponse_nextToken :: Lens.Lens' ListBackupVaultsResponse (Prelude.Maybe Prelude.Text)
listBackupVaultsResponse_nextToken = Lens.lens (\ListBackupVaultsResponse' {nextToken} -> nextToken) (\s@ListBackupVaultsResponse' {} a -> s {nextToken = a} :: ListBackupVaultsResponse)

-- | An array of backup vault list members containing vault metadata,
-- including Amazon Resource Name (ARN), display name, creation date,
-- number of saved recovery points, and encryption information if the
-- resources saved in the backup vault are encrypted.
listBackupVaultsResponse_backupVaultList :: Lens.Lens' ListBackupVaultsResponse (Prelude.Maybe [BackupVaultListMember])
listBackupVaultsResponse_backupVaultList = Lens.lens (\ListBackupVaultsResponse' {backupVaultList} -> backupVaultList) (\s@ListBackupVaultsResponse' {} a -> s {backupVaultList = a} :: ListBackupVaultsResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
listBackupVaultsResponse_httpStatus :: Lens.Lens' ListBackupVaultsResponse Prelude.Int
listBackupVaultsResponse_httpStatus = Lens.lens (\ListBackupVaultsResponse' {httpStatus} -> httpStatus) (\s@ListBackupVaultsResponse' {} a -> s {httpStatus = a} :: ListBackupVaultsResponse)

instance Prelude.NFData ListBackupVaultsResponse