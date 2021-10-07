{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Config.Types.AggregateConformancePackComplianceFilters
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Config.Types.AggregateConformancePackComplianceFilters where

import Network.AWS.Config.Types.ConformancePackComplianceType
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Filters the conformance packs based on an account ID, region, compliance
-- type, and the name of the conformance pack.
--
-- /See:/ 'newAggregateConformancePackComplianceFilters' smart constructor.
data AggregateConformancePackComplianceFilters = AggregateConformancePackComplianceFilters'
  { -- | The 12-digit Amazon Web Services account ID of the source account.
    accountId :: Prelude.Maybe Prelude.Text,
    -- | The compliance status of the conformance pack.
    complianceType :: Prelude.Maybe ConformancePackComplianceType,
    -- | The name of the conformance pack.
    conformancePackName :: Prelude.Maybe Prelude.Text,
    -- | The source Amazon Web Services Region from where the data is aggregated.
    awsRegion :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'AggregateConformancePackComplianceFilters' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'accountId', 'aggregateConformancePackComplianceFilters_accountId' - The 12-digit Amazon Web Services account ID of the source account.
--
-- 'complianceType', 'aggregateConformancePackComplianceFilters_complianceType' - The compliance status of the conformance pack.
--
-- 'conformancePackName', 'aggregateConformancePackComplianceFilters_conformancePackName' - The name of the conformance pack.
--
-- 'awsRegion', 'aggregateConformancePackComplianceFilters_awsRegion' - The source Amazon Web Services Region from where the data is aggregated.
newAggregateConformancePackComplianceFilters ::
  AggregateConformancePackComplianceFilters
newAggregateConformancePackComplianceFilters =
  AggregateConformancePackComplianceFilters'
    { accountId =
        Prelude.Nothing,
      complianceType = Prelude.Nothing,
      conformancePackName =
        Prelude.Nothing,
      awsRegion = Prelude.Nothing
    }

-- | The 12-digit Amazon Web Services account ID of the source account.
aggregateConformancePackComplianceFilters_accountId :: Lens.Lens' AggregateConformancePackComplianceFilters (Prelude.Maybe Prelude.Text)
aggregateConformancePackComplianceFilters_accountId = Lens.lens (\AggregateConformancePackComplianceFilters' {accountId} -> accountId) (\s@AggregateConformancePackComplianceFilters' {} a -> s {accountId = a} :: AggregateConformancePackComplianceFilters)

-- | The compliance status of the conformance pack.
aggregateConformancePackComplianceFilters_complianceType :: Lens.Lens' AggregateConformancePackComplianceFilters (Prelude.Maybe ConformancePackComplianceType)
aggregateConformancePackComplianceFilters_complianceType = Lens.lens (\AggregateConformancePackComplianceFilters' {complianceType} -> complianceType) (\s@AggregateConformancePackComplianceFilters' {} a -> s {complianceType = a} :: AggregateConformancePackComplianceFilters)

-- | The name of the conformance pack.
aggregateConformancePackComplianceFilters_conformancePackName :: Lens.Lens' AggregateConformancePackComplianceFilters (Prelude.Maybe Prelude.Text)
aggregateConformancePackComplianceFilters_conformancePackName = Lens.lens (\AggregateConformancePackComplianceFilters' {conformancePackName} -> conformancePackName) (\s@AggregateConformancePackComplianceFilters' {} a -> s {conformancePackName = a} :: AggregateConformancePackComplianceFilters)

-- | The source Amazon Web Services Region from where the data is aggregated.
aggregateConformancePackComplianceFilters_awsRegion :: Lens.Lens' AggregateConformancePackComplianceFilters (Prelude.Maybe Prelude.Text)
aggregateConformancePackComplianceFilters_awsRegion = Lens.lens (\AggregateConformancePackComplianceFilters' {awsRegion} -> awsRegion) (\s@AggregateConformancePackComplianceFilters' {} a -> s {awsRegion = a} :: AggregateConformancePackComplianceFilters)

instance
  Prelude.Hashable
    AggregateConformancePackComplianceFilters

instance
  Prelude.NFData
    AggregateConformancePackComplianceFilters

instance
  Core.ToJSON
    AggregateConformancePackComplianceFilters
  where
  toJSON AggregateConformancePackComplianceFilters' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("AccountId" Core..=) Prelude.<$> accountId,
            ("ComplianceType" Core..=)
              Prelude.<$> complianceType,
            ("ConformancePackName" Core..=)
              Prelude.<$> conformancePackName,
            ("AwsRegion" Core..=) Prelude.<$> awsRegion
          ]
      )
