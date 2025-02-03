﻿/// <summary>
/// ***************************************************************************
///
/// Bubbleoid
///
/// Copyright 2025 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://bubbleoid.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Bubbleoid-GGJ2025
///
/// ***************************************************************************
/// File last update : 2025-01-26T21:06:26.000+01:00
/// Signature : 9884e8b878f6cf049ad16876329561c154d0f6b3
/// ***************************************************************************
/// </summary>

unit uConsts;

interface

uses
  System.Types;

const
  /// <summary>
  /// Version number of your game, don't forget to update the
  /// Project/Options/Versions infos before compiling a public RELEASE
  /// </summary>
  CAboutVersionNumber = '1.0';

  /// <summary>
  /// Version date of your game, change it when you publish a new public release
  /// </summary>
  CAboutVersionDate = '20250126';

  /// <summary>
  /// Title of your game used in the About box and as the main form caption
  /// </summary>
  CAboutGameTitle = 'Bubbleoid';

  /// <summary>
  /// The copyright to show in the About box
  /// </summary>
  CAboutCopyright = '(c) 2025 Patrick PREMARTIN';

  /// <summary>
  /// The website URL of your game (used in the About box)
  /// </summary>
  CAboutGameURL = 'https://bubbleoid.gamolf.fr/';

  /// <summary>
  /// The URL where you can buy the software.
  /// (if not empty, a "Buy" button is added in the About Box)
  /// </summary>
  CSoftwareBuyURL = CAboutGameURL;

  /// <summary>
  /// Default language used if the system language is not supported
  /// (of course you have to translate all textes of the program in this
  /// language, so use yours or English by default)
  /// </summary>
  /// <remarks>
  /// use 2 letters ISO code
  /// </remarks>
  CDefaultLanguage = 'en';

  /// <summary>
  /// If true the main form is opened in full screen. A menu with a "about" option is added for macOS.
  /// If false the main form is what you did with it, no menu is added for macOS.
  /// </summary>
  /// <remarks>
  /// Only available for desktop platforms. For iOS and Android it's "fullscreen" by design
  /// </remarks>
{$IFDEF DEBUG}
  // In DEBUG mode
  COpenGameInFullScreenMode = true;
{$ELSE}
  // For other compilations (including RELEASE)
  COpenGameInFullScreenMode = true;
{$ENDIF}
  //
  /// <summary>
  /// Relative (from Windows compiled EXE) or absolute path to find the
  /// background music file when you execute the program in DEBUG on Windows
  /// (without deployment)
  /// </summary>
  CDefaultBackgroundMusicPath = '..\..\..\_PRIVATE\musics\';

  /// <summary>
  /// Add the name of your WAV or MP3 file to use as background music
  /// </summary>
  /// <remarks>
  /// For example : 'MyMusic.mp3', stored locally in CDefaultBackgroundMusicPath,
  /// added to deployment project options for DEBUG or RELEASE other than Windows
  /// </remarks>
  CBackgroundMusicFileName = '';

  /// <summary>
  /// Relative (from Windows compiled EXE) or absolute path to find the
  /// sound effects file when you execute the program in DEBUG on Windows
  /// (without deployment)
  /// </summary>
  CDefaultSoundEffectsPath = '..\..\..\_PRIVATE\sounds\';

  /// <summary>
  /// Used as a folder name to store your game settings
  /// </summary>
  /// <remarks>
  /// Don't use a path, only a name to use as a folder name.
  /// The real paths are calculated automatically depending on the platform.
  /// </remarks>
  CEditorFolderName = 'Gamolf';

  /// <summary>
  /// Used as a folder name to store the settings and scores
  /// </summary>
  /// <remarks>
  /// Don't use a path, only a name to use a a folder name.
  /// The real paths are calculated automatically depending on the platform.
  /// </remarks>
  CGameFolderName = 'Bubbleoid';

  /// <summary>
  /// The GUID to use for this game when saving/loading files like game data
  /// to check they are from this game and not an other one.
  /// </summary>
  CGameGUID = '{5959EF8D-6D89-4411-BD8D-E0FC9059536C}';

  /// <summary>
  /// Default lives number used when starting a new game or clearing the game data
  /// </summary>
  CDefaultNbLives = 5;

  /// <summary>
  /// Default score used when starting a new game or clearing the game data
  /// </summary>
  CDefaultScore = 0;

  /// <summary>
  /// Default game level used when starting a new game or clearing the game data
  /// </summary>
  CDefaultLevel = 1;

  /// <summary>
  /// When a IUIControl button is clicked (with the keyboard or a game
  /// controller), the default ancestor do a Down/Up and wait
  /// CTimeInMSBetweenButtonDownAndUp milliseconds between the two states.
  /// </summary>
  /// <remarks>
  /// Put 0 if you don't want to wait on button click.
  /// You can customize the value on each button.
  /// </remarks>
  CTimeInMSBetweenButtonDownAndUp = 50;

type
{$SCOPEDENUMS ON}
  /// <summary>
  /// List of scenes available in your game
  /// "None", "Home" and "Exit" are used by the template engine, you can add/remove the others
  /// </summary>
  /// <remarks>
  /// Change value of TScene.Current to autocreate and show the good scene.
  /// Create scenes screens by inheriting from /Scenes/_SceneAncestor.pas
  /// </remarks>
  TSceneType = (None (* "None" must stay *) , Exit (* "Exit" must stay *) ,
    Home, Game, GameOverLost, GameOverWin, Credits, Options, HallOfFame,
    TestButtonsAndDialogs);

Const
  /// <summary>
  /// Specify what scene is opened after the main form creation
  /// </summary>
  /// <remarks>
  /// Change it to an other scene, like a game intro or a splashscreen
  /// </remarks>
  CDefaultSceneOnStartup = TSceneType.Home;
  // CDefaultSceneOnStartup = TSceneType.TestButtonsAndDialogs;
{$IF Defined(RELEASE)}

var
  GConfigXORKey: TByteDynArray;
  GGameDataXORKey: TByteDynArray;
{$ENDIF}

const
  CNbBubbles = 100;
  CFieldSize = CNbBubbles * 10;
  CFPS = 60;
  CCircleDiameter = 128;
  CCircleRadius = CCircleDiameter / 2;
  CPalierScorePourVie = CNbBubbles div 3;

var
  // TODO : transférer les variables dans un TGameData personnalisé
  SpeedX, SpeedY, SpeedZ: Single;

implementation

uses
  System.Classes,
  System.SysUtils;

initialization

try
  if CAboutGameTitle.Trim.IsEmpty then
    raise Exception.Create
      ('Please give a title to your game in CAboutGameTitle !');

  if CEditorFolderName.Trim.IsEmpty then
    raise Exception.Create
      ('Please give an editor folder name in CEditorFolderName !');

  if CGameFolderName.Trim.IsEmpty then
    raise Exception.Create
      ('Please give a game folder name in CGameFolderName !');

  if CDefaultLanguage.Trim.IsEmpty then
    raise Exception.Create
      ('Please specify a default language ISO code in CDefaultLanguage !');

  if (CDefaultLanguage <> CDefaultLanguage.Trim.ToLower) then
    raise Exception.Create('Please use "' + CDefaultLanguage.Trim.ToLower +
      '" as CDefaultLanguage value.');

{$IFDEF RELEASE}
  if (CGameGUID = '{48AD6D06-1BED-4F33-ADCA-267E12D74417}') then
    raise Exception.Create('Wrong GUID. Change it in game settings !');
{$ENDIF}
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ELSE}
  ReportMemoryLeaksOnShutdown := false;
{$ENDIF}
{$IF Defined(RELEASE)}
  // Path to the Pascal file where you fill GConfigXORKey variable.
  // This variable is used to crypt/decrypt the settings data in RELEASE mode.
  //
  // Template file is in ____PRIVATE\src\ConfigFileXORKey.inc
  // Copy it to a private folder (not in the code repository for security reasons)
  // Customize it
  // Update it's path to the Include directive
  //
  // Don't share the key file. If you need to modify it, you won't be able to
  // open the previous configuration file!
{$I '..\_PRIVATE\src\ConfigFileXORKey.inc'}

  // Path to the Pascal file where you fill GGameDataXORKey variable.
  // This variable is used to crypt/decrypt the settings data in RELEASE mode.
  //
  // Template file is in ____PRIVATE\src\GameDataFileXORKey.inc
  // Copy it to a private folder (not in the code repository for security reasons)
  // Customize it
  // Update it's path to the Include directive
  //
  // Don't share the key file. If you need to modify it, you won't be able to
  // open the previous configuration file!
{$I '..\_PRIVATE\src\GameDataFileXORKey.inc'}
{$ENDIF}
except
  on e: Exception do
  begin
    var
    s := e.message;
    tthread.forcequeue(nil,
      procedure
      begin
        raise Exception.Create(s);
      end);
  end;
end;

end.
