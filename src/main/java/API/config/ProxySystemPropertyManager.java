package API.config;

public class ProxySystemPropertyManager {

    private static final String[] PROPERTY_KEYS = {
            "proxyHost",
            "proxyPort",
            "proxyUser",
            "proxyPassword",
    };

    private static final String[] PROPERTY_VALUES = {
            "172.31.53.99",
            "8080",
            "srvc.pntest",
            "0z+jswpcqrunftyzldMpyrfmu1",
    };

    public static void clearProxySystemProperties() {
        for (String key : PROPERTY_KEYS) {
            System.clearProperty(key);
        }
    }

    public static void setProxySystemProperties() {
        for (int i=0; i < PROPERTY_KEYS.length; i++)
            System.setProperty(PROPERTY_KEYS[i], PROPERTY_VALUES[i]);
    }
}
