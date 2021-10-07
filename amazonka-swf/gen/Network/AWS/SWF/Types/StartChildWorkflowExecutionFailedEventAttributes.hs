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
-- Module      : Network.AWS.SWF.Types.StartChildWorkflowExecutionFailedEventAttributes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.SWF.Types.StartChildWorkflowExecutionFailedEventAttributes where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude
import Network.AWS.SWF.Types.StartChildWorkflowExecutionFailedCause
import Network.AWS.SWF.Types.WorkflowType

-- | Provides the details of the @StartChildWorkflowExecutionFailed@ event.
--
-- /See:/ 'newStartChildWorkflowExecutionFailedEventAttributes' smart constructor.
data StartChildWorkflowExecutionFailedEventAttributes = StartChildWorkflowExecutionFailedEventAttributes'
  { -- | The data attached to the event that the decider can use in subsequent
    -- workflow tasks. This data isn\'t sent to the child workflow execution.
    control :: Prelude.Maybe Prelude.Text,
    -- | The workflow type provided in the @StartChildWorkflowExecution@ Decision
    -- that failed.
    workflowType :: WorkflowType,
    -- | The cause of the failure. This information is generated by the system
    -- and can be useful for diagnostic purposes.
    --
    -- When @cause@ is set to @OPERATION_NOT_PERMITTED@, the decision fails
    -- because it lacks sufficient permissions. For details and example IAM
    -- policies, see
    -- <https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html Using IAM to Manage Access to Amazon SWF Workflows>
    -- in the /Amazon SWF Developer Guide/.
    cause :: StartChildWorkflowExecutionFailedCause,
    -- | The @workflowId@ of the child workflow execution.
    workflowId :: Prelude.Text,
    -- | When the @cause@ is @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@ is
    -- the ID of the @StartChildWorkflowExecutionInitiated@ event that
    -- corresponds to the @StartChildWorkflowExecution@ Decision to start the
    -- workflow execution. You can use this information to diagnose problems by
    -- tracing back the chain of events leading up to this event.
    --
    -- When the @cause@ isn\'t @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@
    -- is set to @0@ because the @StartChildWorkflowExecutionInitiated@ event
    -- doesn\'t exist.
    initiatedEventId :: Prelude.Integer,
    -- | The ID of the @DecisionTaskCompleted@ event corresponding to the
    -- decision task that resulted in the @StartChildWorkflowExecution@
    -- Decision to request this child workflow execution. This information can
    -- be useful for diagnosing problems by tracing back the chain of events.
    decisionTaskCompletedEventId :: Prelude.Integer
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'StartChildWorkflowExecutionFailedEventAttributes' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'control', 'startChildWorkflowExecutionFailedEventAttributes_control' - The data attached to the event that the decider can use in subsequent
-- workflow tasks. This data isn\'t sent to the child workflow execution.
--
-- 'workflowType', 'startChildWorkflowExecutionFailedEventAttributes_workflowType' - The workflow type provided in the @StartChildWorkflowExecution@ Decision
-- that failed.
--
-- 'cause', 'startChildWorkflowExecutionFailedEventAttributes_cause' - The cause of the failure. This information is generated by the system
-- and can be useful for diagnostic purposes.
--
-- When @cause@ is set to @OPERATION_NOT_PERMITTED@, the decision fails
-- because it lacks sufficient permissions. For details and example IAM
-- policies, see
-- <https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html Using IAM to Manage Access to Amazon SWF Workflows>
-- in the /Amazon SWF Developer Guide/.
--
-- 'workflowId', 'startChildWorkflowExecutionFailedEventAttributes_workflowId' - The @workflowId@ of the child workflow execution.
--
-- 'initiatedEventId', 'startChildWorkflowExecutionFailedEventAttributes_initiatedEventId' - When the @cause@ is @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@ is
-- the ID of the @StartChildWorkflowExecutionInitiated@ event that
-- corresponds to the @StartChildWorkflowExecution@ Decision to start the
-- workflow execution. You can use this information to diagnose problems by
-- tracing back the chain of events leading up to this event.
--
-- When the @cause@ isn\'t @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@
-- is set to @0@ because the @StartChildWorkflowExecutionInitiated@ event
-- doesn\'t exist.
--
-- 'decisionTaskCompletedEventId', 'startChildWorkflowExecutionFailedEventAttributes_decisionTaskCompletedEventId' - The ID of the @DecisionTaskCompleted@ event corresponding to the
-- decision task that resulted in the @StartChildWorkflowExecution@
-- Decision to request this child workflow execution. This information can
-- be useful for diagnosing problems by tracing back the chain of events.
newStartChildWorkflowExecutionFailedEventAttributes ::
  -- | 'workflowType'
  WorkflowType ->
  -- | 'cause'
  StartChildWorkflowExecutionFailedCause ->
  -- | 'workflowId'
  Prelude.Text ->
  -- | 'initiatedEventId'
  Prelude.Integer ->
  -- | 'decisionTaskCompletedEventId'
  Prelude.Integer ->
  StartChildWorkflowExecutionFailedEventAttributes
newStartChildWorkflowExecutionFailedEventAttributes
  pWorkflowType_
  pCause_
  pWorkflowId_
  pInitiatedEventId_
  pDecisionTaskCompletedEventId_ =
    StartChildWorkflowExecutionFailedEventAttributes'
      { control =
          Prelude.Nothing,
        workflowType =
          pWorkflowType_,
        cause = pCause_,
        workflowId = pWorkflowId_,
        initiatedEventId =
          pInitiatedEventId_,
        decisionTaskCompletedEventId =
          pDecisionTaskCompletedEventId_
      }

-- | The data attached to the event that the decider can use in subsequent
-- workflow tasks. This data isn\'t sent to the child workflow execution.
startChildWorkflowExecutionFailedEventAttributes_control :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes (Prelude.Maybe Prelude.Text)
startChildWorkflowExecutionFailedEventAttributes_control = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {control} -> control) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {control = a} :: StartChildWorkflowExecutionFailedEventAttributes)

-- | The workflow type provided in the @StartChildWorkflowExecution@ Decision
-- that failed.
startChildWorkflowExecutionFailedEventAttributes_workflowType :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes WorkflowType
startChildWorkflowExecutionFailedEventAttributes_workflowType = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {workflowType} -> workflowType) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {workflowType = a} :: StartChildWorkflowExecutionFailedEventAttributes)

-- | The cause of the failure. This information is generated by the system
-- and can be useful for diagnostic purposes.
--
-- When @cause@ is set to @OPERATION_NOT_PERMITTED@, the decision fails
-- because it lacks sufficient permissions. For details and example IAM
-- policies, see
-- <https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html Using IAM to Manage Access to Amazon SWF Workflows>
-- in the /Amazon SWF Developer Guide/.
startChildWorkflowExecutionFailedEventAttributes_cause :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes StartChildWorkflowExecutionFailedCause
startChildWorkflowExecutionFailedEventAttributes_cause = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {cause} -> cause) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {cause = a} :: StartChildWorkflowExecutionFailedEventAttributes)

-- | The @workflowId@ of the child workflow execution.
startChildWorkflowExecutionFailedEventAttributes_workflowId :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes Prelude.Text
startChildWorkflowExecutionFailedEventAttributes_workflowId = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {workflowId} -> workflowId) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {workflowId = a} :: StartChildWorkflowExecutionFailedEventAttributes)

-- | When the @cause@ is @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@ is
-- the ID of the @StartChildWorkflowExecutionInitiated@ event that
-- corresponds to the @StartChildWorkflowExecution@ Decision to start the
-- workflow execution. You can use this information to diagnose problems by
-- tracing back the chain of events leading up to this event.
--
-- When the @cause@ isn\'t @WORKFLOW_ALREADY_RUNNING@, @initiatedEventId@
-- is set to @0@ because the @StartChildWorkflowExecutionInitiated@ event
-- doesn\'t exist.
startChildWorkflowExecutionFailedEventAttributes_initiatedEventId :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes Prelude.Integer
startChildWorkflowExecutionFailedEventAttributes_initiatedEventId = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {initiatedEventId} -> initiatedEventId) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {initiatedEventId = a} :: StartChildWorkflowExecutionFailedEventAttributes)

-- | The ID of the @DecisionTaskCompleted@ event corresponding to the
-- decision task that resulted in the @StartChildWorkflowExecution@
-- Decision to request this child workflow execution. This information can
-- be useful for diagnosing problems by tracing back the chain of events.
startChildWorkflowExecutionFailedEventAttributes_decisionTaskCompletedEventId :: Lens.Lens' StartChildWorkflowExecutionFailedEventAttributes Prelude.Integer
startChildWorkflowExecutionFailedEventAttributes_decisionTaskCompletedEventId = Lens.lens (\StartChildWorkflowExecutionFailedEventAttributes' {decisionTaskCompletedEventId} -> decisionTaskCompletedEventId) (\s@StartChildWorkflowExecutionFailedEventAttributes' {} a -> s {decisionTaskCompletedEventId = a} :: StartChildWorkflowExecutionFailedEventAttributes)

instance
  Core.FromJSON
    StartChildWorkflowExecutionFailedEventAttributes
  where
  parseJSON =
    Core.withObject
      "StartChildWorkflowExecutionFailedEventAttributes"
      ( \x ->
          StartChildWorkflowExecutionFailedEventAttributes'
            Prelude.<$> (x Core..:? "control")
              Prelude.<*> (x Core..: "workflowType")
              Prelude.<*> (x Core..: "cause")
              Prelude.<*> (x Core..: "workflowId")
              Prelude.<*> (x Core..: "initiatedEventId")
              Prelude.<*> (x Core..: "decisionTaskCompletedEventId")
      )

instance
  Prelude.Hashable
    StartChildWorkflowExecutionFailedEventAttributes

instance
  Prelude.NFData
    StartChildWorkflowExecutionFailedEventAttributes
