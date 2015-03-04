module W3C
module DOM3
# @author jtzero
# http://www.w3.org/TR/2014/WD-DOM-Level-3-Events-key-20140612/
module KeyValues
  SpecialKeyValues = 'Unidentified'
  
  ModifierKeys = ['Accel', 'Alt', 'AltGraph', 'CapsLock', 'Control', 'Fn', 'FnLock', 'Hyper', 'Meta', 
                                        'NumLock', 'OS', 'ScrollLock', 'Shift', 'Super', 'Symbol', 'SymbolLock']
                                        
  WhitespaceKeys = ['Enter', 'Separator', 'Tab']
  
  NavigationKeys = ['ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowUp', 'End', 'Home', 'PageDown', 'PageUp']
  
  EditingKeys = ['Backspace', 'Clear', 'Copy', 'CrSel', 'Cut', 'Delete', 'EraseEof', 'ExSel', 'Insert', 'Paste', 'Redo', 'Undo' ]
  
  UIKeys = ['Accept', 'Again', 'Attn', 'Cancel', 'ContextMenu', 'Escape', 'Execute', 'Find', 'Help', 'Pause', 
                                                                                  'Play', 'Props', 'Select', 'ZoomIn', 'ZoomOut']
  
  DeviceKeys = ['BrightnessDown', 'BrightnessUp', 'Camera', 'Eject', 'LogOff', 'Power', 'PowerOff', 'PrintScreen', 'Hibernate', 'Standby', 'WakeUp'] 
  
  IMEandCompositionKeys = ['AllCandidates', 'Alphanumeric', 'CodeInput', 'Compose', 'Convert', 'Dead', 'FinalMode', 'GroupFirst', 'GroupLast', 
                          'GroupNext', 'GroupPrevious', 'ModeChange', 'NextCandidate', 'NonConvert', 'PreviousCandidate', 
                                                                                 'Process', 'SingleCandidate', 'HangulMode', 'HanjaMode', 'JunjaMode']
  
  KeysspecifictoKoreankeyboards = ['Eisu', 'Hankaku', 'Hiragana', 'HiraganaKatakana', 'KanaMode', 'KanjiMode', 'Katakana', 'Romaji', 
                                                                                                              'Zenkaku', 'ZenkakuHankaku']
  KeysspecifictoJapanesekeyboards = ['Eisu', 'Hankaku', 'Hiragana', 'HiraganaKatakana', 'KanaMode', 'KanjiMode', 'Katakana', 'Romaji', 
                                                                                                              'Zenkaku', 'ZenkakuHankaku']
  
  General_PurposeFunctionKeys = ['F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12', 'Soft1', 'Soft2', 'Soft3', 'Soft4']
  
  MultimediaKeys = ['Close', 'MailForward', 'MailReply', 'MailSend', 'MediaPlayPause', 'MediaSelect', 'MediaStop', 'MediaTrackNext', 
                                'MediaTrackPrevious', 'New', 'Open', 'Print', 'Save', 'SpellCheck', 'VolumeDown', 'VolumeUp', 'VolumeMute']
  
  ApplicationKeys = ['Launch', 'LaunchCalculator', 'LaunchCalendar', 'LaunchMail', 'LaunchMediaPlayer', 'LaunchMusicPlayer', 
                     'LaunchMyComputer', 'LaunchScreenSaver', 'LaunchSpreadsheet', 'LaunchWebBrowser', 'LaunchWebCam', 'LaunchWordProcessor']
  
  BrowserKeys = ['BrowserBack', 'BrowserFavorites', 'BrowserForward', 'BrowserHome', 'BrowserRefresh', 'BrowserSearch', 'BrowserStop']
  
  MediaControllerKeys = ['AudioBalanceLeft', 'AudioBalanceRight', 'AudioBassBoostDown', 'AudioBassBoostUp', 'AudioFaderFront', 'AudioFaderRear', 
                         'AudioSurroundModeNext', 'AVRInput', 'AVRPower', 'ChannelDown', 'ChannelUp', 'ColorF0Red', 'ColorF1Green', 
                         'ColorF2Yellow', 'ColorF3Blue', 'ColorF4Grey', 'ColorF5Brown', 'ClosedCaptionToggle', 'Dimmer', 'DisplaySwap', 'Exit', 
                         'FavoriteClear0', 'FavoriteClear1', 'FavoriteClear2', 'FavoriteClear3', 'FavoriteRecall0', 'FavoriteRecall1', 
                         'FavoriteRecall2', 'FavoriteRecall3', 'FavoriteStore0', 'FavoriteStore1', 'FavoriteStore2', 'FavoriteStore3', 'Guide', 
                         'GuideNextDay', 'GuidePreviousDay', 'Info', 'InstantReplay', 'Link', 'ListProgram', 'LiveContent', 'Lock', 'MediaApps', 
                         'ContextMenu', 'MediaFastForward', 'MediaLast', 'MediaPause', 'MediaPlay', 'MediaRecord', 'MediaRewind', 'MediaSkip', 
                         'NextFavoriteChannel', 'NextUserProfile', 'OnDemand', 'PinPDown', 'PinPMove', 'PinPToggle', 'PinPUp', 'PlaySpeedDown', 
                         'PlaySpeedReset', 'PlaySpeedUp', 'RandomToggle', 'RcLowBattery', 'RecordSpeedNext', 'RfBypass', 'ScanChannelsToggle', 
                         'ScreenModeNext', 'Settings', 'SplitScreenToggle', 'STBInput', 'STBPower', 'Subtitle', 'Teletext', 'TV', 'TVInput', 
                         'TVPower', 'VideoModeNext', 'Wink', 'ZoomToggle','BrowserBack', 'BrowserForward', 'ContextMenu', 'Eject', 'End', 'Enter', 
                         'Home', 'MediaPlayPause', 'MediaStop', 'MediaNextTrack', 'MediaPreviousTrack', 'Power', 'Unidentified', 'VolumeDown', 
                                                                                                                        'VolumeUp', 'VolumeMute']
end
end
end