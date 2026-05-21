export const environment = {
  production: false,
  apiBaseUrl: 'http://localhost:8002',
  enableHttpDebug: true,
  turnstile: {
    enabled: false,
    siteKey: '0x4AAAAAAC0oZNPOgKJfqPG7'
  }
} as const;
