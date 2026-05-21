import { sm2 } from 'sm-crypto';

/**
 * SM2 public key encryption.
 * Matches upstream ai-esp32-server Vue frontend convention:
 * - cipherMode = 1 (C1C3C2)
 * - result prefixed with "04" (uncompressed point indicator)
 */
export function sm2Encrypt(publicKey: string, plainText: string): string {
  if (!publicKey) {
    throw new Error('SM2 公钥不能为空');
  }
  if (!plainText) {
    throw new Error('明文不能为空');
  }

  const encrypted = sm2.doEncrypt(plainText, publicKey, 1);
  return '04' + encrypted;
}
