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
-- Module      : Amazonka.ElasticBeanstalk.Types.PlatformBranchSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ElasticBeanstalk.Types.PlatformBranchSummary where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Summary information about a platform branch.
--
-- /See:/ 'newPlatformBranchSummary' smart constructor.
data PlatformBranchSummary = PlatformBranchSummary'
  { -- | The name of the platform branch.
    branchName :: Prelude.Maybe Prelude.Text,
    -- | An ordinal number that designates the order in which platform branches
    -- have been added to a platform. This can be helpful, for example, if your
    -- code calls the @ListPlatformBranches@ action and then displays a list of
    -- platform branches.
    --
    -- A larger @BranchOrder@ value designates a newer platform branch within
    -- the platform.
    branchOrder :: Prelude.Maybe Prelude.Int,
    -- | The name of the platform to which this platform branch belongs.
    platformName :: Prelude.Maybe Prelude.Text,
    -- | The environment tiers that platform versions in this branch support.
    --
    -- Possible values: @WebServer\/Standard@ | @Worker\/SQS\/HTTP@
    supportedTierList :: Prelude.Maybe [Prelude.Text],
    -- | The support life cycle state of the platform branch.
    --
    -- Possible values: @beta@ | @supported@ | @deprecated@ | @retired@
    lifecycleState :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PlatformBranchSummary' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'branchName', 'platformBranchSummary_branchName' - The name of the platform branch.
--
-- 'branchOrder', 'platformBranchSummary_branchOrder' - An ordinal number that designates the order in which platform branches
-- have been added to a platform. This can be helpful, for example, if your
-- code calls the @ListPlatformBranches@ action and then displays a list of
-- platform branches.
--
-- A larger @BranchOrder@ value designates a newer platform branch within
-- the platform.
--
-- 'platformName', 'platformBranchSummary_platformName' - The name of the platform to which this platform branch belongs.
--
-- 'supportedTierList', 'platformBranchSummary_supportedTierList' - The environment tiers that platform versions in this branch support.
--
-- Possible values: @WebServer\/Standard@ | @Worker\/SQS\/HTTP@
--
-- 'lifecycleState', 'platformBranchSummary_lifecycleState' - The support life cycle state of the platform branch.
--
-- Possible values: @beta@ | @supported@ | @deprecated@ | @retired@
newPlatformBranchSummary ::
  PlatformBranchSummary
newPlatformBranchSummary =
  PlatformBranchSummary'
    { branchName =
        Prelude.Nothing,
      branchOrder = Prelude.Nothing,
      platformName = Prelude.Nothing,
      supportedTierList = Prelude.Nothing,
      lifecycleState = Prelude.Nothing
    }

-- | The name of the platform branch.
platformBranchSummary_branchName :: Lens.Lens' PlatformBranchSummary (Prelude.Maybe Prelude.Text)
platformBranchSummary_branchName = Lens.lens (\PlatformBranchSummary' {branchName} -> branchName) (\s@PlatformBranchSummary' {} a -> s {branchName = a} :: PlatformBranchSummary)

-- | An ordinal number that designates the order in which platform branches
-- have been added to a platform. This can be helpful, for example, if your
-- code calls the @ListPlatformBranches@ action and then displays a list of
-- platform branches.
--
-- A larger @BranchOrder@ value designates a newer platform branch within
-- the platform.
platformBranchSummary_branchOrder :: Lens.Lens' PlatformBranchSummary (Prelude.Maybe Prelude.Int)
platformBranchSummary_branchOrder = Lens.lens (\PlatformBranchSummary' {branchOrder} -> branchOrder) (\s@PlatformBranchSummary' {} a -> s {branchOrder = a} :: PlatformBranchSummary)

-- | The name of the platform to which this platform branch belongs.
platformBranchSummary_platformName :: Lens.Lens' PlatformBranchSummary (Prelude.Maybe Prelude.Text)
platformBranchSummary_platformName = Lens.lens (\PlatformBranchSummary' {platformName} -> platformName) (\s@PlatformBranchSummary' {} a -> s {platformName = a} :: PlatformBranchSummary)

-- | The environment tiers that platform versions in this branch support.
--
-- Possible values: @WebServer\/Standard@ | @Worker\/SQS\/HTTP@
platformBranchSummary_supportedTierList :: Lens.Lens' PlatformBranchSummary (Prelude.Maybe [Prelude.Text])
platformBranchSummary_supportedTierList = Lens.lens (\PlatformBranchSummary' {supportedTierList} -> supportedTierList) (\s@PlatformBranchSummary' {} a -> s {supportedTierList = a} :: PlatformBranchSummary) Prelude.. Lens.mapping Lens.coerced

-- | The support life cycle state of the platform branch.
--
-- Possible values: @beta@ | @supported@ | @deprecated@ | @retired@
platformBranchSummary_lifecycleState :: Lens.Lens' PlatformBranchSummary (Prelude.Maybe Prelude.Text)
platformBranchSummary_lifecycleState = Lens.lens (\PlatformBranchSummary' {lifecycleState} -> lifecycleState) (\s@PlatformBranchSummary' {} a -> s {lifecycleState = a} :: PlatformBranchSummary)

instance Core.FromXML PlatformBranchSummary where
  parseXML x =
    PlatformBranchSummary'
      Prelude.<$> (x Core..@? "BranchName")
      Prelude.<*> (x Core..@? "BranchOrder")
      Prelude.<*> (x Core..@? "PlatformName")
      Prelude.<*> ( x Core..@? "SupportedTierList"
                      Core..!@ Prelude.mempty
                      Prelude.>>= Core.may (Core.parseXMLList "member")
                  )
      Prelude.<*> (x Core..@? "LifecycleState")

instance Prelude.Hashable PlatformBranchSummary

instance Prelude.NFData PlatformBranchSummary
