import { buildAdminAppRoutes } from './core/microfrontends/build-admin-app-routes';
import { currentAdminManifest } from './current-admin.manifest';

export const appRoutes = buildAdminAppRoutes(currentAdminManifest);
