#!/bin/sh

echo "########################################"
echo "# 実行プログラム    : Sample.class"
echo "# 実行プログラム名  : サンプルクラス"
echo "# 処理内容          : 引数がなければ正常終了"
echo "#                     引数があれば異常終了"
echo "# 引数              : パラメータ1"
echo "# 返却値            : 0 [正常終了]"
echo "#                   : 1 [異常終了]"
echo "########################################"

echo "###########################"
echo "# 環境変数設定"
echo "###########################"


# batch.envファイル読み込み
# BATCH_LIBRARY_PATH : バッチ用ライブラリのパス
# BATCH_CONFIG_PATH  : バッチ用設定ファイルのパス
cd `dirname $0`
. ../conf/batch.conf

# クラスパス設定
CLASS_PASS=".:${BATCH_LIBRARY_PATH}/*:${BATCH_CONFIG_PATH}/*"

# 実行するJavaClass指定
export EXECUTE_CLASS="jp.co.test.Sample"

# 各設定値をコマンドプロンプトに表示
echo "${EXECUTE_CLASS}"
echo "${CLASS_PASS}"

echo "###########################"
echo "# Java実行"
echo "###########################"

echo "java -cp ${CLASS_PASS} ${EXECUTE_CLASS} $1"
java -cp "${CLASS_PASS}" "${EXECUTE_CLASS}" $1
RESULT=$?

echo "###########################"
echo "# 返却値"
echo "###########################"

if [ ${RESULT} = 1 ]; then
    echo "異常終了" ${RESULT}
    exit 1
fi

echo "正常終了" ${RESULT}
exit 0
