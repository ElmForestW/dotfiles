user_pref("toolkit.telemetry.enabled", false);
user_pref("identity.fxaccounts.enabled", false);
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Use CRLs instead of OCSP
// https://letsencrypt.org/2025/08/06/ocsp-service-has-reached-end-of-life
user_pref("security.OCSP.enabled", 0);
user_pref("security.pki.crlite_mode", 2);
