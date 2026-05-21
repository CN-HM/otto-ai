declare module 'sm-crypto' {
  export const sm2: {
    generateKeyPairHex(): { publicKey: string; privateKey: string };
    doEncrypt(msg: string, publicKey: string, cipherMode?: number): string;
    doDecrypt(encryptData: string, privateKey: string, cipherMode?: number): string;
    doSignature(msg: string, privateKey: string, options?: object): string;
    doVerifySignature(msg: string, signHex: string, publicKey: string, options?: object): boolean;
  };
  export const sm3: (msg: string, options?: object) => string;
  export const sm4: {
    encrypt(inArray: string | number[], key: string | number[], options?: object): string;
    decrypt(inArray: string | number[], key: string | number[], options?: object): string;
  };
}
