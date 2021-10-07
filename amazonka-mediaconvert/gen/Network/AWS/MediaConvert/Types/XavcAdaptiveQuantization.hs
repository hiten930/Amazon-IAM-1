{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaConvert.Types.XavcAdaptiveQuantization
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaConvert.Types.XavcAdaptiveQuantization
  ( XavcAdaptiveQuantization
      ( ..,
        XavcAdaptiveQuantization_AUTO,
        XavcAdaptiveQuantization_HIGH,
        XavcAdaptiveQuantization_HIGHER,
        XavcAdaptiveQuantization_LOW,
        XavcAdaptiveQuantization_MAX,
        XavcAdaptiveQuantization_MEDIUM,
        XavcAdaptiveQuantization_OFF
      ),
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Prelude as Prelude

-- | Keep the default value, Auto (AUTO), for this setting to have
-- MediaConvert automatically apply the best types of quantization for your
-- video content. When you want to apply your quantization settings
-- manually, you must set Adaptive quantization (adaptiveQuantization) to a
-- value other than Auto (AUTO). Use this setting to specify the strength
-- of any adaptive quantization filters that you enable. If you don\'t want
-- MediaConvert to do any adaptive quantization in this transcode, set
-- Adaptive quantization to Off (OFF). Related settings: The value that you
-- choose here applies to the following settings: Flicker adaptive
-- quantization (flickerAdaptiveQuantization), Spatial adaptive
-- quantization (spatialAdaptiveQuantization), and Temporal adaptive
-- quantization (temporalAdaptiveQuantization).
newtype XavcAdaptiveQuantization = XavcAdaptiveQuantization'
  { fromXavcAdaptiveQuantization ::
      Core.Text
  }
  deriving stock
    ( Prelude.Show,
      Prelude.Read,
      Prelude.Eq,
      Prelude.Ord,
      Prelude.Generic
    )
  deriving newtype
    ( Prelude.Hashable,
      Prelude.NFData,
      Core.FromText,
      Core.ToText,
      Core.ToByteString,
      Core.ToLog,
      Core.ToHeader,
      Core.ToQuery,
      Core.FromJSON,
      Core.FromJSONKey,
      Core.ToJSON,
      Core.ToJSONKey,
      Core.FromXML,
      Core.ToXML
    )

pattern XavcAdaptiveQuantization_AUTO :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_AUTO = XavcAdaptiveQuantization' "AUTO"

pattern XavcAdaptiveQuantization_HIGH :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_HIGH = XavcAdaptiveQuantization' "HIGH"

pattern XavcAdaptiveQuantization_HIGHER :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_HIGHER = XavcAdaptiveQuantization' "HIGHER"

pattern XavcAdaptiveQuantization_LOW :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_LOW = XavcAdaptiveQuantization' "LOW"

pattern XavcAdaptiveQuantization_MAX :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_MAX = XavcAdaptiveQuantization' "MAX"

pattern XavcAdaptiveQuantization_MEDIUM :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_MEDIUM = XavcAdaptiveQuantization' "MEDIUM"

pattern XavcAdaptiveQuantization_OFF :: XavcAdaptiveQuantization
pattern XavcAdaptiveQuantization_OFF = XavcAdaptiveQuantization' "OFF"

{-# COMPLETE
  XavcAdaptiveQuantization_AUTO,
  XavcAdaptiveQuantization_HIGH,
  XavcAdaptiveQuantization_HIGHER,
  XavcAdaptiveQuantization_LOW,
  XavcAdaptiveQuantization_MAX,
  XavcAdaptiveQuantization_MEDIUM,
  XavcAdaptiveQuantization_OFF,
  XavcAdaptiveQuantization'
  #-}
