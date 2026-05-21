export interface LoginRequest {
  username: string;
  password: string;
  captchaId?: string;
  mobileCaptcha?: string;
  turnstileToken?: string;
}

export interface RegisterRequest {
  username?: string;
  password?: string;
  phone: string;
  code: string;
  turnstileToken?: string;
}

export interface SmsVerificationRequest {
  phone: string;
  captcha: string;
  captchaId: string;
}

export interface RetrievePasswordRequest {
  phone: string;
  code: string;
  password: string;
  captchaId: string;
  turnstileToken?: string;
}

export interface ChangePasswordRequest {
  password: string;
  newPassword: string;
}

export interface TokenPayload {
  token: string;
  expire?: number;
  clientHash?: string;
}

export interface AuthSession extends TokenPayload {
  username?: string;
}
