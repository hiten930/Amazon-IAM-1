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
-- Module      : Network.AWS.CloudFormation.BatchDescribeTypeConfigurations
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns configuration data for the specified CloudFormation extensions,
-- from the CloudFormation registry for the account and region.
--
-- For more information, see
-- <https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-register.html#registry-set-configuration Configuring extensions at the account level>
-- in the /CloudFormation User Guide/.
module Network.AWS.CloudFormation.BatchDescribeTypeConfigurations
  ( -- * Creating a Request
    BatchDescribeTypeConfigurations (..),
    newBatchDescribeTypeConfigurations,

    -- * Request Lenses
    batchDescribeTypeConfigurations_typeConfigurationIdentifiers,

    -- * Destructuring the Response
    BatchDescribeTypeConfigurationsResponse (..),
    newBatchDescribeTypeConfigurationsResponse,

    -- * Response Lenses
    batchDescribeTypeConfigurationsResponse_errors,
    batchDescribeTypeConfigurationsResponse_typeConfigurations,
    batchDescribeTypeConfigurationsResponse_unprocessedTypeConfigurations,
    batchDescribeTypeConfigurationsResponse_httpStatus,
  )
where

import Network.AWS.CloudFormation.Types
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newBatchDescribeTypeConfigurations' smart constructor.
data BatchDescribeTypeConfigurations = BatchDescribeTypeConfigurations'
  { -- | The list of identifiers for the desired extension configurations.
    typeConfigurationIdentifiers :: Prelude.NonEmpty TypeConfigurationIdentifier
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'BatchDescribeTypeConfigurations' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'typeConfigurationIdentifiers', 'batchDescribeTypeConfigurations_typeConfigurationIdentifiers' - The list of identifiers for the desired extension configurations.
newBatchDescribeTypeConfigurations ::
  -- | 'typeConfigurationIdentifiers'
  Prelude.NonEmpty TypeConfigurationIdentifier ->
  BatchDescribeTypeConfigurations
newBatchDescribeTypeConfigurations
  pTypeConfigurationIdentifiers_ =
    BatchDescribeTypeConfigurations'
      { typeConfigurationIdentifiers =
          Lens._Coerce
            Lens.# pTypeConfigurationIdentifiers_
      }

-- | The list of identifiers for the desired extension configurations.
batchDescribeTypeConfigurations_typeConfigurationIdentifiers :: Lens.Lens' BatchDescribeTypeConfigurations (Prelude.NonEmpty TypeConfigurationIdentifier)
batchDescribeTypeConfigurations_typeConfigurationIdentifiers = Lens.lens (\BatchDescribeTypeConfigurations' {typeConfigurationIdentifiers} -> typeConfigurationIdentifiers) (\s@BatchDescribeTypeConfigurations' {} a -> s {typeConfigurationIdentifiers = a} :: BatchDescribeTypeConfigurations) Prelude.. Lens._Coerce

instance
  Core.AWSRequest
    BatchDescribeTypeConfigurations
  where
  type
    AWSResponse BatchDescribeTypeConfigurations =
      BatchDescribeTypeConfigurationsResponse
  request = Request.postQuery defaultService
  response =
    Response.receiveXMLWrapper
      "BatchDescribeTypeConfigurationsResult"
      ( \s h x ->
          BatchDescribeTypeConfigurationsResponse'
            Prelude.<$> ( x Core..@? "Errors" Core..!@ Prelude.mempty
                            Prelude.>>= Core.may (Core.parseXMLList "member")
                        )
            Prelude.<*> ( x Core..@? "TypeConfigurations"
                            Core..!@ Prelude.mempty
                            Prelude.>>= Core.may (Core.parseXMLList "member")
                        )
            Prelude.<*> ( x Core..@? "UnprocessedTypeConfigurations"
                            Core..!@ Prelude.mempty
                            Prelude.>>= Core.may (Core.parseXMLList "member")
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    BatchDescribeTypeConfigurations

instance
  Prelude.NFData
    BatchDescribeTypeConfigurations

instance
  Core.ToHeaders
    BatchDescribeTypeConfigurations
  where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToPath BatchDescribeTypeConfigurations where
  toPath = Prelude.const "/"

instance Core.ToQuery BatchDescribeTypeConfigurations where
  toQuery BatchDescribeTypeConfigurations' {..} =
    Prelude.mconcat
      [ "Action"
          Core.=: ( "BatchDescribeTypeConfigurations" ::
                      Prelude.ByteString
                  ),
        "Version"
          Core.=: ("2010-05-15" :: Prelude.ByteString),
        "TypeConfigurationIdentifiers"
          Core.=: Core.toQueryList
            "member"
            typeConfigurationIdentifiers
      ]

-- | /See:/ 'newBatchDescribeTypeConfigurationsResponse' smart constructor.
data BatchDescribeTypeConfigurationsResponse = BatchDescribeTypeConfigurationsResponse'
  { -- | A list of information concerning any errors generated during the setting
    -- of the specified configurations.
    errors :: Prelude.Maybe [BatchDescribeTypeConfigurationsError],
    -- | A list of any of the specified extension configurations from the
    -- CloudFormation registry.
    typeConfigurations :: Prelude.Maybe [TypeConfigurationDetails],
    -- | A list of any of the specified extension configurations that
    -- CloudFormation could not process for any reason.
    unprocessedTypeConfigurations :: Prelude.Maybe [TypeConfigurationIdentifier],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'BatchDescribeTypeConfigurationsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'errors', 'batchDescribeTypeConfigurationsResponse_errors' - A list of information concerning any errors generated during the setting
-- of the specified configurations.
--
-- 'typeConfigurations', 'batchDescribeTypeConfigurationsResponse_typeConfigurations' - A list of any of the specified extension configurations from the
-- CloudFormation registry.
--
-- 'unprocessedTypeConfigurations', 'batchDescribeTypeConfigurationsResponse_unprocessedTypeConfigurations' - A list of any of the specified extension configurations that
-- CloudFormation could not process for any reason.
--
-- 'httpStatus', 'batchDescribeTypeConfigurationsResponse_httpStatus' - The response's http status code.
newBatchDescribeTypeConfigurationsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  BatchDescribeTypeConfigurationsResponse
newBatchDescribeTypeConfigurationsResponse
  pHttpStatus_ =
    BatchDescribeTypeConfigurationsResponse'
      { errors =
          Prelude.Nothing,
        typeConfigurations =
          Prelude.Nothing,
        unprocessedTypeConfigurations =
          Prelude.Nothing,
        httpStatus = pHttpStatus_
      }

-- | A list of information concerning any errors generated during the setting
-- of the specified configurations.
batchDescribeTypeConfigurationsResponse_errors :: Lens.Lens' BatchDescribeTypeConfigurationsResponse (Prelude.Maybe [BatchDescribeTypeConfigurationsError])
batchDescribeTypeConfigurationsResponse_errors = Lens.lens (\BatchDescribeTypeConfigurationsResponse' {errors} -> errors) (\s@BatchDescribeTypeConfigurationsResponse' {} a -> s {errors = a} :: BatchDescribeTypeConfigurationsResponse) Prelude.. Lens.mapping Lens._Coerce

-- | A list of any of the specified extension configurations from the
-- CloudFormation registry.
batchDescribeTypeConfigurationsResponse_typeConfigurations :: Lens.Lens' BatchDescribeTypeConfigurationsResponse (Prelude.Maybe [TypeConfigurationDetails])
batchDescribeTypeConfigurationsResponse_typeConfigurations = Lens.lens (\BatchDescribeTypeConfigurationsResponse' {typeConfigurations} -> typeConfigurations) (\s@BatchDescribeTypeConfigurationsResponse' {} a -> s {typeConfigurations = a} :: BatchDescribeTypeConfigurationsResponse) Prelude.. Lens.mapping Lens._Coerce

-- | A list of any of the specified extension configurations that
-- CloudFormation could not process for any reason.
batchDescribeTypeConfigurationsResponse_unprocessedTypeConfigurations :: Lens.Lens' BatchDescribeTypeConfigurationsResponse (Prelude.Maybe [TypeConfigurationIdentifier])
batchDescribeTypeConfigurationsResponse_unprocessedTypeConfigurations = Lens.lens (\BatchDescribeTypeConfigurationsResponse' {unprocessedTypeConfigurations} -> unprocessedTypeConfigurations) (\s@BatchDescribeTypeConfigurationsResponse' {} a -> s {unprocessedTypeConfigurations = a} :: BatchDescribeTypeConfigurationsResponse) Prelude.. Lens.mapping Lens._Coerce

-- | The response's http status code.
batchDescribeTypeConfigurationsResponse_httpStatus :: Lens.Lens' BatchDescribeTypeConfigurationsResponse Prelude.Int
batchDescribeTypeConfigurationsResponse_httpStatus = Lens.lens (\BatchDescribeTypeConfigurationsResponse' {httpStatus} -> httpStatus) (\s@BatchDescribeTypeConfigurationsResponse' {} a -> s {httpStatus = a} :: BatchDescribeTypeConfigurationsResponse)

instance
  Prelude.NFData
    BatchDescribeTypeConfigurationsResponse
