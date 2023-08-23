object Coder: TCoder
  Left = 559
  Top = 334
  BorderStyle = bsDialog
  Caption = #1064#1080#1092#1088#1072#1090#1086#1088
  ClientHeight = 145
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 42
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088':'
  end
  object Label2: TLabel
    Left = 104
    Top = 96
    Width = 36
    Height = 13
    Caption = #1042#1088#1077#1084#1103':'
  end
  object Large: TLabel
    Left = 16
    Top = 112
    Width = 3
    Height = 13
  end
  object Time: TLabel
    Left = 104
    Top = 112
    Width = 3
    Height = 13
  end
  object Coding: TButton
    Left = 16
    Top = 16
    Width = 161
    Height = 33
    Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = CodingClick
  end
  object Decoding: TButton
    Left = 16
    Top = 56
    Width = 161
    Height = 33
    Caption = #1044#1077#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = DecodingClick
  end
end
