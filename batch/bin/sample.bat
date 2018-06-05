@echo off

echo ########################################
echo # ���s�v���O����    : Sample.class
echo # ���s�v���O������  : �T���v���N���X
echo # �������e          : �������Ȃ���ΐ���I��
echo #                     ����������Έُ�I��
echo # ����              : �p�����[�^1
echo # �ԋp�l            : 0 [����I��]
echo #                   : 1 [�ُ�I��]
echo ########################################

echo ###########################
echo # ���ϐ��ݒ�
echo ###########################

REM # batch.ini�t�@�C���ǂݍ���
REM # BATCH_LIBRARY_PATH : �o�b�`�p���C�u�����̃p�X
REM # BATCH_CONFIG_PATH  : �o�b�`�p�ݒ�t�@�C���̃p�X
for /F "eol=# tokens=1,2* delims==" %%i in (../conf/batch.ini) do (
  call set %%i=%%j
)

REM # �N���X�p�X�ݒ�
SET CLASS_PASS=.;%BATCH_CONFIG_PATH%\.;%BATCH_LIBRARY_PATH%\*

REM # ���s����JavaClass�w��
SET EXECUTE_CLASS=jp.co.test.Sample

REM # �e�ݒ�l���R�}���h�v�����v�g�ɕ\��
echo EXECUTE_BAT=%~0
echo EXECUTE_CLASS=%EXECUTE_CLASS%
echo CLASS_PASS=%CLASS_PASS%


echo ###########################
echo # Java���s
echo ###########################

echo java -cp %CLASS_PASS% %EXECUTE_CLASS% %1
java -cp %CLASS_PASS% %EXECUTE_CLASS% %1

echo ###########################
echo # �ԋp�l
echo ###########################
IF %ERRORLEVEL%==1 (
	echo �ُ�I��  %ERRORLEVEL%
	pause
	EXIT /b 1
)

echo ����I��  %ERRORLEVEL%
pause
EXIT /b 0



