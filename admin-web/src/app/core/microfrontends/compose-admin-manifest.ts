import { AdminAppManifest, AdminBranding, AdminFeatureManifest } from './admin-app.manifest';

interface ComposeAdminManifestOptions {
  appId: string;
  branding: AdminBranding;
  features: AdminFeatureManifest[];
}

export function composeAdminManifest(options: ComposeAdminManifestOptions): AdminAppManifest {
  return {
    appId: options.appId,
    branding: options.branding,
    features: options.features,
    navigation: options.features.flatMap(feature => feature.navigation ?? []),
    publicRoutes: options.features.flatMap(feature => feature.publicRoutes ?? []),
    protectedRoutes: options.features.flatMap(feature => feature.protectedRoutes ?? []),
    dashboardQuickActions: options.features.flatMap(feature => feature.dashboardQuickActions ?? [])
  };
}
