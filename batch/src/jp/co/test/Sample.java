package jp.co.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * サンプルクラス
 * @author B-KYO
 */
public class Sample {

	/** ロガー. */
	private static Logger logger = LoggerFactory.getLogger(Sample.class);

	/** 終了ステータスコード(正常終了). */
	private static final int SUCCESS_STATUS = 0;

	/** 終了ステータスコード(異常終了). */
	private static final int ERROR_STATUS = 1;

	/**
	 * バッチorシェルからメインクラスとして指定された場合に 実行されるメソッド.
	 *
	 * @param args コマンドライン引数
	 */
	public static void main (String[] args) {
		if(0 == args.length){
			logger.info("正常終了");
			System.exit(SUCCESS_STATUS);
		}else{
			logger.error("不要な引数があります。");
			System.exit(ERROR_STATUS);
		}
	}
}
