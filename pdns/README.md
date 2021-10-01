# PowerDNS

This image contains the PowerDNS DNS Server without the additional required MySQL container. 


# Environment variables

To specify the MySQL host, please use the following environment variables:


|                |Environment name               |Default value  / allowed     |
|----------------|-------------------------------|-----------------------------|
|MySQL Host 	 |`PDNSCONF_GMYSQL_HOST`         |''            			   |
|MySQL User 	 |`PDNSCONF_GMYSQL_USER`         |''            			   |
|MySQL Password  |`PDNSCONF_GMYSQL_PASSWORD`     |''            			   |
|MySQL Database  |`PDNSCONF_GMYSQL_DBNAME`       |''            			   |
|Enable DNSSEC   |`PDNSCONF_GMYSQL_DNSSEC`       |"yes" (default) / "no"       |
|PDNS API KEY*   |`PDNSCONF_API_KEY`             |""       				       |
|Secure zones**  |`SECALLZONES_CRONJOB`          |"yes" / "no" (default)       |

*)   PowerDNS API will only be enabled if an API Key is set
**) Setting this variable to "yes" will result in a cronjob that will run once every 30 minutes. The job will secure all zones.

# Ports

|Port |Stack |Purpose           |
| --  | --   |--                |
|53    |TCP   |DNS Resolving    |
|53    |UDP  |DNS Resolving		|
|8081  |TCP  |PowerDNS API		|