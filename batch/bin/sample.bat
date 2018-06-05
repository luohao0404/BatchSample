@echo off

echo ########################################
echo # 実行プログラム    : Sample.class
echo # 実行プログラム名  : サンプルクラス
echo # 処理内容          : 引数がなければ正常終了
echo #                     引数があれば異常終了
echo # 引数              : パラメータ1
echo # 返却値            : 0 [正常終了]
echo #                   : 1 [異常終了]
echo ########################################

echo ###########################
echo # 環境変数設定
echo ###########################

REM # batch.iniファイル読み込み
REM # BATCH_LIBRARY_PATH : バッチ用ライブラリのパス
REM # BATCH_CONFIG_PATH  : バッチ用設定ファイルのパス
for /F "eol=# tokens=1,2* delims==" %%i in (../conf/batch.ini) do (
  call set %%i=%%j
)

REM # クラスパス設定
SET CLASS_PASS=.;%BATCH_CONFIG_PATH%\.;%BATCH_LIBRARY_PATH%\*

REM # 実行するJavaClass指定
SET EXECUTE_CLASS=jp.co.test.Sample

REM # 各設定値をコマンドプロンプトに表示
echo EXECUTE_BAT=%~0
echo EXECUTE_CLASS=%EXECUTE_CLASS%
echo CLASS_PASS=%CLASS_PASS%


echo ###########################
echo # Java実行
echo ###########################

echo java -cp %CLASS_PASS% %EXECUTE_CLASS% %1
java -cp %CLASS_PASS% %EXECUTE_CLASS% %1

echo ###########################
echo # 返却値
echo ###########################
IF %ERRORLEVEL%==1 (
	echo 異常終了  %ERRORLEVEL%
	pause
	EXIT /b 1
)

echo 正常終了  %ERRORLEVEL%
pause
EXIT /b 0



