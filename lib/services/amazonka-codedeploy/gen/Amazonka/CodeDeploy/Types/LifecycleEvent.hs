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
-- Module      : Amazonka.CodeDeploy.Types.LifecycleEvent
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.CodeDeploy.Types.LifecycleEvent where

import Amazonka.CodeDeploy.Types.Diagnostics
import Amazonka.CodeDeploy.Types.LifecycleEventStatus
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Information about a deployment lifecycle event.
--
-- /See:/ 'newLifecycleEvent' smart constructor.
data LifecycleEvent = LifecycleEvent'
  { -- | The deployment lifecycle event status:
    --
    -- -   Pending: The deployment lifecycle event is pending.
    --
    -- -   InProgress: The deployment lifecycle event is in progress.
    --
    -- -   Succeeded: The deployment lifecycle event ran successfully.
    --
    -- -   Failed: The deployment lifecycle event has failed.
    --
    -- -   Skipped: The deployment lifecycle event has been skipped.
    --
    -- -   Unknown: The deployment lifecycle event is unknown.
    status :: Prelude.Maybe LifecycleEventStatus,
    -- | The deployment lifecycle event name, such as @ApplicationStop@,
    -- @BeforeInstall@, @AfterInstall@, @ApplicationStart@, or
    -- @ValidateService@.
    lifecycleEventName :: Prelude.Maybe Prelude.Text,
    -- | A timestamp that indicates when the deployment lifecycle event started.
    startTime :: Prelude.Maybe Core.POSIX,
    -- | Diagnostic information about the deployment lifecycle event.
    diagnostics :: Prelude.Maybe Diagnostics,
    -- | A timestamp that indicates when the deployment lifecycle event ended.
    endTime :: Prelude.Maybe Core.POSIX
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'LifecycleEvent' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'status', 'lifecycleEvent_status' - The deployment lifecycle event status:
--
-- -   Pending: The deployment lifecycle event is pending.
--
-- -   InProgress: The deployment lifecycle event is in progress.
--
-- -   Succeeded: The deployment lifecycle event ran successfully.
--
-- -   Failed: The deployment lifecycle event has failed.
--
-- -   Skipped: The deployment lifecycle event has been skipped.
--
-- -   Unknown: The deployment lifecycle event is unknown.
--
-- 'lifecycleEventName', 'lifecycleEvent_lifecycleEventName' - The deployment lifecycle event name, such as @ApplicationStop@,
-- @BeforeInstall@, @AfterInstall@, @ApplicationStart@, or
-- @ValidateService@.
--
-- 'startTime', 'lifecycleEvent_startTime' - A timestamp that indicates when the deployment lifecycle event started.
--
-- 'diagnostics', 'lifecycleEvent_diagnostics' - Diagnostic information about the deployment lifecycle event.
--
-- 'endTime', 'lifecycleEvent_endTime' - A timestamp that indicates when the deployment lifecycle event ended.
newLifecycleEvent ::
  LifecycleEvent
newLifecycleEvent =
  LifecycleEvent'
    { status = Prelude.Nothing,
      lifecycleEventName = Prelude.Nothing,
      startTime = Prelude.Nothing,
      diagnostics = Prelude.Nothing,
      endTime = Prelude.Nothing
    }

-- | The deployment lifecycle event status:
--
-- -   Pending: The deployment lifecycle event is pending.
--
-- -   InProgress: The deployment lifecycle event is in progress.
--
-- -   Succeeded: The deployment lifecycle event ran successfully.
--
-- -   Failed: The deployment lifecycle event has failed.
--
-- -   Skipped: The deployment lifecycle event has been skipped.
--
-- -   Unknown: The deployment lifecycle event is unknown.
lifecycleEvent_status :: Lens.Lens' LifecycleEvent (Prelude.Maybe LifecycleEventStatus)
lifecycleEvent_status = Lens.lens (\LifecycleEvent' {status} -> status) (\s@LifecycleEvent' {} a -> s {status = a} :: LifecycleEvent)

-- | The deployment lifecycle event name, such as @ApplicationStop@,
-- @BeforeInstall@, @AfterInstall@, @ApplicationStart@, or
-- @ValidateService@.
lifecycleEvent_lifecycleEventName :: Lens.Lens' LifecycleEvent (Prelude.Maybe Prelude.Text)
lifecycleEvent_lifecycleEventName = Lens.lens (\LifecycleEvent' {lifecycleEventName} -> lifecycleEventName) (\s@LifecycleEvent' {} a -> s {lifecycleEventName = a} :: LifecycleEvent)

-- | A timestamp that indicates when the deployment lifecycle event started.
lifecycleEvent_startTime :: Lens.Lens' LifecycleEvent (Prelude.Maybe Prelude.UTCTime)
lifecycleEvent_startTime = Lens.lens (\LifecycleEvent' {startTime} -> startTime) (\s@LifecycleEvent' {} a -> s {startTime = a} :: LifecycleEvent) Prelude.. Lens.mapping Core._Time

-- | Diagnostic information about the deployment lifecycle event.
lifecycleEvent_diagnostics :: Lens.Lens' LifecycleEvent (Prelude.Maybe Diagnostics)
lifecycleEvent_diagnostics = Lens.lens (\LifecycleEvent' {diagnostics} -> diagnostics) (\s@LifecycleEvent' {} a -> s {diagnostics = a} :: LifecycleEvent)

-- | A timestamp that indicates when the deployment lifecycle event ended.
lifecycleEvent_endTime :: Lens.Lens' LifecycleEvent (Prelude.Maybe Prelude.UTCTime)
lifecycleEvent_endTime = Lens.lens (\LifecycleEvent' {endTime} -> endTime) (\s@LifecycleEvent' {} a -> s {endTime = a} :: LifecycleEvent) Prelude.. Lens.mapping Core._Time

instance Core.FromJSON LifecycleEvent where
  parseJSON =
    Core.withObject
      "LifecycleEvent"
      ( \x ->
          LifecycleEvent'
            Prelude.<$> (x Core..:? "status")
            Prelude.<*> (x Core..:? "lifecycleEventName")
            Prelude.<*> (x Core..:? "startTime")
            Prelude.<*> (x Core..:? "diagnostics")
            Prelude.<*> (x Core..:? "endTime")
      )

instance Prelude.Hashable LifecycleEvent

instance Prelude.NFData LifecycleEvent