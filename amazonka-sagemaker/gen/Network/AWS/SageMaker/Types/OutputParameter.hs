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
-- Module      : Network.AWS.SageMaker.Types.OutputParameter
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.SageMaker.Types.OutputParameter where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | An output parameter of a pipeline step.
--
-- /See:/ 'newOutputParameter' smart constructor.
data OutputParameter = OutputParameter'
  { -- | The name of the output parameter.
    name :: Prelude.Text,
    -- | The value of the output parameter.
    value :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'OutputParameter' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'name', 'outputParameter_name' - The name of the output parameter.
--
-- 'value', 'outputParameter_value' - The value of the output parameter.
newOutputParameter ::
  -- | 'name'
  Prelude.Text ->
  -- | 'value'
  Prelude.Text ->
  OutputParameter
newOutputParameter pName_ pValue_ =
  OutputParameter' {name = pName_, value = pValue_}

-- | The name of the output parameter.
outputParameter_name :: Lens.Lens' OutputParameter Prelude.Text
outputParameter_name = Lens.lens (\OutputParameter' {name} -> name) (\s@OutputParameter' {} a -> s {name = a} :: OutputParameter)

-- | The value of the output parameter.
outputParameter_value :: Lens.Lens' OutputParameter Prelude.Text
outputParameter_value = Lens.lens (\OutputParameter' {value} -> value) (\s@OutputParameter' {} a -> s {value = a} :: OutputParameter)

instance Core.FromJSON OutputParameter where
  parseJSON =
    Core.withObject
      "OutputParameter"
      ( \x ->
          OutputParameter'
            Prelude.<$> (x Core..: "Name") Prelude.<*> (x Core..: "Value")
      )

instance Prelude.Hashable OutputParameter

instance Prelude.NFData OutputParameter

instance Core.ToJSON OutputParameter where
  toJSON OutputParameter' {..} =
    Core.object
      ( Prelude.catMaybes
          [ Prelude.Just ("Name" Core..= name),
            Prelude.Just ("Value" Core..= value)
          ]
      )
